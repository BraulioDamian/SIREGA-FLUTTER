import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

// Eventos
abstract class AddEventEvent {}
class SaveEvent extends AddEventEvent {
  final Animal animal;
  final String nombreProducto;
  final DateTime fecha;
  final Prioridad prioridad;
  final String? notas;
  
  SaveEvent({
    required this.animal,
    required this.nombreProducto,
    required this.fecha,
    required this.prioridad,
    this.notas,
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

  Future<void> _onSaveEvent(SaveEvent event, Emitter<AddEventState> emit) async {
    emit(AddEventSaving());
    try {
      final nuevoEvento = EventoSanitario()
        ..nombreProducto = event.nombreProducto
        ..fecha = event.fecha
        ..prioridad = event.prioridad
        ..notas = event.notas;
      
      await isarService.saveEvent(nuevoEvento, event.animal);
      emit(AddEventSuccess());
    } catch (e) {
      emit(AddEventError(e.toString()));
    }
  }
}
