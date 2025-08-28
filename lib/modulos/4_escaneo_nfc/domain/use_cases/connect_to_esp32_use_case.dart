import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/esp32_repository.dart';

class ConnectToEsp32UseCase {
  final Esp32Repository _repository;

  ConnectToEsp32UseCase(this._repository);

  Future<Stream<String>> execute() {
    return _repository.connectToEsp32();
  }
}
