import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/medical_event_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/services/isar_service.dart';

// Eventos
abstract class AddEventEvent {}

class SaveEvent extends AddEventEvent {
  final Animal animal;
  final String productName;
  final DateTime date;
  final Prioridad prioridad;
  final String? notes;

  SaveEvent({
    required this.animal,
    required this.productName,
    required this.date,
    required this.prioridad,
    this.notes,
  });
}

// Estados
abstract class AddEventState {}

class AddEventInitial extends AddEventState {}

class AddEventSaving extends AddEventState {}

class AddEventSuccess extends AddEventState {}

class AddEventError extends AddEventState {
  final String message;
  AddEventError(this.message);
}

// Bloc
class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {
  final IsarService isarService;

  AddEventBloc({required this.isarService}) : super(AddEventInitial()) {
    on<SaveEvent>(_onSaveEvent);
  }

  Future<void> _onSaveEvent(
    SaveEvent event,
    Emitter<AddEventState> emit,
  ) async {
    emit(AddEventSaving());
    try {
      final nuevoEvento = MedicalEventRecord()
        ..productName = event.productName
        ..date = event.date
        ..prioridad = event.prioridad
        ..notes = event.notes;

      await isarService.saveEvent(nuevoEvento, event.animal);
      emit(AddEventSuccess());
    } catch (e) {
      emit(AddEventError(e.toString()));
    }
  }
}
