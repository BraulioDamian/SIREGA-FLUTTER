import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

/// UUIDs del servicio BLE del ESP32 (Nordic UART Service)
/// Deben coincidir con los definidos en el firmware del ESP32.
class BleUuids {
  static final Guid service = Guid('6e400001-b5a3-f393-e0a9-e50e24dcca9e');
  static final Guid txCharacteristic =
      Guid('6e400003-b5a3-f393-e0a9-e50e24dcca9e');
}

class Esp32BleService {
  static const String _deviceName = 'SIREGA-NFC';

  BluetoothDevice? _device;
  StreamController<String>? _streamController;
  StreamSubscription? _scanSubscription;
  StreamSubscription? _connectionSubscription;
  StreamSubscription? _characteristicSubscription;

  Future<bool> isBluetoothOn() async {
    final state = await FlutterBluePlus.adapterState.first;
    return state == BluetoothAdapterState.on;
  }

  Future<Stream<String>> connect() async {
    final btOn = await isBluetoothOn();
    if (!btOn) {
      throw Esp32BleException(
        'Bluetooth está desactivado.\nActiva el Bluetooth para conectar con el ESP32.',
      );
    }

    _streamController = StreamController<String>();

    try {
      _device = await _scanAndConnect();

      final services = await _device!.discoverServices();
      final nfcService = services.firstWhere(
        (s) => s.serviceUuid == BleUuids.service,
        orElse: () => throw Esp32BleException(
          'Servicio NFC no encontrado en el dispositivo.\n'
          'Verifica que el firmware del ESP32 esté actualizado.',
        ),
      );

      final txChar = nfcService.characteristics.firstWhere(
        (c) => c.characteristicUuid == BleUuids.txCharacteristic,
        orElse: () => throw Esp32BleException(
          'Característica NFC no encontrada en el dispositivo.',
        ),
      );

      // Suscribirse a notificaciones
      await txChar.setNotifyValue(true);
      _characteristicSubscription = txChar.onValueReceived.listen(
        (value) {
          if (_streamController != null && !_streamController!.isClosed) {
            final uid = String.fromCharCodes(value).trim();
            if (uid.isNotEmpty) {
              _triggerVibration();
              _streamController!.add(uid);
            }
          }
        },
        onError: (error) {
          if (_streamController != null && !_streamController!.isClosed) {
            _streamController!.addError(
              Esp32BleException('Error al recibir datos: $error'),
            );
          }
        },
      );

      // Monitorear desconexión
      _connectionSubscription = _device!.connectionState.listen((state) {
        if (state == BluetoothConnectionState.disconnected) {
          if (_streamController != null && !_streamController!.isClosed) {
            _streamController!.addError(
              Esp32BleException(
                'Se perdió la conexión BLE con el ESP32.\nIntenta reconectar.',
              ),
            );
          }
        }
      });

      return _streamController!.stream;
    } catch (e) {
      disconnect();
      if (e is Esp32BleException) rethrow;
      throw Esp32BleException(_mapBleError(e));
    }
  }

  Future<BluetoothDevice> _scanAndConnect() async {
    // Primero verificar si ya está conectado
    final connected = FlutterBluePlus.connectedDevices;
    for (final device in connected) {
      if (device.platformName == _deviceName) {
        return device;
      }
    }

    // Escanear
    final completer = Completer<BluetoothDevice>();

    await FlutterBluePlus.startScan(
      withNames: [_deviceName],
      timeout: const Duration(seconds: 10),
    );

    _scanSubscription = FlutterBluePlus.scanResults.listen((results) {
      for (final result in results) {
        if (result.device.platformName == _deviceName) {
          if (!completer.isCompleted) {
            FlutterBluePlus.stopScan();
            completer.complete(result.device);
          }
          return;
        }
      }
    });

    // Timeout handler
    FlutterBluePlus.isScanning.listen((scanning) {
      if (!scanning && !completer.isCompleted) {
        completer.completeError(
          Esp32BleException(
            'No se encontró el dispositivo "$_deviceName".\n\n'
            'Verifica que:\n'
            '• El ESP32 esté encendido\n'
            '• Esté en modo BLE\n'
            '• Esté dentro del rango (~10m)',
          ),
        );
      }
    });

    final device = await completer.future;
    _scanSubscription?.cancel();
    _scanSubscription = null;

    await device.connect(timeout: const Duration(seconds: 10));
    return device;
  }

  String _mapBleError(dynamic error) {
    final msg = error.toString().toLowerCase();

    if (msg.contains('timeout') || msg.contains('timed out')) {
      return 'Tiempo de espera agotado buscando el ESP32.\n'
          'Verifica que esté encendido y cercano.';
    }
    if (msg.contains('not found') || msg.contains('no device')) {
      return 'No se encontró el dispositivo ESP32.\n'
          'Verifica que esté encendido y en modo BLE.';
    }
    if (msg.contains('permission')) {
      return 'Se necesitan permisos de Bluetooth y Ubicación.\n'
          'Otorga los permisos en la configuración del sistema.';
    }
    return 'Error de conexión BLE con el ESP32.\nIntenta reconectar.';
  }

  Future<void> _triggerVibration() async {
    try {
      await HapticFeedback.lightImpact();
    } catch (e) {
      debugPrint('Error al vibrar: $e');
    }
  }

  void disconnect() {
    _characteristicSubscription?.cancel();
    _characteristicSubscription = null;
    _connectionSubscription?.cancel();
    _connectionSubscription = null;
    _scanSubscription?.cancel();
    _scanSubscription = null;
    _device?.disconnect();
    _device = null;
    _streamController?.close();
    _streamController = null;
  }
}

class Esp32BleException implements Exception {
  final String message;
  Esp32BleException(this.message);

  @override
  String toString() => message;
}
