import 'package:equatable/equatable.dart';

abstract class Esp32ScannerEvent extends Equatable {
  const Esp32ScannerEvent();

  @override
  List<Object> get props => [];
}

class ConnectToEsp32Event extends Esp32ScannerEvent {}

class DisconnectFromEsp32Event extends Esp32ScannerEvent {}

class UidReceivedEvent extends Esp32ScannerEvent {
  final String uid;

  const UidReceivedEvent(this.uid);

  @override
  List<Object> get props => [uid];
}

class ResetScannerEvent extends Esp32ScannerEvent {}

class CheckConnectionStatusEvent extends Esp32ScannerEvent {}

class OpenWifiSettingsEvent extends Esp32ScannerEvent {}
