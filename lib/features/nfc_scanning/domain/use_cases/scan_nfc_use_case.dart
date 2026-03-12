import 'package:sirega_app/features/nfc_scanning/domain/repositories/nfc_repository.dart';
import 'package:sirega_app/core/models/animal_model.dart';

class ScanNfcUseCase {
  final NfcRepository _repository;

  ScanNfcUseCase(this._repository);

  Future<Animal?> execute() {
    return _repository.scanNfc();
  }
}
