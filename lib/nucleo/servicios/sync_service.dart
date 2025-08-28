// lib/nucleo/servicios/sync_service.dart
import 'dart:async';
import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/sync_queue.dart';
import 'package:sirega_app/nucleo/modelos/configuracion_local.dart';
import 'package:sirega_app/nucleo/modelos/enums_completo.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

class SyncService {
  static final SyncService _instance = SyncService._internal();
  factory SyncService() => _instance;
  SyncService._internal();
  
  Timer? _syncTimer;
  bool _isSyncing = false;
  final _syncStatusController = StreamController<SyncStatus>.broadcast();
  
  Stream<SyncStatus> get syncStatusStream => _syncStatusController.stream;
  
  // Inicializar el servicio de sincronización
  Future<void> initialize() async {
    final config = await _getConfiguration();
    
    if (config.syncAutomatico) {
      _startPeriodicSync(config.intervaloSyncMinutos);
    }
  }
  
  // Obtener configuración local
  Future<ConfiguracionLocal> _getConfiguration() async {
    final config = await IsarService.isar.configuracionLocals.get(1);
    if (config == null) {
      // Crear configuración por defecto
      final newConfig = ConfiguracionLocal();
      await IsarService.isar.writeTxn(() async {
        await IsarService.isar.configuracionLocals.put(newConfig);
      });
      return newConfig;
    }
    return config;
  }
  
  // Iniciar sincronización periódica
  void _startPeriodicSync(int intervalMinutes) {
    _syncTimer?.cancel();
    _syncTimer = Timer.periodic(
      Duration(minutes: intervalMinutes),
      (_) => syncAll(),
    );
  }
  
  // Detener sincronización periódica
  void stopPeriodicSync() {
    _syncTimer?.cancel();
    _syncTimer = null;
  }
  
  // Sincronización completa
  Future<SyncResult> syncAll() async {
    if (_isSyncing) {
      return SyncResult(
        success: false,
        message: 'Sincronización ya en progreso',
      );
    }
    
    _isSyncing = true;
    _emitStatus(SyncStatus.syncing);
    
    try {
      // 1. Verificar conectividad
      final hasConnection = await _checkConnectivity();
      if (!hasConnection) {
        _emitStatus(SyncStatus.offline);
        return SyncResult(
          success: false,
          message: 'Sin conexión a internet',
        );
      }
      
      // 2. Procesar cola de cambios locales
      final queueResult = await _processQueue();
      
      // 3. Recibir cambios remotos (simulado por ahora)
      // final remoteChanges = await _fetchRemoteChanges();
      
      // 4. Aplicar cambios remotos
      // await _applyRemoteChanges(remoteChanges);
      
      // 5. Actualizar configuración
      await _updateSyncTimestamp();
      
      _emitStatus(SyncStatus.completed);
      
      return SyncResult(
        success: true,
        message: 'Sincronización completada',
        itemsSynced: queueResult.processed,
        itemsFailed: queueResult.failed,
      );
      
    } catch (e) {
      _emitStatus(SyncStatus.error);
      return SyncResult(
        success: false,
        message: 'Error durante sincronización: $e',
      );
    } finally {
      _isSyncing = false;
    }
  }
  
  // Procesar cola de sincronización
  Future<QueueProcessResult> _processQueue() async {
    final queue = await IsarService.isar.syncQueues
        .filter()
        .estadoEqualTo(EstadoSync.pendiente)
        .or()
        .estadoEqualTo(EstadoSync.error)
        .sortByPrioridadDesc()
        .thenByFechaCreacion()
        .findAll();
    
    int processed = 0;
    int failed = 0;
    
    for (final item in queue) {
      if (item.intentos >= item.maxIntentos) {
        await _markAsFailed(item);
        failed++;
        continue;
      }
      
      try {
        // Simular envío a servidor
        await _sendToServer(item);
        await _markAsCompleted(item);
        processed++;
      } catch (e) {
        await _markAsError(item, e.toString());
        failed++;
      }
    }
    
    return QueueProcessResult(processed: processed, failed: failed);
  }
  
  // Enviar elemento al servidor (simulado)
  Future<void> _sendToServer(SyncQueue item) async {
    // Simular latencia de red
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Aquí iría la lógica real de envío a Firebase/servidor
    // Por ahora solo simulamos
    
    // Simular error ocasional para testing
    if (DateTime.now().millisecond % 10 == 0) {
      throw Exception('Error de red simulado');
    }
  }
  
  // Marcar elemento como completado
  Future<void> _markAsCompleted(SyncQueue item) async {
    await IsarService.isar.writeTxn(() async {
      item.estado = EstadoSync.completado;
      item.fechaUltimoIntento = DateTime.now();
      await IsarService.isar.syncQueues.put(item);
    });
  }
  
  // Marcar elemento como error
  Future<void> _markAsError(SyncQueue item, String error) async {
    await IsarService.isar.writeTxn(() async {
      item.estado = EstadoSync.error;
      item.fechaUltimoIntento = DateTime.now();
      item.intentos++;
      item.mensajeError = error;
      item.tiempoEsperaSegundos *= 2; // Backoff exponencial
      await IsarService.isar.syncQueues.put(item);
    });
  }
  
  // Marcar elemento como fallido permanentemente
  Future<void> _markAsFailed(SyncQueue item) async {
    await IsarService.isar.writeTxn(() async {
      item.estado = EstadoSync.cancelado;
      item.mensajeError = 'Máximo número de intentos alcanzado';
      await IsarService.isar.syncQueues.put(item);
    });
  }
  
  // Agregar elemento a la cola de sincronización
  Future<void> addToQueue({
    required TipoOperacion operacion,
    required TipoEntidad entidad,
    required int entidadId,
    required Map<String, dynamic> datos,
    int prioridad = 0,
  }) async {
    final queueItem = SyncQueue()
      ..operacion = operacion
      ..entidad = entidad
      ..entidadId = entidadId
      ..datosJson = jsonEncode(datos)
      ..prioridad = prioridad
      ..estado = EstadoSync.pendiente;
    
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.syncQueues.put(queueItem);
    });
    
    // Si es de alta prioridad, intentar sincronizar inmediatamente
    if (prioridad >= 2) {
      syncAll();
    }
  }
  
  // Verificar conectividad (simulado)
  Future<bool> _checkConnectivity() async {
    // Aquí iría la verificación real de conectividad
    // Por ahora siempre retornamos true
    await Future.delayed(const Duration(milliseconds: 100));
    return true;
  }
  
  // Actualizar timestamp de sincronización
  Future<void> _updateSyncTimestamp() async {
    final config = await _getConfiguration();
    config.ultimaSync = DateTime.now();
    config.ultimaSyncExitosa = DateTime.now();
    config.registrosPendientesSync = await _getPendingCount();
    
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.configuracionLocals.put(config);
    });
  }
  
  // Obtener cantidad de registros pendientes
  Future<int> _getPendingCount() async {
    return await IsarService.isar.syncQueues
        .filter()
        .estadoEqualTo(EstadoSync.pendiente)
        .or()
        .estadoEqualTo(EstadoSync.error)
        .count();
  }
  
  // Emitir estado de sincronización
  void _emitStatus(SyncStatus status) {
    if (!_syncStatusController.isClosed) {
      _syncStatusController.add(status);
    }
  }
  
  // Limpiar cola procesada (mantenimiento)
  Future<void> cleanProcessedQueue() async {
    final cutoffDate = DateTime.now().subtract(const Duration(days: 7));
    
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.syncQueues
          .filter()
          .estadoEqualTo(EstadoSync.completado)
          .fechaCreacionLessThan(cutoffDate)
          .deleteAll();
    });
  }
  
  // Obtener estadísticas de sincronización
  Future<SyncStatistics> getStatistics() async {
    final total = await IsarService.isar.syncQueues.count();
    final pending = await IsarService.isar.syncQueues
        .filter()
        .estadoEqualTo(EstadoSync.pendiente)
        .count();
    final errors = await IsarService.isar.syncQueues
        .filter()
        .estadoEqualTo(EstadoSync.error)
        .count();
    final completed = await IsarService.isar.syncQueues
        .filter()
        .estadoEqualTo(EstadoSync.completado)
        .count();
    
    return SyncStatistics(
      total: total,
      pending: pending,
      errors: errors,
      completed: completed,
    );
  }
  
  // Cancelar sincronización en progreso
  void cancelSync() {
    _isSyncing = false;
    _emitStatus(SyncStatus.cancelled);
  }
  
  // Limpiar recursos
  void dispose() {
    _syncTimer?.cancel();
    _syncStatusController.close();
  }
}

// Clases auxiliares
enum SyncStatus {
  idle,
  syncing,
  completed,
  error,
  offline,
  cancelled,
}

class SyncResult {
  final bool success;
  final String message;
  final int? itemsSynced;
  final int? itemsFailed;
  
  SyncResult({
    required this.success,
    required this.message,
    this.itemsSynced,
    this.itemsFailed,
  });
}

class QueueProcessResult {
  final int processed;
  final int failed;
  
  QueueProcessResult({
    required this.processed,
    required this.failed,
  });
}

class SyncStatistics {
  final int total;
  final int pending;
  final int errors;
  final int completed;
  
  SyncStatistics({
    required this.total,
    required this.pending,
    required this.errors,
    required this.completed,
  });
  
  double get successRate => total > 0 ? completed / total : 0.0;
  bool get hasErrors => errors > 0;
  bool get hasPending => pending > 0;
}
