// lib/nucleo/servicios/isar_service.dart
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/models/medical_event_model.dart';
import 'package:sirega_app/core/models/batch_event_model.dart';
import 'package:sirega_app/core/models/catalog_product_model.dart';
import 'package:sirega_app/core/models/production_model.dart';
import 'package:sirega_app/core/models/herd_model.dart';

class IsarService {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        AnimalSchema,
        MedicalEventRecordSchema,
        CatalogProductSchema,
        ProductionRecordSchema,
        HerdSchema,
        BatchEventRecordSchema,
      ],
      directory: dir.path,
      inspector: true,
    );
  }

  static Future<void> seedInitialData() async {
    final conteo = await isar.catalogProducts.count();
    if (conteo == 0) {
      final productosIniciales = [
        CatalogProduct()
          ..name = 'BOBACT 8'
          ..tipo = TipoEvento.vacuna
          ..description = 'Prevención de carbunco.'
          ..esDeSistema = true,
        CatalogProduct()
          ..name = 'COVEXIN 10'
          ..tipo = TipoEvento.vacuna
          ..description = 'Prevención de clostridiosis.'
          ..esDeSistema = true,
        CatalogProduct()
          ..name = 'DERRUMBE'
          ..tipo = TipoEvento.vacuna
          ..description = 'Rabia paralítica.'
          ..esDeSistema = true,
        CatalogProduct()
          ..name = 'IVERMECTINA 3.15%'
          ..tipo = TipoEvento.desparasitante
          ..description = 'Desparasitante interno y externo.'
          ..esDeSistema = true,
      ];
      await isar.writeTxn(
        () async => await isar.catalogProducts.putAll(productosIniciales),
      );
    }
  }

  // Animals
  Future<int> saveAnimal(Animal animal) async =>
      await isar.writeTxn(() => isar.animals.put(animal));
  Future<List<Animal>> getAllAnimals() async =>
      await isar.animals.where().findAll();
  Future<bool> deleteAnimal(int id) async =>
      await isar.writeTxn(() => isar.animals.delete(id));
  Future<Animal?> getAnimalById(int id) async {
    final animal = await isar.animals.get(id);
    if (animal != null) {
      await animal.dam.load();
      await animal.sire.load();
      await animal.offspring.load();
    }
    return animal;
  }

  Future<Animal?> getAnimalByNfc(String nfcId) async {
    return await isar.animals.getByNfcChipId(nfcId);
  }

  // Health Events
  Future<void> saveEvent(MedicalEventRecord evento, Animal animal) async {
    await isar.writeTxn(() async {
      await isar.medicalEventRecords.put(evento);
      evento.animal.value = animal;
      await evento.animal.save();
    });
  }

  Future<List<MedicalEventRecord>> getEventsByAnimal(int animalId) async {
    return await isar.medicalEventRecords
        .filter()
        .animal((q) => q.idEqualTo(animalId))
        .sortByDateDesc()
        .findAll();
  }

  Future<bool> deleteHealthEvent(int eventoId) async {
    return await isar.writeTxn(() => isar.medicalEventRecords.delete(eventoId));
  }

  Future<int> deleteHealthEvents(List<int> ids) async {
    return await isar.writeTxn(() => isar.medicalEventRecords.deleteAll(ids));
  }

  // Production Records
  Future<void> saveProductionRecord(ProductionRecord reg, Animal animal) async {
    await isar.writeTxn(() async {
      await isar.productionRecords.put(reg);
      reg.animal.value = animal;
      await reg.animal.save();
    });
  }

  Future<List<ProductionRecord>> getProductionByAnimal(int animalId) async {
    return await isar.productionRecords
        .filter()
        .animal((q) => q.idEqualTo(animalId))
        .sortByDateDesc()
        .findAll();
  }

  Future<int> deleteProductionRecords(List<int> ids) async {
    return await isar.writeTxn(() => isar.productionRecords.deleteAll(ids));
  }
}
