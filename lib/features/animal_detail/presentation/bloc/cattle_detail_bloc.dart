import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/models/medical_event_model.dart';
import 'package:sirega_app/core/services/isar_service.dart';
import 'package:meta/meta.dart';

part 'cattle_detail_event.dart';
part 'cattle_detail_state.dart';

class CattleDetailBloc extends Bloc<CattleDetailEvent, CattleDetailState> {
  final IsarService isarService;

  CattleDetailBloc({required this.isarService}) : super(CattleDetailInitial()) {
    // Handlers for main logic
    on<LoadCattleDetail>(_onLoadCattleDetail);
    on<DeactivateAnimal>(_onDeactivateAnimal);
    on<UpdateAnimal>(_onUpdateAnimal);
    on<DeleteAnimalPermanently>(_onDeleteAnimalPermanently);

    // Handlers for UI actions that just show a message
    on<EditAnimalClicked>(_onEditAnimalClicked);
    on<ShareAnimalClicked>(_onShareAnimalClicked);
    on<RegisterEventClicked>(_onRegisterEventClicked);
    on<AddPhotoClicked>(_onAddPhotoClicked);
    on<UpdateAnimalPhoto>(_onUpdateAnimalPhoto);
    on<PrintAnimalCardClicked>(_onPrintAnimalCardClicked);
    on<GenerateQRCodeClicked>(_onGenerateQRCodeClicked);
    on<ArchiveAnimalClicked>(_onArchiveAnimalClicked);
  }

  Future<void> _onLoadCattleDetail(
    LoadCattleDetail event,
    Emitter<CattleDetailState> emit,
  ) async {
    emit(CattleDetailLoading());
    try {
      final animal = await isarService.getAnimalById(event.animalId);
      if (animal != null) {
        final events = await isarService.getEventsByAnimal(event.animalId);
        emit(CattleDetailLoaded(animal: animal, events: events));
      } else {
        emit(CattleDetailError('Animal no encontrado'));
      }
    } catch (e) {
      emit(CattleDetailError(e.toString()));
    }
  }

  Future<void> _onDeactivateAnimal(
    DeactivateAnimal event,
    Emitter<CattleDetailState> emit,
  ) async {
    try {
      final animalToUpdate = event.animal;
      animalToUpdate.estado =
          EstadoAnimal.muerto; // O el estado que corresponda
      await isarService.saveAnimal(animalToUpdate);
      emit(AnimalDeactivationSuccess());
    } catch (e) {
      emit(ShowInfoSnackbar('Error al eliminar: ${e.toString()}'));
    }
  }

  // --- Handlers for simple UI actions ---

  void _onEditAnimalClicked(
    EditAnimalClicked event,
    Emitter<CattleDetailState> emit,
  ) {
    emit(NavigateToEditScreen(event.animal));
  }

  void _onShareAnimalClicked(
    ShareAnimalClicked event,
    Emitter<CattleDetailState> emit,
  ) {
    emit(ShowInfoSnackbar('Compartiendo información...'));
  }

  void _onRegisterEventClicked(
    RegisterEventClicked event,
    Emitter<CattleDetailState> emit,
  ) {
    emit(NavigateToRegisterEvent(event.animal));
  }

  void _onAddPhotoClicked(
    AddPhotoClicked event,
    Emitter<CattleDetailState> emit,
  ) {
    emit(ShowImagePickerBottomSheet(event.animal));
  }

  Future<void> _onUpdateAnimalPhoto(
    UpdateAnimalPhoto event,
    Emitter<CattleDetailState> emit,
  ) async {
    try {
      final animalToUpdate = event.animal;
      animalToUpdate.profilePhotoUrl = event.photoFile.path;
      await isarService.saveAnimal(animalToUpdate);

      // Recargar la UI con los nuevos datos
      final events = await isarService.getEventsByAnimal(animalToUpdate.id);
      emit(CattleDetailLoaded(animal: animalToUpdate, events: events));
      emit(ShowInfoSnackbar('Foto actualizada con éxito'));
    } catch (e) {
      emit(ShowInfoSnackbar('Error al guardar la foto: ${e.toString()}'));
    }
  }

  void _onPrintAnimalCardClicked(
    PrintAnimalCardClicked event,
    Emitter<CattleDetailState> emit,
  ) {
    emit(ShowInfoSnackbar('Preparando impresión...'));
  }

  void _onGenerateQRCodeClicked(
    GenerateQRCodeClicked event,
    Emitter<CattleDetailState> emit,
  ) {
    emit(ShowInfoSnackbar('Generando código QR...'));
  }

  void _onArchiveAnimalClicked(
    ArchiveAnimalClicked event,
    Emitter<CattleDetailState> emit,
  ) {
    emit(ShowInfoSnackbar('Animal archivado correctamente'));
  }

  Future<void> _onUpdateAnimal(
    UpdateAnimal event,
    Emitter<CattleDetailState> emit,
  ) async {
    try {
      await isarService.saveAnimal(event.animal);
      // Recargar los datos del animal
      final events = await isarService.getEventsByAnimal(event.animal.id);
      emit(CattleDetailLoaded(animal: event.animal, events: events));
      emit(ShowInfoSnackbar('Animal actualizado correctamente'));
    } catch (e) {
      emit(ShowInfoSnackbar('Error al actualizar: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteAnimalPermanently(
    DeleteAnimalPermanently event,
    Emitter<CattleDetailState> emit,
  ) async {
    try {
      // Eliminar físicamente de la base de datos
      await isarService.deleteAnimal(event.animalId);
      emit(AnimalDeactivationSuccess());
      emit(ShowInfoSnackbar('Animal eliminado permanentemente'));
    } catch (e) {
      emit(ShowInfoSnackbar('Error al eliminar: ${e.toString()}'));
    }
  }
}
