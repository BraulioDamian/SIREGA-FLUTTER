import 'package:equatable/equatable.dart';

abstract class Esp32ScannerState extends Equatable {
  const Esp32ScannerState();

  @override
  List<Object> get props => [];
}

class Esp32ScannerInitial extends Esp32ScannerState {}

class Esp32Connecting extends Esp32ScannerState {}

class Esp32Connected extends Esp32ScannerState {}

class Esp32UidReceived extends Esp32ScannerState {
  final String animalName;

  const Esp32UidReceived(this.animalName);

  @override
  List<Object> get props => [animalName];
}

class Esp32Error extends Esp32ScannerState {
  final String errorMessage;

  const Esp32Error(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class WifiDisabled extends Esp32ScannerState {}
