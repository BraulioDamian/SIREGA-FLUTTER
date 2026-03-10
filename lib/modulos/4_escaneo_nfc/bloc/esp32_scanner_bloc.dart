import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_state.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/esp32_repository.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/connect_to_esp32_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/disconnect_from_esp32_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/open_wifi_settings_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/find_animal_by_uid_use_case.dart';

class Esp32ScannerBloc extends Bloc<Esp32ScannerEvent, Esp32ScannerState> {
  final ConnectToEsp32UseCase _connectToEsp32UseCase;
  final DisconnectFromEsp32UseCase _disconnectFromEsp32UseCase;
  final FindAnimalByUidUseCase _findAnimalByUidUseCase;
  final OpenWifiSettingsUseCase _openWifiSettingsUseCase;
  final Esp32Repository _repository;

  Stream<String>? _esp32Stream;
  bool _isConnected = false;

  Esp32ConnectionMode get _currentMode => _repository.connectionMode;

  Esp32ScannerBloc(
    this._connectToEsp32UseCase,
    this._disconnectFromEsp32UseCase,
    this._findAnimalByUidUseCase,
    this._openWifiSettingsUseCase,
    this._repository,
  ) : super(Esp32ScannerInitial(connectionMode: Esp32ConnectionMode.ble)) {
    on<ConnectToEsp32Event>(_onConnectToEsp32Event);
    on<DisconnectFromEsp32Event>(_onDisconnectFromEsp32Event);
    on<UidReceivedEvent>(_onUidReceivedEvent);
    on<ResetScannerEvent>(_onResetScannerEvent);
    on<CheckConnectionStatusEvent>(_onCheckConnectionStatus);
    on<OpenWifiSettingsEvent>(_onOpenWifiSettingsEvent);
    on<ChangeConnectionModeEvent>(_onChangeConnectionMode);

    add(CheckConnectionStatusEvent());
  }

  Future<void> _onCheckConnectionStatus(
    CheckConnectionStatusEvent event,
    Emitter<Esp32ScannerState> emit,
  ) async {
    if (_isConnected) {
      emit(Esp32Connected(connectionMode: _currentMode));
    } else {
      emit(Esp32ScannerInitial(connectionMode: _currentMode));
    }
  }

  Future<void> _onChangeConnectionMode(
    ChangeConnectionModeEvent event,
    Emitter<Esp32ScannerState> emit,
  ) async {
    if (_isConnected) {
      _disconnectFromEsp32UseCase.execute();
      _isConnected = false;
      _esp32Stream = null;
    }
    _repository.connectionMode = event.mode;
    emit(Esp32ScannerInitial(connectionMode: event.mode));
  }

  Future<void> _onConnectToEsp32Event(
    ConnectToEsp32Event event,
    Emitter<Esp32ScannerState> emit,
  ) async {
    if (_isConnected) {
      emit(Esp32Connected(connectionMode: _currentMode));
      return;
    }

    emit(Esp32Connecting(connectionMode: _currentMode));
    try {
      _esp32Stream = await _connectToEsp32UseCase.execute();
      _isConnected = true;
      emit(Esp32Connected(connectionMode: _currentMode));

      await emit.onEach<String>(
        _esp32Stream!,
        onData: (uid) {
          if (_isConnected) {
            add(UidReceivedEvent(uid));
          }
        },
      );
    } catch (e) {
      _isConnected = false;
      String errorMessage = e.toString();
      if (errorMessage.contains('WiFi desactivado')) {
        emit(WifiDisabled(connectionMode: _currentMode));
      } else if (errorMessage.contains('Bluetooth está desactivado')) {
        emit(BluetoothDisabled(connectionMode: _currentMode));
      } else {
        emit(Esp32Error(errorMessage, connectionMode: _currentMode));
      }
    }
  }

  Future<void> _onDisconnectFromEsp32Event(
    DisconnectFromEsp32Event event,
    Emitter<Esp32ScannerState> emit,
  ) async {
    _disconnectFromEsp32UseCase.execute();
    _isConnected = false;
    _esp32Stream = null;
    emit(Esp32ScannerInitial(connectionMode: _currentMode));
  }

  Future<void> _onUidReceivedEvent(
    UidReceivedEvent event,
    Emitter<Esp32ScannerState> emit,
  ) async {
    final normalizedUid = event.uid.replaceAll(':', '').toUpperCase();

    final animal = await _findAnimalByUidUseCase.execute(normalizedUid);
    if (animal != null) {
      emit(Esp32AnimalFound(animal, connectionMode: _currentMode));
    } else {
      emit(Esp32Error('No se encontró ningún animal con el UID: ${event.uid}',
          connectionMode: _currentMode));
    }
  }

  Future<void> _onResetScannerEvent(
    ResetScannerEvent event,
    Emitter<Esp32ScannerState> emit,
  ) async {
    if (_isConnected) {
      emit(Esp32Connected(connectionMode: _currentMode));
    } else {
      emit(Esp32ScannerInitial(connectionMode: _currentMode));
    }
  }

  Future<void> _onOpenWifiSettingsEvent(
    OpenWifiSettingsEvent event,
    Emitter<Esp32ScannerState> emit,
  ) async {
    try {
      await _openWifiSettingsUseCase.execute();
    } catch (e) {
      debugPrint('Error al abrir configuración WiFi: $e');
    }
  }

  @override
  Future<void> close() {
    if (_isConnected) {
      _disconnectFromEsp32UseCase.execute();
    }
    _isConnected = false;
    _esp32Stream = null;
    return super.close();
  }
}
