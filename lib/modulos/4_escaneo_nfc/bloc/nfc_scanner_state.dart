import 'package:equatable/equatable.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';

abstract class NfcScannerState extends Equatable {
  const NfcScannerState();

  @override
  List<Object> get props => [];
}

class NfcScannerInitial extends NfcScannerState {}

class NfcScanning extends NfcScannerState {}

class NfcAnimalFound extends NfcScannerState {
  final Animal animal;

  const NfcAnimalFound(this.animal);

  @override
  List<Object> get props => [animal];
}

class NfcScanSuccess extends NfcScannerState {
  final String animalName;

  const NfcScanSuccess(this.animalName);

  @override
  List<Object> get props => [animalName];
}

class NfcScanError extends NfcScannerState {
  final String errorMessage;

  const NfcScanError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class NfcNotAvailable extends NfcScannerState {}

class NfcDisabled extends NfcScannerState {}
