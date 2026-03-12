// lib/nucleo/servicios/connection_service.dart
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Servicio para detectar y monitorear la conexión a internet
class ConnectionService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  /// Stream que emite true cuando hay conexión, false cuando no
  final _connectionController = StreamController<bool>.broadcast();
  Stream<bool> get connectionStream => _connectionController.stream;

  /// Estado actual de conexión
  bool _isConnected = false;
  bool get isConnected => _isConnected;

  /// Callback que se ejecuta cuando se detecta conexión
  Function? onConnected;

  /// Callback que se ejecuta cuando se pierde la conexión
  Function? onDisconnected;

  /// Iniciar el monitoreo de conexión
  Future<void> init() async {
    // Verificar conexión inicial
    await checkConnection();

    // Escuchar cambios en la conexión
    _subscription = _connectivity.onConnectivityChanged.listen(
      _handleConnectivityChange,
    );
  }

  /// Verificar conexión actual
  Future<bool> checkConnection() async {
    final results = await _connectivity.checkConnectivity();
    final wasConnected = _isConnected;
    _isConnected = _hasConnection(results);

    // Emitir estado
    _connectionController.add(_isConnected);

    // Ejecutar callbacks si cambió el estado
    if (_isConnected && !wasConnected) {
      onConnected?.call();
    } else if (!_isConnected && wasConnected) {
      onDisconnected?.call();
    }

    return _isConnected;
  }

  /// Manejar cambios de conectividad
  void _handleConnectivityChange(List<ConnectivityResult> results) {
    final wasConnected = _isConnected;
    _isConnected = _hasConnection(results);

    // Emitir nuevo estado
    _connectionController.add(_isConnected);

    // Ejecutar callbacks si cambió
    if (_isConnected && !wasConnected) {
      debugPrint('📡 Conexión a internet detectada');
      onConnected?.call();
    } else if (!_isConnected && wasConnected) {
      debugPrint('📡 Conexión a internet perdida');
      onDisconnected?.call();
    }
  }

  /// Determinar si hay conexión basado en los resultados
  bool _hasConnection(List<ConnectivityResult> results) {
    // Si hay cualquier tipo de conexión (WiFi, Mobile, Ethernet)
    return results.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet,
    );
  }

  /// Obtener descripción del tipo de conexión
  String getConnectionType() {
    if (!_isConnected) return 'Sin conexión';

    // Esto es síncrono basado en el último estado conocido
    return 'Conectado';
  }

  /// Disponer recursos
  void dispose() {
    _subscription?.cancel();
    _connectionController.close();
  }
}
