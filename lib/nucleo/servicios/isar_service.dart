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
  Future<Animal?> obtenerAnimalPorId(int id) async {
    final animal = await isar.animals.get(id);
    if (animal != null) {
      await animal.madre.load();
      await animal.padre.load();
      await animal.crias.load();
    }
    return animal;
  }

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

  /// Elimina un evento sanitario individual por su ID.
  Future<bool> eliminarEventoSanitario(int eventoId) async {
    return await isar.writeTxn(() => isar.eventoSanitarios.delete(eventoId));
  }

  /// Elimina un registro de producción individual por su ID.
  Future<bool> eliminarRegistroProduccion(int registroId) async {
    return await isar.writeTxn(() => isar.registroProduccions.delete(registroId));
  }

  /// Elimina múltiples registros de producción por sus IDs.
  Future<int> eliminarRegistrosProduccion(List<int> ids) async {
    return await isar.writeTxn(() => isar.registroProduccions.deleteAll(ids));
  }

  /// Elimina múltiples eventos sanitarios por sus IDs.
  Future<int> eliminarEventosSanitarios(List<int> ids) async {
    return await isar.writeTxn(() => isar.eventoSanitarios.deleteAll(ids));
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

  /// Elimina registros de producción duplicados para un animal.
  /// Mantiene solo uno por combinación (tipo, fecha, pesoKg/litrosPorDia).
  Future<int> eliminarDuplicadosProduccion(int animalId) async {
    final todos = await obtenerProduccionPorAnimal(animalId);
    final vistos = <String>{};
    final aEliminar = <int>[];

    for (final reg in todos) {
      final clave = '${reg.tipo}|${reg.fecha.toIso8601String()}|${reg.pesoKg}|${reg.litrosPorDia}';
      if (vistos.contains(clave)) {
        aEliminar.add(reg.id);
      } else {
        vistos.add(clave);
      }
    }

    if (aEliminar.isNotEmpty) {
      await isar.writeTxn(() => isar.registroProduccions.deleteAll(aEliminar));
    }
    return aEliminar.length;
  }

  /// Elimina eventos sanitarios duplicados para un animal.
  /// Mantiene solo uno por combinación (tipo, fecha, nombreProducto).
  Future<int> eliminarDuplicadosEventos(int animalId) async {
    final todos = await obtenerEventosPorAnimal(animalId);
    final vistos = <String>{};
    final aEliminar = <int>[];

    for (final ev in todos) {
      final clave = '${ev.tipo}|${ev.fecha.toIso8601String()}|${ev.nombreProducto}';
      if (vistos.contains(clave)) {
        aEliminar.add(ev.id);
      } else {
        vistos.add(clave);
      }
    }

    if (aEliminar.isNotEmpty) {
      await isar.writeTxn(() => isar.eventoSanitarios.deleteAll(aEliminar));
    }
    return aEliminar.length;
  }

  // Herds
  Future<void> guardarHerd(Herd herd) async => await isar.writeTxn(() => isar.herds.put(herd));
  Future<Herd?> obtenerHerdPorId(int id) async => await isar.herds.get(id);
  Future<List<Herd>> obtenerTodosLosHerds() async => await isar.herds.where().findAll();

  // ── Migraciones (se ejecutan una sola vez) ──────────────────────────────

  static const int _versionActual = 1;

  /// Ejecuta migraciones pendientes. Cada migración corre solo una vez.
  static Future<void> ejecutarMigraciones() async {
    var config = await isar.configuracionLocals.get(1);
    if (config == null) {
      config = ConfiguracionLocal();
      await isar.writeTxn(() => isar.configuracionLocals.put(config!));
    }

    if (config.versionMigracion < 1) {
      await _migracionLimpiarDuplicados();
    }

    if (config.versionMigracion < _versionActual) {
      config.versionMigracion = _versionActual;
      await isar.writeTxn(() => isar.configuracionLocals.put(config!));
    }
  }

  /// Migración 1: Limpia registros duplicados causados por bug en edición.
  static Future<void> _migracionLimpiarDuplicados() async {
    final service = IsarService();
    final animales = await service.obtenerTodosLosAnimales();
    for (final animal in animales) {
      await service.eliminarDuplicadosProduccion(animal.id);
      await service.eliminarDuplicadosEventos(animal.id);
    }
  }
}