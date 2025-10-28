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
import 'package:sirega_app/nucleo/modelos/sync_queue.dart';
import 'package:sirega_app/nucleo/modelos/configuracion_local.dart';
import 'package:sirega_app/nucleo/modelos/alerta.dart';

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
        SyncQueueSchema,
        ConfiguracionLocalSchema,
        AlertaSchema,
        LoteEventoSchema,
      ],
      directory: dir.path,
      inspector: true,
    );
  }

  static Future<void> poblarDatosIniciales() async {
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

  Future<int> guardarAnimal(Animal animal) async => await isar.writeTxn(() => isar.animals.put(animal));
  Future<List<Animal>> obtenerTodosLosAnimales() async => await isar.animals.where().findAll();
  Future<List<Animal>> obtenerAnimalesActivos() async => await isar.animals.filter().estadoEqualTo(EstadoAnimal.activo).findAll();
  Future<bool> eliminarAnimal(int id) async => await isar.writeTxn(() => isar.animals.delete(id));
  Future<Animal?> obtenerAnimalPorId(int id) async => await isar.animals.get(id);

  Future<Animal?> obtenerAnimalPorNfc(String nfcId) async {
    // Buscar por el ID puro del chip NFC usando el método generado
    return await isar.animals.getByNfcChipId(nfcId);
  }

  Future<void> guardarEvento(EventoSanitario evento, Animal animal) async {
    await isar.writeTxn(() async {
      await isar.eventoSanitarios.put(evento);
      evento.animal.value = animal;
      await evento.animal.save();
    });
  }

  Future<List<EventoSanitario>> obtenerEventosPorAnimal(int animalId) async {
    return await isar.eventoSanitarios.filter().animal((q) => q.idEqualTo(animalId)).sortByFechaDesc().findAll();
  }

  // Producción
  Future<void> guardarRegistroProduccion(RegistroProduccion reg, Animal animal) async {
    await isar.writeTxn(() async {
  await isar.registroProduccions.put(reg);
      reg.animal.value = animal;
      await reg.animal.save();
    });
  }

  Future<List<RegistroProduccion>> obtenerProduccionPorAnimal(int animalId) async {
    return await isar.registroProduccions.filter().animal((q) => q.idEqualTo(animalId)).sortByFechaDesc().findAll();
  }

  // Herds
  Future<void> guardarHerd(Herd herd) async => await isar.writeTxn(() => isar.herds.put(herd));
  Future<Herd?> obtenerHerdPorId(int id) async => await isar.herds.get(id);
  Future<List<Herd>> obtenerTodosLosHerds() async => await isar.herds.where().findAll();
}