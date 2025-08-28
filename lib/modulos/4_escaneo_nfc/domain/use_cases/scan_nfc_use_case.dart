import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/nfc_repository.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';

class ScanNfcUseCase {
  final NfcRepository _repository;

  ScanNfcUseCase(this._repository);

  Future<Animal?> execute() {
    return _repository.scanNfc();
  }
}
