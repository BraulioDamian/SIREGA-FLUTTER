import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_state.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/finish_nfc_scan_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/scan_nfc_use_case.dart';

class NfcScannerBloc extends Bloc<NfcScannerEvent, NfcScannerState> {
  final ScanNfcUseCase _scanNfcUseCase;
  final FinishNfcScanUseCase _finishNfcScanUseCase;

  NfcScannerBloc(this._scanNfcUseCase, this._finishNfcScanUseCase) : super(NfcScannerInitial()) {
    on<ScanNfcEvent>(_onScanNfcEvent);
    on<ResetNfcScannerEvent>(_onResetNfcScannerEvent);
  }

  Future<void> _onScanNfcEvent(
      ScanNfcEvent event, Emitter<NfcScannerState> emit) async {
    emit(NfcScanning());
    try {
      final animal = await _scanNfcUseCase.execute();
      if (animal != null) {
        emit(NfcAnimalFound(animal));
      } else {
        emit(const NfcScanError('No se encontró ningún animal con ese UID.'));
      }
    } catch (e) {
      if (e.toString().contains('NFC no soportado')) {
        emit(NfcNotAvailable());
      } else if (e.toString().contains('NFC desactivado')) {
        emit(NfcDisabled());
      } else {
        emit(NfcScanError(e.toString()));
      }
    }
  }

  Future<void> _onResetNfcScannerEvent(
      ResetNfcScannerEvent event, Emitter<NfcScannerState> emit) async {
    await _finishNfcScanUseCase.execute();
    emit(NfcScannerInitial());
  }
}
