import 'package:equatable/equatable.dart';

abstract class NfcScannerEvent extends Equatable {
  const NfcScannerEvent();

  @override
  List<Object> get props => [];
}

class ScanNfcEvent extends NfcScannerEvent {}

class ResetNfcScannerEvent extends NfcScannerEvent {}
