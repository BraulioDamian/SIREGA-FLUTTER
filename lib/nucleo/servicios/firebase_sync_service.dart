// lib/nucleo/servicios/firebase_sync_service.dart
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/herd_model.dart';
import 'package:sirega_app/nucleo/modelos/lote_evento_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

/// Servicio de sincronización bidireccional Isar ↔ Firestore
/// Maneja la lógica offline-first y resolución de conflictos
class FirebaseSyncService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final IsarService _isarService;

  // Listeners de Firestore
  StreamSubscription? _animalsListener;
  StreamSubscription? _eventsListener;
  StreamSubscription? _productionsListener;
  StreamSubscription? _herdsListener;
  StreamSubscription? _batchEventsListener;

  // Control de sincronización
  bool _isSyncing = false;
  bool _isInitialized = false;

  // Callbacks
  Function(String message)? onSyncStart;
  Function(String message)? onSyncComplete;
  Function(String error)? onSyncError;
  Function(int pending)? onPendingCountChanged;

  FirebaseSyncService(this._isarService);

  /// Usuario actual
  String? get userId => _auth.currentUser?.uid;

  /// Verificar si hay usuario autenticado
  bool get isAuthenticated => userId != null;

  /// Inicializar sincronización
  /// Se debe llamar después del login exitoso
  Future<void> init() async {
    if (!isAuthenticated) {
      throw Exception('Usuario no autenticado');
    }

    if (_isInitialized) return;

    // Realizar sincronización inicial (descargar datos)
    await syncInitial();

    // Iniciar listeners de tiempo real
    _startRealtimeListeners();

    _isInitialized = true;
  }

  /// Sincronización inicial: Descargar todos los datos del usuario
  /// Se ejecuta una vez después del login
  Future<void> syncInitial() async {
    try {
      onSyncStart?.call('Descargando datos del servidor...');

      await _downloadAnimals();
      await _downloadEvents();
      await _downloadProductions();
      await _downloadHerds();
      await _downloadBatchEvents();

      onSyncComplete?.call('Datos descargados correctamente');
    } catch (e) {
      onSyncError?.call('Error en sincronización inicial: $e');
      rethrow;
    }
  }

  /// Sincronizar cambios pendientes (local → nube)
  /// Se ejecuta automáticamente cuando hay internet
  Future<void> syncPendingChanges() async {
    if (_isSyncing || !isAuthenticated) return;

    _isSyncing = true;

    try {
      onSyncStart?.call('Sincronizando cambios...');

      await _uploadPendingAnimals();
      await _uploadPendingEvents();
      await _uploadPendingProductions();
      await _uploadPendingHerds();
      await _uploadPendingBatchEvents();

      final pending = await getPendingCount();
      onPendingCountChanged?.call(pending);

      onSyncComplete?.call('Sincronización completada');
    } catch (e) {
      onSyncError?.call('Error al sincronizar: $e');
    } finally {
      _isSyncing = false;
    }
  }

  /// Obtener cantidad de registros pendientes de sincronizar
  Future<int> getPendingCount() async {
    final animals = await IsarService.isar.animals
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .count();

    final events = await IsarService.isar.eventoSanitarios
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .count();

    final productions = await IsarService.isar.registroProduccions
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .count();

    final herds = await IsarService.isar.herds
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .count();

    final batchEvents = await IsarService.isar.loteEventos
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .count();

    return animals + events + productions + herds + batchEvents;
  }

  // ========== DESCARGAS (Nube → Local) ==========

  Future<void> _downloadAnimals() async {
    final snapshot = await _firestore
        .collection('users/$userId/cattle')
        .get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await _createOrUpdateLocalAnimal(doc.id, doc.data());
      }
    });
  }

  Future<void> _downloadEvents() async {
    final snapshot = await _firestore
        .collection('users/$userId/events')
        .get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await _createOrUpdateLocalEvent(doc.id, doc.data());
      }
    });
  }

  Future<void> _downloadProductions() async {
    final snapshot = await _firestore
        .collection('users/$userId/productions')
        .get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await _createOrUpdateLocalProduction(doc.id, doc.data());
      }
    });
  }

  Future<void> _downloadHerds() async {
    final snapshot = await _firestore
        .collection('users/$userId/herds')
        .get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await _createOrUpdateLocalHerd(doc.id, doc.data());
      }
    });
  }

  Future<void> _downloadBatchEvents() async {
    final snapshot = await _firestore
        .collection('users/$userId/batch_events')
        .get();

    await IsarService.isar.writeTxn(() async {
      for (final doc in snapshot.docs) {
        await _createOrUpdateLocalBatchEvent(doc.id, doc.data());
      }
    });
  }

  // ========== SUBIDAS (Local → Nube) ==========

  Future<void> _uploadPendingAnimals() async {
    final pending = await IsarService.isar.animals
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final animal in pending) {
      try {
        final data = _animalToMap(animal);

        if (animal.serverId == null) {
          // Crear nuevo en Firestore
          final docRef = await _firestore
              .collection('users/$userId/cattle')
              .add(data);

          // Actualizar local con serverId
          animal.serverId = docRef.id;
        } else {
          // Actualizar existente
          await _firestore
              .collection('users/$userId/cattle')
              .doc(animal.serverId)
              .set(data, SetOptions(merge: true));
        }

        // Marcar como sincronizado
        animal.estadoSync = EstadoSync.completado;
        await IsarService.isar.writeTxn(() => IsarService.isar.animals.put(animal));
      } catch (e) {
        animal.estadoSync = EstadoSync.error;
        await IsarService.isar.writeTxn(() => IsarService.isar.animals.put(animal));
      }
    }
  }

  Future<void> _uploadPendingEvents() async {
    final pending = await IsarService.isar.eventoSanitarios
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final event in pending) {
      try {
        final data = _eventToMap(event);

        if (event.serverId == null) {
          final docRef = await _firestore
              .collection('users/$userId/events')
              .add(data);
          event.serverId = docRef.id;
        } else {
          await _firestore
              .collection('users/$userId/events')
              .doc(event.serverId)
              .set(data, SetOptions(merge: true));
        }

        event.estadoSync = EstadoSync.completado;
        await IsarService.isar.writeTxn(() =>
            IsarService.isar.eventoSanitarios.put(event));
      } catch (e) {
        event.estadoSync = EstadoSync.error;
        await IsarService.isar.writeTxn(() =>
            IsarService.isar.eventoSanitarios.put(event));
      }
    }
  }

  Future<void> _uploadPendingProductions() async {
    final pending = await IsarService.isar.registroProduccions
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final production in pending) {
      try {
        final data = _productionToMap(production);

        if (production.serverId == null) {
          final docRef = await _firestore
              .collection('users/$userId/productions')
              .add(data);
          production.serverId = docRef.id;
        } else {
          await _firestore
              .collection('users/$userId/productions')
              .doc(production.serverId)
              .set(data, SetOptions(merge: true));
        }

        production.estadoSync = EstadoSync.completado;
        await IsarService.isar.writeTxn(() =>
            IsarService.isar.registroProduccions.put(production));
      } catch (e) {
        production.estadoSync = EstadoSync.error;
        await IsarService.isar.writeTxn(() =>
            IsarService.isar.registroProduccions.put(production));
      }
    }
  }

  Future<void> _uploadPendingHerds() async {
    final pending = await IsarService.isar.herds
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final herd in pending) {
      try {
        final data = _herdToMap(herd);

        if (herd.serverId == null) {
          final docRef = await _firestore
              .collection('users/$userId/herds')
              .add(data);
          herd.serverId = docRef.id;
        } else {
          await _firestore
              .collection('users/$userId/herds')
              .doc(herd.serverId)
              .set(data, SetOptions(merge: true));
        }

        herd.estadoSync = EstadoSync.completado;
        await IsarService.isar.writeTxn(() => IsarService.isar.herds.put(herd));
      } catch (e) {
        herd.estadoSync = EstadoSync.error;
        await IsarService.isar.writeTxn(() => IsarService.isar.herds.put(herd));
      }
    }
  }

  Future<void> _uploadPendingBatchEvents() async {
    final pending = await IsarService.isar.loteEventos
        .filter()
        .estadoSyncEqualTo(EstadoSync.pendiente)
        .findAll();

    for (final batch in pending) {
      try {
        final data = _batchEventToMap(batch);

        if (batch.serverId == null) {
          final docRef = await _firestore
              .collection('users/$userId/batch_events')
              .add(data);
          batch.serverId = docRef.id;
        } else {
          await _firestore
              .collection('users/$userId/batch_events')
              .doc(batch.serverId)
              .set(data, SetOptions(merge: true));
        }

        batch.estadoSync = EstadoSync.completado;
        await IsarService.isar.writeTxn(() =>
            IsarService.isar.loteEventos.put(batch));
      } catch (e) {
        batch.estadoSync = EstadoSync.error;
        await IsarService.isar.writeTxn(() =>
            IsarService.isar.loteEventos.put(batch));
      }
    }
  }

  // ========== LISTENERS DE TIEMPO REAL ==========

  void _startRealtimeListeners() {
    // Escuchar cambios en animales
    _animalsListener = _firestore
        .collection('users/$userId/cattle')
        .snapshots()
        .listen((snapshot) {
      for (final change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified) {
          _handleRemoteAnimalChange(change.doc);
        }
      }
    });

    // Escuchar cambios en eventos
    _eventsListener = _firestore
        .collection('users/$userId/events')
        .snapshots()
        .listen((snapshot) {
      for (final change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified) {
          _handleRemoteEventChange(change.doc);
        }
      }
    });

    // Escuchar cambios en producciones
    _productionsListener = _firestore
        .collection('users/$userId/productions')
        .snapshots()
        .listen((snapshot) {
      for (final change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified) {
          _handleRemoteProductionChange(change.doc);
        }
      }
    });

    // Escuchar cambios en herds
    _herdsListener = _firestore
        .collection('users/$userId/herds')
        .snapshots()
        .listen((snapshot) {
      for (final change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified) {
          _handleRemoteHerdChange(change.doc);
        }
      }
    });

    // Escuchar cambios en batch events
    _batchEventsListener = _firestore
        .collection('users/$userId/batch_events')
        .snapshots()
        .listen((snapshot) {
      for (final change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified) {
          _handleRemoteBatchEventChange(change.doc);
        }
      }
    });
  }

  // Manejar cambio remoto de animal
  Future<void> _handleRemoteAnimalChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await _createOrUpdateLocalAnimal(doc.id, doc.data() as Map<String, dynamic>);
    });
  }

  Future<void> _handleRemoteEventChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await _createOrUpdateLocalEvent(doc.id, doc.data() as Map<String, dynamic>);
    });
  }

  Future<void> _handleRemoteProductionChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await _createOrUpdateLocalProduction(doc.id, doc.data() as Map<String, dynamic>);
    });
  }

  Future<void> _handleRemoteHerdChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await _createOrUpdateLocalHerd(doc.id, doc.data() as Map<String, dynamic>);
    });
  }

  Future<void> _handleRemoteBatchEventChange(DocumentSnapshot doc) async {
    await IsarService.isar.writeTxn(() async {
      await _createOrUpdateLocalBatchEvent(doc.id, doc.data() as Map<String, dynamic>);
    });
  }

  // ========== CONVERSIONES (Model → Map) ==========

  Map<String, dynamic> _animalToMap(Animal animal) {
    return {
      'nombre': animal.nombre,
      'sexo': animal.sexo.name,
      'raza': animal.raza,
      'fechaNacimiento': Timestamp.fromDate(animal.fechaNacimiento),
      'idAreteNFC': animal.idAreteNFC,
      'nfcChipId': animal.nfcChipId,
      'idAreteVisual': animal.idAreteVisual,
      'numeroHerrado': animal.numeroHerrado,
      'pesoNacimiento': animal.pesoNacimiento,
      'colorPelaje': animal.colorPelaje,
      'estado': animal.estado.name,
      'estadoSalud': animal.estadoSalud.name,
      'descripcionSalud': animal.descripcionSalud,
      'pesoActual': animal.pesoActual,
      'notas': animal.notas,
      'herdId': animal.herd.value?.serverId,
      'padreId': animal.padre.value?.serverId,
      'madreId': animal.madre.value?.serverId,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> _eventToMap(EventoSanitario event) {
    return {
      'tipo': event.tipo.name,
      'fecha': Timestamp.fromDate(event.fecha),
      'nombreProducto': event.nombreProducto,
      'dosis': event.dosis,
      'unidadDosis': event.unidadDosis,
      'veterinario': event.veterinario,
      'notas': event.notas,
      'animalId': event.animal.value?.serverId,
      'loteId': event.loteId,
      'totalAnimalesLote': event.totalAnimalesLote,
      'prioridad': event.prioridad.name,
      'fechaProximaAplicacion': event.fechaProximaAplicacion != null
          ? Timestamp.fromDate(event.fechaProximaAplicacion!)
          : null,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> _productionToMap(RegistroProduccion production) {
    return {
      'tipo': production.tipo,
      'fecha': Timestamp.fromDate(production.fecha),
      'idCria': production.idCria,
      'pesoKg': production.pesoKg,
      'litrosPorDia': production.litrosPorDia,
      'notas': production.notas,
      'animalId': production.animal.value?.serverId,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> _herdToMap(Herd herd) {
    return {
      'nombre': herd.nombre,
      'ownerUid': herd.ownerUid,
      'estado': herd.estado,
      'municipio': herd.municipio,
      'totalCattleCount': herd.totalCattleCount,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> _batchEventToMap(LoteEvento batch) {
    return {
      'loteId': batch.loteId,
      'tipo': batch.tipo.name,
      'fecha': Timestamp.fromDate(batch.fecha),
      'nombreProducto': batch.nombreProducto,
      'cantidadAnimales': batch.cantidadAnimales,
      'animalesIds': batch.animalesIds,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  // ========== CONVERSIONES (Map → Model) ==========

  Future<void> _createOrUpdateLocalAnimal(String serverId, Map<String, dynamic> data) async {
    // Buscar si ya existe localmente
    final existing = await IsarService.isar.animals
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    // Si existe y la versión local es más reciente, no actualizar
    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final animal = existing ?? Animal();
    animal.serverId = serverId;
    animal.nombre = data['nombre'] ?? '';
    animal.sexo = Sexo.values.byName(data['sexo'] ?? 'hembra');
    animal.raza = data['raza'] ?? '';
    animal.fechaNacimiento = (data['fechaNacimiento'] as Timestamp).toDate();
    animal.idAreteNFC = data['idAreteNFC'];
    animal.nfcChipId = data['nfcChipId'];
    animal.idAreteVisual = data['idAreteVisual'];
    animal.numeroHerrado = data['numeroHerrado'];
    animal.pesoNacimiento = data['pesoNacimiento'];
    animal.colorPelaje = data['colorPelaje'];
    animal.estado = EstadoAnimal.values.byName(data['estado'] ?? 'activo');
    animal.estadoSalud = EstadoSalud.values.byName(data['estadoSalud'] ?? 'sano');
    animal.descripcionSalud = data['descripcionSalud'];
    animal.pesoActual = data['pesoActual'];
    animal.notas = data['notas'];
    animal.ultimaActualizacion = remoteUpdatedAt;
    animal.estadoSync = EstadoSync.completado;

    await IsarService.isar.animals.put(animal);
  }

  Future<void> _createOrUpdateLocalEvent(String serverId, Map<String, dynamic> data) async {
    final existing = await IsarService.isar.eventoSanitarios
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final event = existing ?? EventoSanitario();
    event.serverId = serverId;
    event.tipo = TipoEvento.values.byName(data['tipo']);
    event.fecha = (data['fecha'] as Timestamp).toDate();
    event.nombreProducto = data['nombreProducto'];
    event.dosis = data['dosis'];
    event.unidadDosis = data['unidadDosis'];
    event.veterinario = data['veterinario'];
    event.notas = data['notas'];
    event.loteId = data['loteId'];
    event.totalAnimalesLote = data['totalAnimalesLote'];
    event.prioridad = Prioridad.values.byName(data['prioridad'] ?? 'media');
    event.fechaProximaAplicacion = (data['fechaProximaAplicacion'] as Timestamp?)?.toDate();
    event.ultimaActualizacion = remoteUpdatedAt;
    event.estadoSync = EstadoSync.completado;

    await IsarService.isar.eventoSanitarios.put(event);
  }

  Future<void> _createOrUpdateLocalProduction(String serverId, Map<String, dynamic> data) async {
    final existing = await IsarService.isar.registroProduccions
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final production = existing ?? RegistroProduccion();
    production.serverId = serverId;
    production.tipo = data['tipo'] ?? '';
    production.fecha = (data['fecha'] as Timestamp).toDate();
    production.idCria = data['idCria'];
    production.pesoKg = data['pesoKg'];
    production.litrosPorDia = data['litrosPorDia'];
    production.notas = data['notas'];
    production.ultimaActualizacion = remoteUpdatedAt;
    production.estadoSync = EstadoSync.completado;

    await IsarService.isar.registroProduccions.put(production);
  }

  Future<void> _createOrUpdateLocalHerd(String serverId, Map<String, dynamic> data) async {
    final existing = await IsarService.isar.herds
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final herd = existing ?? Herd();
    herd.serverId = serverId;
    herd.nombre = data['nombre'] ?? '';
    herd.ownerUid = data['ownerUid'] ?? '';
    herd.estado = data['estado'] ?? '';
    herd.municipio = data['municipio'] ?? '';
    herd.totalCattleCount = data['totalCattleCount'] ?? 0;
    herd.ultimaActualizacion = remoteUpdatedAt;
    herd.estadoSync = EstadoSync.completado;

    await IsarService.isar.herds.put(herd);
  }

  Future<void> _createOrUpdateLocalBatchEvent(String serverId, Map<String, dynamic> data) async {
    final existing = await IsarService.isar.loteEventos
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final batch = existing ?? LoteEvento();
    batch.serverId = serverId;
    batch.loteId = data['loteId'] ?? '';
    batch.tipo = TipoEvento.values.byName(data['tipo']);
    batch.fecha = (data['fecha'] as Timestamp).toDate();
    batch.nombreProducto = data['nombreProducto'];
    batch.cantidadAnimales = data['cantidadAnimales'] ?? 0;
    batch.animalesIds = List<int>.from(data['animalesIds'] ?? []);
    batch.ultimaActualizacion = remoteUpdatedAt;
    batch.estadoSync = EstadoSync.completado;

    await IsarService.isar.loteEventos.put(batch);
  }

  /// Limpiar listeners al cerrar la app
  void dispose() {
    _animalsListener?.cancel();
    _eventsListener?.cancel();
    _productionsListener?.cancel();
    _herdsListener?.cancel();
    _batchEventsListener?.cancel();
  }
}
