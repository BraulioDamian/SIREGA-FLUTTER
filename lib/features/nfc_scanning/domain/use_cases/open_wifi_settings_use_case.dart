import 'package:sirega_app/features/nfc_scanning/domain/repositories/esp32_repository.dart';

class OpenWifiSettingsUseCase {
  final Esp32Repository _repository;

  OpenWifiSettingsUseCase(this._repository);

  Future<void> execute() {
    return _repository.openWifiSettings();
  }
}
