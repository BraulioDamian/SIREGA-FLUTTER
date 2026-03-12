import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/services/isar_service.dart';

// Eventos
abstract class CattleListEvent {}

class LoadCattle extends CattleListEvent {}

class AddCattle extends CattleListEvent {
  final Animal animal;
  AddCattle(this.animal);
}

// Estado
class CattleListState {
  final bool loading;
  final List<Animal> activeItems;
  final List<Animal> historicalItems;
  final String? error;

  const CattleListState({
    this.loading = false,
    this.activeItems = const [],
    this.historicalItems = const [],
    this.error,
  });

  CattleListState copyWith({
    bool? loading,
    List<Animal>? activeItems,
    List<Animal>? historicalItems,
    String? error,
  }) => CattleListState(
    loading: loading ?? this.loading,
    activeItems: activeItems ?? this.activeItems,
    historicalItems: historicalItems ?? this.historicalItems,
    error: error,
  );
}

// Bloc
class CattleListBloc extends Bloc<CattleListEvent, CattleListState> {
  final IsarService isarService;

  CattleListBloc({required this.isarService}) : super(const CattleListState()) {
    on<LoadCattle>(_onLoadCattle);
    on<AddCattle>(_onAddCattle);
  }

  Future<void> _onLoadCattle(
    LoadCattle event,
    Emitter<CattleListState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final allAnimals = await isarService.getAllAnimals();
      final activeAnimals = allAnimals
          .where((a) => a.estado == EstadoAnimal.activo)
          .toList();
      final historicalAnimals = allAnimals
          .where((a) => a.estado != EstadoAnimal.activo)
          .toList();

      emit(
        state.copyWith(
          loading: false,
          activeItems: activeAnimals,
          historicalItems: historicalAnimals,
        ),
      );
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future<void> _onAddCattle(
    AddCattle event,
    Emitter<CattleListState> emit,
  ) async {
    try {
      await isarService.saveAnimal(event.animal);
      // Recargar la lista después de agregar
      add(LoadCattle());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
