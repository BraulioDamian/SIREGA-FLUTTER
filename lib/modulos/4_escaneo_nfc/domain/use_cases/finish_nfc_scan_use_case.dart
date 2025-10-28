import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/nfc_repository.dart';

class FinishNfcScanUseCase {
  final NfcRepository _nfcRepository;

  FinishNfcScanUseCase(this._nfcRepository);

  Future<void> execute() async {
    await _nfcRepository.finishScan();
  }
}
