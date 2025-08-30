import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/esp32_repository.dart';

class DisconnectFromEsp32UseCase {
  final Esp32Repository _repository;

  DisconnectFromEsp32UseCase(this._repository);

  void execute() {
    _repository.disconnect();
  }
}
