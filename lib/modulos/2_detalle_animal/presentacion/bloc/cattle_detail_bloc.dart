import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

// Eventos
abstract class CattleDetailEvent {}

class LoadCattleDetail extends CattleDetailEvent {
  final int animalId;
  LoadCattleDetail(this.animalId);
}

class DeactivateAnimal extends CattleDetailEvent {
  final Animal animal;
  DeactivateAnimal(this.animal);
}

// Estados
abstract class CattleDetailState {}

class CattleDetailInitial extends CattleDetailState {}

class CattleDetailLoading extends CattleDetailState {}

class CattleDetailLoaded extends CattleDetailState {
  final Animal animal;
  final List<EventoSanitario> eventos;
  CattleDetailLoaded({required this.animal, required this.eventos});
}

class CattleDetailError extends CattleDetailState {
  final String message;
  CattleDetailError(this.message);
}

// Bloc
class CattleDetailBloc extends Bloc<CattleDetailEvent, CattleDetailState> {
  final IsarService isarService;

  CattleDetailBloc({required this.isarService}) : super(CattleDetailInitial()) {
    on<LoadCattleDetail>(_onLoadCattleDetail);
    on<DeactivateAnimal>(_onDeactivateAnimal);
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
      // No es necesario emitir un nuevo estado si vamos a navegar hacia atrás
    } catch (e) {
      // Opcional: emitir un estado de error si la desactivación falla
      emit(CattleDetailError(e.toString()));
    }
  }
}