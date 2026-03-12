import 'package:sirega_app/features/nfc_scanning/domain/repositories/nfc_repository.dart';

class FinishNfcScanUseCase {
  final NfcRepository _nfcRepository;

  FinishNfcScanUseCase(this._nfcRepository);

  Future<void> execute() async {
    await _nfcRepository.finishScan();
  }
}
