import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_state.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/connect_to_esp32_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/find_animal_by_uid_use_case.dart';

class Esp32ScannerBloc extends Bloc<Esp32ScannerEvent, Esp32ScannerState> {
  final ConnectToEsp32UseCase _connectToEsp32UseCase;
  final FindAnimalByUidUseCase _findAnimalByUidUseCase;

  Esp32ScannerBloc(this._connectToEsp32UseCase, this._findAnimalByUidUseCase)
      : super(Esp32ScannerInitial()) {
    on<ConnectToEsp32Event>(_onConnectToEsp32Event);
    on<UidReceivedEvent>(_onUidReceivedEvent);
  }

  Future<void> _onConnectToEsp32Event(
      ConnectToEsp32Event event, Emitter<Esp32ScannerState> emit) async {
    emit(Esp32Connecting());
    try {
      final stream = await _connectToEsp32UseCase.execute();
      emit(Esp32Connected());
      await emit.onEach<String>(stream, onData: (uid) {
        add(UidReceivedEvent(uid));
      });
    } catch (e) {
      if (e.toString().contains('WiFi desactivado')) {
        emit(WifiDisabled());
      } else {
        emit(Esp32Error(e.toString()));
      }
    }
  }

  Future<void> _onUidReceivedEvent(
      UidReceivedEvent event, Emitter<Esp32ScannerState> emit) async {
    // Normalizar el UID recibido del ESP32 (quitar ':' y convertir a minúsculas)
    final normalizedUid = event.uid.replaceAll(':', '');

    final animal = await _findAnimalByUidUseCase.execute(normalizedUid);
    if (animal != null) {
      emit(Esp32UidReceived(animal.nombre ?? 'Sin nombre'));
    } else {
      emit(Esp32Error('No se encontró ningún animal con el UID: ${event.uid}'));
    }
  }
}
