import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_state.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/connect_to_esp32_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/disconnect_from_esp32_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/open_wifi_settings_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/find_animal_by_uid_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/esp32_service.dart';

class Esp32ScannerBloc extends Bloc<Esp32ScannerEvent, Esp32ScannerState> {
  final ConnectToEsp32UseCase _connectToEsp32UseCase;
  final DisconnectFromEsp32UseCase _disconnectFromEsp32UseCase;
  final FindAnimalByUidUseCase _findAnimalByUidUseCase;
  final OpenWifiSettingsUseCase _openWifiSettingsUseCase;
  
  Stream<String>? _esp32Stream;
  bool _isConnected = false;

  Esp32ScannerBloc(this._connectToEsp32UseCase, this._disconnectFromEsp32UseCase, this._findAnimalByUidUseCase, this._openWifiSettingsUseCase)
      : super(Esp32ScannerInitial()) {
    on<ConnectToEsp32Event>(_onConnectToEsp32Event);
    on<DisconnectFromEsp32Event>(_onDisconnectFromEsp32Event);
    on<UidReceivedEvent>(_onUidReceivedEvent);
    on<ResetScannerEvent>(_onResetScannerEvent);
    on<CheckConnectionStatusEvent>(_onCheckConnectionStatus);
    on<OpenWifiSettingsEvent>(_onOpenWifiSettingsEvent);
    
    // Verificar el estado de conexión al iniciar
    add(CheckConnectionStatusEvent());
  }

  Future<void> _onCheckConnectionStatus(
      CheckConnectionStatusEvent event, Emitter<Esp32ScannerState> emit) async {
    if (_isConnected) {
      emit(Esp32Connected());
    } else {
      emit(Esp32ScannerInitial());
    }
  }

  Future<void> _onConnectToEsp32Event(
      ConnectToEsp32Event event, Emitter<Esp32ScannerState> emit) async {
    // Si ya está conectado, solo emitir el estado conectado
    if (_isConnected) {
      emit(Esp32Connected());
      return;
    }
    
    emit(Esp32Connecting());
    try {
      _esp32Stream = await _connectToEsp32UseCase.execute();
      _isConnected = true;
      emit(Esp32Connected());
      
      await emit.onEach<String>(_esp32Stream!, onData: (uid) {
        if (_isConnected) {
          add(UidReceivedEvent(uid));
        }
      });
    } catch (e) {
      _isConnected = false;
      String errorMessage = e.toString();
      if (errorMessage.contains('WiFi desactivado')) {
        emit(WifiDisabled());
      } else {
        emit(Esp32Error(errorMessage));
      }
    }
  }

  Future<void> _onDisconnectFromEsp32Event(
      DisconnectFromEsp32Event event, Emitter<Esp32ScannerState> emit) async {
    _disconnectFromEsp32UseCase.execute();
    _isConnected = false;
    _esp32Stream = null;
    emit(Esp32ScannerInitial());
  }

  Future<void> _onUidReceivedEvent(
      UidReceivedEvent event, Emitter<Esp32ScannerState> emit) async {
    // Normalizar el UID recibido del ESP32 (quitar ':' y convertir a mayúsculas)
    final normalizedUid = event.uid.replaceAll(':', '').toUpperCase();

    final animal = await _findAnimalByUidUseCase.execute(normalizedUid);
    if (animal != null) {
      emit(Esp32AnimalFound(animal));
    } else {
      emit(Esp32Error('No se encontró ningún animal con el UID: ${event.uid}'));
    }
  }

  Future<void> _onResetScannerEvent(
      ResetScannerEvent event, Emitter<Esp32ScannerState> emit) async {
    if (_isConnected) {
      emit(Esp32Connected());
    } else {
      emit(Esp32ScannerInitial());
    }
  }

  Future<void> _onOpenWifiSettingsEvent(
      OpenWifiSettingsEvent event, Emitter<Esp32ScannerState> emit) async {
    try {
      await _openWifiSettingsUseCase.execute();
    } catch (e) {
      // No emitir error por abrir configuración, es una acción auxiliar
      print('Error al abrir configuración WiFi: $e');
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
