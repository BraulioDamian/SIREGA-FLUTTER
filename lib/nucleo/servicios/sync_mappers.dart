import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/herd_model.dart';
import 'package:sirega_app/nucleo/modelos/lote_evento_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/modelos/siniga_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

/// Conversiones bidireccionales entre modelos locales (Isar) y mapas de Firestore.
/// Usado por [FirebaseSyncService] para serialización/deserialización.
class SyncMappers {
  SyncMappers._();

  // ========== CONVERSIONES (Model → Map) ==========

  static Map<String, dynamic> animalToMap(Animal animal) {
    // Construir siniigaId solo si tiene datos válidos
    Map<String, dynamic>? siniigaData;
    if (animal.siniigaId != null) {
      final siniga = animal.siniigaId!;
      // Solo crear el mapa si al menos tiene especie, estadoClave y numeroNacional
      if (siniga.especie != null &&
          siniga.estadoClave != null &&
          siniga.numeroNacional != null) {
        siniigaData = {
          'especie': siniga.especie,
          'estadoClave': siniga.estadoClave,
          'numeroNacional': siniga.numeroNacional,
        };
      }
    }

    return {
      'nombre': animal.nombre,
      'sexo': animal.sexo.name,
      'raza': animal.raza,
      'fechaNacimiento': Timestamp.fromDate(animal.fechaNacimiento),
      'idAreteNFC': animal.idAreteNFC,
      'nfcChipId': animal.nfcChipId,
      'idAreteVisual': animal.idAreteVisual,
      'numeroHerrado': animal.numeroHerrado,
      'siniigaId': siniigaData,
      'pesoNacimiento': animal.pesoNacimiento,
      'colorPelaje': animal.colorPelaje,
      'estado': animal.estado.name,
      'estadoSalud': animal.estadoSalud.name,
      'descripcionSalud': animal.descripcionSalud,
      'pesoActual': animal.pesoActual,
      'notas': animal.notas,
      'herdId': animal.herd.value?.serverId,
      'padreId': animal.padre.value?.serverId,
      'madreId': animal.madre.value?.serverId,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> eventToMap(EventoSanitario event) {
    return {
      'tipo': event.tipo.name,
      'fecha': Timestamp.fromDate(event.fecha),
      'nombreProducto': event.nombreProducto,
      'dosis': event.dosis,
      'unidadDosis': event.unidadDosis,
      'veterinario': event.veterinario,
      'notas': event.notas,
      'animalId': event.animal.value?.serverId,
      'loteId': event.loteId,
      'totalAnimalesLote': event.totalAnimalesLote,
      'prioridad': event.prioridad.name,
      'fechaProximaAplicacion': event.fechaProximaAplicacion != null
          ? Timestamp.fromDate(event.fechaProximaAplicacion!)
          : null,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> productionToMap(RegistroProduccion production) {
    return {
      'tipo': production.tipo,
      'fecha': Timestamp.fromDate(production.fecha),
      'idCria': production.idCria,
      'pesoKg': production.pesoKg,
      'litrosPorDia': production.litrosPorDia,
      'notas': production.notas,
      'animalId': production.animal.value?.serverId,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> herdToMap(Herd herd) {
    return {
      'nombre': herd.nombre,
      'ownerUid': herd.ownerUid,
      'estado': herd.estado,
      'municipio': herd.municipio,
      'totalCattleCount': herd.totalCattleCount,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> batchEventToMap(LoteEvento batch) {
    return {
      'loteId': batch.loteId,
      'tipo': batch.tipo.name,
      'fecha': Timestamp.fromDate(batch.fecha),
      'nombreProducto': batch.nombreProducto,
      'cantidadAnimales': batch.cantidadAnimales,
      'animalesIds': batch.animalesIds,
      'ultimaActualizacion': FieldValue.serverTimestamp(),
    };
  }

  // ========== CONVERSIONES (Map → Model) ==========

  static Future<void> createOrUpdateLocalAnimal(
      String serverId, Map<String, dynamic> data) async {
    // Buscar si ya existe localmente
    final existing = await IsarService.isar.animals
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt =
        (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    // Si existe y la versión local es más reciente, no actualizar
    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final animal = existing ?? Animal();
    animal.serverId = serverId;
    animal.nombre = data['nombre'] ?? '';
    animal.sexo = Sexo.values.byName(data['sexo'] ?? 'hembra');
    animal.raza = data['raza'] ?? '';
    animal.fechaNacimiento = (data['fechaNacimiento'] as Timestamp).toDate();
    animal.idAreteNFC = data['idAreteNFC'];
    animal.nfcChipId = data['nfcChipId'];
    animal.idAreteVisual = data['idAreteVisual'];
    animal.numeroHerrado = data['numeroHerrado'];
    if (data['siniigaId'] != null) {
      animal.siniigaId = SinigaId(
        especie: data['siniigaId']['especie'],
        estadoClave: data['siniigaId']['estadoClave'],
        numeroNacional: data['siniigaId']['numeroNacional'],
      );
    }
    animal.pesoNacimiento = data['pesoNacimiento'];
    animal.colorPelaje = data['colorPelaje'];
    animal.estado = EstadoAnimal.values.byName(data['estado'] ?? 'activo');
    animal.estadoSalud =
        EstadoSalud.values.byName(data['estadoSalud'] ?? 'sano');
    animal.descripcionSalud = data['descripcionSalud'];
    animal.pesoActual = data['pesoActual'];
    animal.notas = data['notas'];
    animal.ultimaActualizacion = remoteUpdatedAt;
    animal.estadoSync = EstadoSync.completado;

    await IsarService.isar.animals.put(animal);
  }

  static Future<void> createOrUpdateLocalEvent(
      String serverId, Map<String, dynamic> data) async {
    final existing = await IsarService.isar.eventoSanitarios
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt =
        (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final event = existing ?? EventoSanitario();
    event.serverId = serverId;
    event.tipo = TipoEvento.values.byName(data['tipo']);
    event.fecha = (data['fecha'] as Timestamp).toDate();
    event.nombreProducto = data['nombreProducto'];
    event.dosis = data['dosis'];
    event.unidadDosis = data['unidadDosis'];
    event.veterinario = data['veterinario'];
    event.notas = data['notas'];
    event.loteId = data['loteId'];
    event.totalAnimalesLote = data['totalAnimalesLote'];
    event.prioridad = Prioridad.values.byName(data['prioridad'] ?? 'media');
    event.fechaProximaAplicacion =
        (data['fechaProximaAplicacion'] as Timestamp?)?.toDate();
    event.ultimaActualizacion = remoteUpdatedAt;
    event.estadoSync = EstadoSync.completado;

    await IsarService.isar.eventoSanitarios.put(event);
  }

  static Future<void> createOrUpdateLocalProduction(
      String serverId, Map<String, dynamic> data) async {
    final existing = await IsarService.isar.registroProduccions
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt =
        (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final production = existing ?? RegistroProduccion();
    production.serverId = serverId;
    production.tipo = data['tipo'] ?? '';
    production.fecha = (data['fecha'] as Timestamp).toDate();
    production.idCria = data['idCria'];
    production.pesoKg = data['pesoKg'];
    production.litrosPorDia = data['litrosPorDia'];
    production.notas = data['notas'];
    production.ultimaActualizacion = remoteUpdatedAt;
    production.estadoSync = EstadoSync.completado;

    await IsarService.isar.registroProduccions.put(production);
  }

  static Future<void> createOrUpdateLocalHerd(
      String serverId, Map<String, dynamic> data) async {
    final existing = await IsarService.isar.herds
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt =
        (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final herd = existing ?? Herd();
    herd.serverId = serverId;
    herd.nombre = data['nombre'] ?? '';
    herd.ownerUid = data['ownerUid'] ?? '';
    herd.estado = data['estado'] ?? '';
    herd.municipio = data['municipio'] ?? '';
    herd.totalCattleCount = data['totalCattleCount'] ?? 0;
    herd.ultimaActualizacion = remoteUpdatedAt;
    herd.estadoSync = EstadoSync.completado;

    await IsarService.isar.herds.put(herd);
  }

  static Future<void> createOrUpdateLocalBatchEvent(
      String serverId, Map<String, dynamic> data) async {
    final existing = await IsarService.isar.loteEventos
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt =
        (data['ultimaActualizacion'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.ultimaActualizacion != null &&
        remoteUpdatedAt != null &&
        existing.ultimaActualizacion!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final batch = existing ?? LoteEvento();
    batch.serverId = serverId;
    batch.loteId = data['loteId'] ?? '';
    batch.tipo = TipoEvento.values.byName(data['tipo']);
    batch.fecha = (data['fecha'] as Timestamp).toDate();
    batch.nombreProducto = data['nombreProducto'];
    batch.cantidadAnimales = data['cantidadAnimales'] ?? 0;
    batch.animalesIds = List<int>.from(data['animalesIds'] ?? []);
    batch.ultimaActualizacion = remoteUpdatedAt;
    batch.estadoSync = EstadoSync.completado;

    await IsarService.isar.loteEventos.put(batch);
  }
}
