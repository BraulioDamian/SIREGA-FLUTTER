import 'package:equatable/equatable.dart';
import 'package:sirega_app/features/nfc_scanning/domain/repositories/esp32_repository.dart';

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

class ChangeConnectionModeEvent extends Esp32ScannerEvent {
  final Esp32ConnectionMode mode;

  const ChangeConnectionModeEvent(this.mode);

  @override
  List<Object> get props => [mode];
}
