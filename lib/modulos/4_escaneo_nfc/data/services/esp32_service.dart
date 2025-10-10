import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:android_intent_plus/android_intent.dart';

class Esp32Service {
  IOWebSocketChannel? _channel;
  StreamController<String>? _streamController;

  Future<bool> isWifiEnabled() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult.contains(ConnectivityResult.wifi);
  }

  Future<bool> canReachEsp32() async {
    try {
      // Verificar si podemos hacer ping al ESP32
      final result = await InternetAddress.lookup('192.168.4.1');
      if (result.isNotEmpty) {
        // Intentar conexión HTTP simple para verificar que el ESP32 esté respondiendo
        final socket = await Socket.connect('192.168.4.1', 80, timeout: const Duration(seconds: 3));
        socket.destroy();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> openWifiSettings() async {
    try {
      const intent = AndroidIntent(
        action: 'android.settings.WIFI_SETTINGS',
      );
      await intent.launch();
    } catch (e) {
      print('Error al abrir configuración WiFi: $e');
      // Fallback: intentar abrir configuración general
      try {
        const fallbackIntent = AndroidIntent(
          action: 'android.settings.SETTINGS',
        );
        await fallbackIntent.launch();
      } catch (e2) {
        print('Error al abrir configuración general: $e2');
      }
    }
  }

  Future<Stream<String>> connectToEsp32(String url) async {
    try {
      // Verificar primero si el ESP32 es accesible
      final canReach = await canReachEsp32();
      if (!canReach) {
        // Abrir automáticamente la configuración WiFi
        await openWifiSettings();
        throw Esp32ConnectionException('No se puede conectar con el dispositivo ESP32.\n\nSe ha abierto la configuración de WiFi para que:\n• Te conectes a la red "ESP32-NFC"\n• Verifiques que el ESP32 esté encendido\n\nDespués regresa a la app e intenta conectar nuevamente.');
      }

      _streamController = StreamController<String>();
      _channel = IOWebSocketChannel.connect(
        url,
        connectTimeout: const Duration(seconds: 5),
      );

      // Escuchar la conexión
      _channel!.stream.listen(
        (data) {
          if (_streamController != null && !_streamController!.isClosed) {
            // Hacer vibrar el dispositivo cuando se recibe un escaneo
            _triggerVibration();
            _streamController!.add(data.toString());
          }
        },
        onError: (error) {
          if (_streamController != null && !_streamController!.isClosed) {
            String friendlyError = _mapWebSocketError(error);
            _streamController!.addError(Esp32ConnectionException(friendlyError));
          }
        },
        onDone: () {
          if (_streamController != null && !_streamController!.isClosed) {
            _streamController!.addError(
              Esp32ConnectionException('La conexión con el ESP32 se ha perdido. Intenta reconectar.')
            );
          }
        },
      );

      return _streamController!.stream;
    } catch (e) {
      if (e is Esp32ConnectionException) {
        rethrow;
      }
      throw Esp32ConnectionException(_mapWebSocketError(e));
    }
  }

  String _mapWebSocketError(dynamic error) {
    String errorString = error.toString().toLowerCase();
    
    if (errorString.contains('websocketchannelexception') || 
        errorString.contains('websocket')) {
      return 'Error de conexión con el ESP32. Verifica que:\n• El dispositivo ESP32 esté encendido\n• Estés conectado a la red WiFi "ESP32-NFC"\n• El dispositivo esté dentro del rango';
    }
    
    if (errorString.contains('timeout') || errorString.contains('timed out')) {
      return 'Tiempo de espera agotado. El ESP32 no responde.\nVerifica la conexión WiFi.';
    }
    
    if (errorString.contains('network') || errorString.contains('connection refused')) {
      return 'No se puede conectar al ESP32.\nAsegúrate de estar conectado a la red "ESP32-NFC"';
    }
    
    if (errorString.contains('host lookup failed') || errorString.contains('no address associated')) {
      return 'No se encuentra el dispositivo ESP32.\nVerifica que esté encendido y en rango.';
    }
    
    // Error genérico más amigable
    return 'Error de conexión con el ESP32.\nIntenta reconectar el dispositivo.';
  }

  Future<void> _triggerVibration() async {
    try {
      // Usar feedback háptico nativo de Flutter
      // Esto es compatible con todas las versiones y no requiere dependencias externas
      await HapticFeedback.lightImpact();
    } catch (e) {
      // Si hay error con la vibración, no hacer nada (no es crítico)
      print('Error al vibrar: $e');
    }
  }

  void disconnect() {
    _channel?.sink.close();
    _streamController?.close();
    _channel = null;
    _streamController = null;
  }
}

// Excepción personalizada para errores de ESP32
class Esp32ConnectionException implements Exception {
  final String message;
  
  Esp32ConnectionException(this.message);
  
  @override
  String toString() => message;
}
