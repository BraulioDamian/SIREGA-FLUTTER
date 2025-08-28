import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/esp32_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/esp32_repository.dart';

class Esp32RepositoryImpl implements Esp32Repository {
  final Esp32Service _esp32service;

  Esp32RepositoryImpl(this._esp32service);

  @override
  Future<Stream<String>> connectToEsp32() async {
    final wifiEnabled = await _esp32service.isWifiEnabled();
    if (!wifiEnabled) {
      // TODO: Open wifi settings
      throw Exception('WiFi desactivado');
    }
    // La URL del ESP32 en modo Access Point con el path /ws
    return _esp32service.connectToEsp32('ws://192.168.4.1/ws');
  }
}
