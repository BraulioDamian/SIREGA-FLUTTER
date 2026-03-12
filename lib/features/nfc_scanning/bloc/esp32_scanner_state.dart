import 'package:equatable/equatable.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/features/nfc_scanning/domain/repositories/esp32_repository.dart';

abstract class Esp32ScannerState extends Equatable {
  final Esp32ConnectionMode connectionMode;

  const Esp32ScannerState({this.connectionMode = Esp32ConnectionMode.ble});

  @override
  List<Object> get props => [connectionMode];
}

class Esp32ScannerInitial extends Esp32ScannerState {
  const Esp32ScannerInitial({super.connectionMode});
}

class Esp32Connecting extends Esp32ScannerState {
  const Esp32Connecting({super.connectionMode});
}

class Esp32Connected extends Esp32ScannerState {
  const Esp32Connected({super.connectionMode});
}

class Esp32AnimalFound extends Esp32ScannerState {
  final Animal animal;
  final int timestamp;

  Esp32AnimalFound(this.animal, {super.connectionMode})
    : timestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [animal, timestamp, connectionMode];
}

class Esp32UidReceived extends Esp32ScannerState {
  final String animalName;

  const Esp32UidReceived(this.animalName, {super.connectionMode});

  @override
  List<Object> get props => [animalName, connectionMode];
}

class Esp32Error extends Esp32ScannerState {
  final String errorMessage;

  const Esp32Error(this.errorMessage, {super.connectionMode});

  @override
  List<Object> get props => [errorMessage, connectionMode];
}

class WifiDisabled extends Esp32ScannerState {
  const WifiDisabled({super.connectionMode});
}

class BluetoothDisabled extends Esp32ScannerState {
  const BluetoothDisabled({super.connectionMode});
}
