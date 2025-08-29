import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:meta/meta.dart';

part 'cattle_detail_event.dart';
part 'cattle_detail_state.dart';

class CattleDetailBloc extends Bloc<CattleDetailEvent, CattleDetailState> {
  final IsarService isarService;

  CattleDetailBloc({required this.isarService}) : super(CattleDetailInitial()) {
    // Handlers for main logic
    on<LoadCattleDetail>(_onLoadCattleDetail);
    on<DeactivateAnimal>(_onDeactivateAnimal);

    // Handlers for UI actions that just show a message
    on<EditAnimalClicked>(_onEditAnimalClicked);
    on<ShareAnimalClicked>(_onShareAnimalClicked);
    on<ScanNFCClicked>(_onScanNFCClicked);
    on<RegisterEventClicked>(_onRegisterEventClicked);
    on<AddPhotoClicked>(_onAddPhotoClicked);
    on<PrintAnimalCardClicked>(_onPrintAnimalCardClicked);
    on<GenerateQRCodeClicked>(_onGenerateQRCodeClicked);
    on<ArchiveAnimalClicked>(_onArchiveAnimalClicked);
  }

  Future<void> _onLoadCattleDetail(LoadCattleDetail event, Emitter<CattleDetailState> emit) async {
    emit(CattleDetailLoading());
    try {
      final animal = await isarService.obtenerAnimalPorId(event.animalId);
      if (animal != null) {
        final eventos = await isarService.obtenerEventosPorAnimal(event.animalId);
        emit(CattleDetailLoaded(animal: animal, eventos: eventos));
      } else {
        emit(CattleDetailError('Animal no encontrado'));
      }
    } catch (e) {
      emit(CattleDetailError(e.toString()));
    }
  }

  Future<void> _onDeactivateAnimal(DeactivateAnimal event, Emitter<CattleDetailState> emit) async {
    try {
      final animalToUpdate = event.animal;
      animalToUpdate.estado = EstadoAnimal.muerto; // O el estado que corresponda
      await isarService.guardarAnimal(animalToUpdate);
      emit(AnimalDeactivationSuccess());
    } catch (e) {
      emit(ShowInfoSnackbar('Error al eliminar: ${e.toString()}'));
    }
  }

  // --- Handlers for simple UI actions ---

  void _onEditAnimalClicked(EditAnimalClicked event, Emitter<CattleDetailState> emit) {
    emit(ShowInfoSnackbar('Función de edición próximamente'));
  }

  void _onShareAnimalClicked(ShareAnimalClicked event, Emitter<CattleDetailState> emit) {
    emit(ShowInfoSnackbar('Compartiendo información...'));
  }

  void _onScanNFCClicked(ScanNFCClicked event, Emitter<CattleDetailState> emit) {
    emit(ShowInfoSnackbar('Iniciando escaneo NFC...'));
  }

  void _onRegisterEventClicked(RegisterEventClicked event, Emitter<CattleDetailState> emit) {
    emit(ShowInfoSnackbar('Abriendo registro de eventos...'));
  }

  void _onAddPhotoClicked(AddPhotoClicked event, Emitter<CattleDetailState> emit) {
    emit(ShowInfoSnackbar('Abriendo cámara...'));
  }

  void _onPrintAnimalCardClicked(PrintAnimalCardClicked event, Emitter<CattleDetailState> emit) {
    emit(ShowInfoSnackbar('Preparando impresión...'));
  }

  void _onGenerateQRCodeClicked(GenerateQRCodeClicked event, Emitter<CattleDetailState> emit) {
    emit(ShowInfoSnackbar('Generando código QR...'));
  }

  void _onArchiveAnimalClicked(ArchiveAnimalClicked event, Emitter<CattleDetailState> emit) {
    emit(ShowInfoSnackbar('Animal archivado correctamente'));
  }
}
