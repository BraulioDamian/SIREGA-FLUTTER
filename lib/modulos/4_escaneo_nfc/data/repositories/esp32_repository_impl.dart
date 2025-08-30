import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/esp32_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/esp32_repository.dart';

class Esp32RepositoryImpl implements Esp32Repository {
  final Esp32Service _esp32service;

  Esp32RepositoryImpl(this._esp32service);

  @override
  Future<Stream<String>> connectToEsp32() async {
    final wifiEnabled = await _esp32service.isWifiEnabled();
    if (!wifiEnabled) {
      throw Exception('WiFi desactivado. Activa el WiFi para conectar con el ESP32.');
    }
    
    // La URL del ESP32 en modo Access Point con el path /ws
    return _esp32service.connectToEsp32('ws://192.168.4.1/ws');
  }
  
  @override
  Future<void> openWifiSettings() async {
    return _esp32service.openWifiSettings();
  }
  
  @override
  void disconnect() {
    _esp32service.disconnect();
  }
}
