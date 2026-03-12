import 'package:sirega_app/features/nfc_scanning/data/services/esp32_service.dart';
import 'package:sirega_app/features/nfc_scanning/data/services/esp32_ble_service.dart';
import 'package:sirega_app/features/nfc_scanning/domain/repositories/esp32_repository.dart';

class Esp32RepositoryImpl implements Esp32Repository {
  final Esp32Service _wifiService;
  final Esp32BleService _bleService;

  Esp32ConnectionMode _mode;

  Esp32RepositoryImpl(
    this._wifiService,
    this._bleService, {
    Esp32ConnectionMode initialMode = Esp32ConnectionMode.ble,
  }) : _mode = initialMode;

  @override
  Esp32ConnectionMode get connectionMode => _mode;

  @override
  set connectionMode(Esp32ConnectionMode mode) {
    if (_mode != mode) {
      disconnect();
      _mode = mode;
    }
  }

  @override
  Future<Stream<String>> connectToEsp32() async {
    if (_mode == Esp32ConnectionMode.ble) {
      return _bleService.connect();
    }

    // Modo WiFi (original)
    final wifiEnabled = await _wifiService.isWifiEnabled();
    if (!wifiEnabled) {
      throw Exception(
        'WiFi desactivado. Activa el WiFi para conectar con el ESP32.',
      );
    }
    return _wifiService.connectToEsp32('ws://192.168.4.1/ws');
  }

  @override
  Future<void> openWifiSettings() async {
    return _wifiService.openWifiSettings();
  }

  @override
  void disconnect() {
    if (_mode == Esp32ConnectionMode.ble) {
      _bleService.disconnect();
    } else {
      _wifiService.disconnect();
    }
  }
}
