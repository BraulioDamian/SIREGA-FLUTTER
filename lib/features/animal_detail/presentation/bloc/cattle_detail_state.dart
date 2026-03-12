part of 'cattle_detail_bloc.dart';

@immutable
abstract class CattleDetailState {}

// --- Estados Principales de la UI (para el BlocBuilder) ---

class CattleDetailInitial extends CattleDetailState {}

class CattleDetailLoading extends CattleDetailState {}

class CattleDetailLoaded extends CattleDetailState {
  final Animal animal;
  final List<MedicalEventRecord> events;
  CattleDetailLoaded({required this.animal, required this.events});
}

class CattleDetailError extends CattleDetailState {
  final String message;
  CattleDetailError(this.message);
}

// --- Estados de Acción (para el BlocListener) ---
// Estos estados se usan para "efectos secundarios" como mostrar un SnackBar o navegar

abstract class CattleDetailActionState extends CattleDetailState {}

// Estado para mostrar un mensaje informativo (SnackBar)
class ShowInfoSnackbar extends CattleDetailActionState {
  final String message;
  ShowInfoSnackbar(this.message);
}

// Estado para indicar que el animal fue desactivado y se debe navegar hacia atrás
class AnimalDeactivationSuccess extends CattleDetailActionState {}

// Estado para navegar a la pantalla de edición
class NavigateToEditScreen extends CattleDetailActionState {
  final Animal animal;
  NavigateToEditScreen(this.animal);
}

// Estado para actualización exitosa
class AnimalUpdateSuccess extends CattleDetailActionState {
  final Animal animal;
  AnimalUpdateSuccess(this.animal);
}

// Navegar al registro de evento preseleccionando animal
class NavigateToRegisterEvent extends CattleDetailActionState {
  final Animal animal;
  NavigateToRegisterEvent(this.animal);
}

// Abrir selector de imagenes para el avatar
class ShowImagePickerBottomSheet extends CattleDetailActionState {
  final Animal animal;
  ShowImagePickerBottomSheet(this.animal);
}
