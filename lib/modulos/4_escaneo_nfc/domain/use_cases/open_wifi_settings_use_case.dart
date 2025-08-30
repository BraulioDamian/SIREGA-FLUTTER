import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/esp32_repository.dart';

class OpenWifiSettingsUseCase {
  final Esp32Repository _repository;

  OpenWifiSettingsUseCase(this._repository);

  Future<void> execute() {
    return _repository.openWifiSettings();
  }
}
