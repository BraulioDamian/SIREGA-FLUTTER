// lib/nucleo/servicios/isar_service.dart
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/lote_evento_model.dart';
import 'package:sirega_app/nucleo/modelos/producto_catalogo_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/modelos/herd_model.dart';

class IsarService {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        AnimalSchema,
        EventoSanitarioSchema,
        ProductoCatalogoSchema,
        RegistroProduccionSchema,
        HerdSchema,
        LoteEventoSchema,
      ],
      directory: dir.path,
      inspector: true,
    );
  }

  static Future<void> seedInitialData() async {
    final conteo = await isar.productoCatalogos.count();
    if (conteo == 0) {
      final productosIniciales = [
        ProductoCatalogo()..nombre = 'BOBACT 8'..tipo = TipoEvento.vacuna..descripcion = 'Prevención de carbunco.'..esDeSistema = true,
        ProductoCatalogo()..nombre = 'COVEXIN 10'..tipo = TipoEvento.vacuna..descripcion = 'Prevención de clostridiosis.'..esDeSistema = true,
        ProductoCatalogo()..nombre = 'DERRUMBE'..tipo = TipoEvento.vacuna..descripcion = 'Rabia paralítica.'..esDeSistema = true,
        ProductoCatalogo()..nombre = 'IVERMECTINA 3.15%'..tipo = TipoEvento.desparasitante..descripcion = 'Desparasitante interno y externo.'..esDeSistema = true,
      ];
      await isar.writeTxn(() async => await isar.productoCatalogos.putAll(productosIniciales));
    }
  }

  // Animals
  Future<int> saveAnimal(Animal animal) async => await isar.writeTxn(() => isar.animals.put(animal));
  Future<List<Animal>> getAllAnimals() async => await isar.animals.where().findAll();
  Future<bool> deleteAnimal(int id) async => await isar.writeTxn(() => isar.animals.delete(id));
  Future<Animal?> getAnimalById(int id) async {
    final animal = await isar.animals.get(id);
    if (animal != null) {
      await animal.madre.load();
      await animal.padre.load();
      await animal.crias.load();
    }
    return animal;
  }

  Future<Animal?> getAnimalByNfc(String nfcId) async {
    return await isar.animals.getByNfcChipId(nfcId);
  }

  // Health Events
  Future<void> saveEvent(EventoSanitario evento, Animal animal) async {
    await isar.writeTxn(() async {
      await isar.eventoSanitarios.put(evento);
      evento.animal.value = animal;
      await evento.animal.save();
    });
  }

  Future<List<EventoSanitario>> getEventsByAnimal(int animalId) async {
    return await isar.eventoSanitarios.filter().animal((q) => q.idEqualTo(animalId)).sortByFechaDesc().findAll();
  }

  Future<bool> deleteHealthEvent(int eventoId) async {
    return await isar.writeTxn(() => isar.eventoSanitarios.delete(eventoId));
  }

  Future<int> deleteHealthEvents(List<int> ids) async {
    return await isar.writeTxn(() => isar.eventoSanitarios.deleteAll(ids));
  }

  // Production Records
  Future<void> saveProductionRecord(RegistroProduccion reg, Animal animal) async {
    await isar.writeTxn(() async {
      await isar.registroProduccions.put(reg);
      reg.animal.value = animal;
      await reg.animal.save();
    });
  }

  Future<List<RegistroProduccion>> getProductionByAnimal(int animalId) async {
    return await isar.registroProduccions.filter().animal((q) => q.idEqualTo(animalId)).sortByFechaDesc().findAll();
  }

  Future<int> deleteProductionRecords(List<int> ids) async {
    return await isar.writeTxn(() => isar.registroProduccions.deleteAll(ids));
  }

}