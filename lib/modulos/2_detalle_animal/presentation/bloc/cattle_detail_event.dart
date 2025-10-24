part of 'cattle_detail_bloc.dart';

abstract class CattleDetailEvent {}

// Evento para cargar los detalles iniciales del animal
class LoadCattleDetail extends CattleDetailEvent {
  final int animalId;
  LoadCattleDetail(this.animalId);
}

// Evento para desactivar (eliminar) un animal
class DeactivateAnimal extends CattleDetailEvent {
  final Animal animal;
  DeactivateAnimal(this.animal);
}

// Evento para actualizar un animal
class UpdateAnimal extends CattleDetailEvent {
  final Animal animal;
  UpdateAnimal(this.animal);
}

class DeleteAnimalPermanently extends CattleDetailEvent {
  final int animalId;
  DeleteAnimalPermanently(this.animalId);
}

// --- Eventos para acciones del usuario desde la UI ---

class EditAnimalClicked extends CattleDetailEvent {
  final Animal animal;
  EditAnimalClicked(this.animal);
}

class ShareAnimalClicked extends CattleDetailEvent {
  final Animal animal;
  ShareAnimalClicked(this.animal);
}

class RegisterEventClicked extends CattleDetailEvent {
  final Animal animal;
  RegisterEventClicked(this.animal);
}

class AddPhotoClicked extends CattleDetailEvent {
  final Animal animal;
  AddPhotoClicked(this.animal);
}

class PrintAnimalCardClicked extends CattleDetailEvent {
  final Animal animal;
  PrintAnimalCardClicked(this.animal);
}

class GenerateQRCodeClicked extends CattleDetailEvent {
  final Animal animal;
  GenerateQRCodeClicked(this.animal);
}

class ArchiveAnimalClicked extends CattleDetailEvent {
  final Animal animal;
  ArchiveAnimalClicked(this.animal);
}
