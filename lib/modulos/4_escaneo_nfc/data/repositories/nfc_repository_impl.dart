import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/animal_database_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/nfc_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/nfc_repository.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';

class NfcRepositoryImpl implements NfcRepository {
  final NfcService _nfcService;
  final AnimalDatabaseService _dbService;

  NfcRepositoryImpl(this._nfcService, this._dbService);

  @override
  Future<Animal?> scanNfc() async {
    final availability = await _nfcService.checkNfcAvailability();
    if (availability == NFCAvailability.not_supported) {
      throw Exception('NFC no soportado');
    }
    if (availability == NFCAvailability.disabled) {
      _nfcService.openNfcSettings();
      throw Exception('NFC desactivado');
    }

    final nfcId = await _nfcService.readNfcTag();
    return await _dbService.findAnimalByNfcId(nfcId);
  }

  @override
  Future<void> finishScan() async {
    await _nfcService.finishScan();
  }
}
