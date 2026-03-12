import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isar/isar.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/models/medical_event_model.dart';
import 'package:sirega_app/core/models/herd_model.dart';
import 'package:sirega_app/core/models/batch_event_model.dart';
import 'package:sirega_app/core/models/production_model.dart';
import 'package:sirega_app/core/models/siniga_model.dart';
import 'package:sirega_app/core/services/isar_service.dart';

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
      'name': animal.name,
      'sex': animal.sex.name,
      'breed': animal.breed,
      'birthDate': Timestamp.fromDate(animal.birthDate),
      'rfidTagId': animal.rfidTagId,
      'nfcChipId': animal.nfcChipId,
      'visualTagId': animal.visualTagId,
      'brandNumber': animal.brandNumber,
      'siniigaId': siniigaData,
      'birthWeight': animal.birthWeight,
      'coatColor': animal.coatColor,
      'estado': animal.estado.name,
      'healthStatus': animal.healthStatus.name,
      'healthDescription': animal.healthDescription,
      'currentWeight': animal.currentWeight,
      'notes': animal.notes,
      'herdId': animal.herd.value?.serverId,
      'padreId': animal.sire.value?.serverId,
      'madreId': animal.dam.value?.serverId,
      'lastUpdatedAt': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> eventToMap(MedicalEventRecord event) {
    return {
      'tipo': event.tipo.name,
      'date': Timestamp.fromDate(event.date),
      'productName': event.productName,
      'dose': event.dose,
      'doseUnit': event.doseUnit,
      'veterinarian': event.veterinarian,
      'notes': event.notes,
      'animalId': event.animal.value?.serverId,
      'loteId': event.loteId,
      'totalAnimalesLote': event.totalAnimalesLote,
      'prioridad': event.prioridad.name,
      'nextApplicationDate': event.nextApplicationDate != null
          ? Timestamp.fromDate(event.nextApplicationDate!)
          : null,
      'lastUpdatedAt': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> productionToMap(ProductionRecord production) {
    return {
      'tipo': production.tipo,
      'date': Timestamp.fromDate(production.date),
      'idCria': production.idCria,
      'pesoKg': production.pesoKg,
      'litrosPorDia': production.litrosPorDia,
      'notes': production.notes,
      'animalId': production.animal.value?.serverId,
      'lastUpdatedAt': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> herdToMap(Herd herd) {
    return {
      'name': herd.name,
      'ownerUid': herd.ownerUid,
      'estado': herd.estado,
      'municipio': herd.municipio,
      'totalCattleCount': herd.totalCattleCount,
      'lastUpdatedAt': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> batchEventToMap(BatchEventRecord batch) {
    return {
      'loteId': batch.loteId,
      'tipo': batch.tipo.name,
      'date': Timestamp.fromDate(batch.date),
      'productName': batch.productName,
      'cantidadAnimales': batch.cantidadAnimales,
      'animalesIds': batch.animalesIds,
      'lastUpdatedAt': FieldValue.serverTimestamp(),
    };
  }

  // ========== CONVERSIONES (Map → Model) ==========

  static Future<void> createOrUpdateLocalAnimal(
    String serverId,
    Map<String, dynamic> data,
  ) async {
    // Buscar si ya existe localmente
    final existing = await IsarService.isar.animals
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['lastUpdatedAt'] as Timestamp?)?.toDate();

    // Si existe y la versión local es más reciente, no actualizar
    if (existing != null &&
        existing.lastUpdatedAt != null &&
        remoteUpdatedAt != null &&
        existing.lastUpdatedAt!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final animal = existing ?? Animal();
    animal.serverId = serverId;
    animal.name = data['name'] ?? '';
    animal.sex = Sexo.values.byName(data['sex'] ?? 'hembra');
    animal.breed = data['breed'] ?? '';
    animal.birthDate = (data['birthDate'] as Timestamp).toDate();
    animal.rfidTagId = data['rfidTagId'];
    animal.nfcChipId = data['nfcChipId'];
    animal.visualTagId = data['visualTagId'];
    animal.brandNumber = data['brandNumber'];
    if (data['siniigaId'] != null) {
      animal.siniigaId = SinigaId(
        especie: data['siniigaId']['especie'],
        estadoClave: data['siniigaId']['estadoClave'],
        numeroNacional: data['siniigaId']['numeroNacional'],
      );
    }
    animal.birthWeight = data['birthWeight'];
    animal.coatColor = data['coatColor'];
    animal.estado = EstadoAnimal.values.byName(data['estado'] ?? 'activo');
    animal.healthStatus = EstadoSalud.values.byName(
      data['healthStatus'] ?? 'sano',
    );
    animal.healthDescription = data['healthDescription'];
    animal.currentWeight = data['currentWeight'];
    animal.notes = data['notes'];
    animal.lastUpdatedAt = remoteUpdatedAt;
    animal.syncStatus = EstadoSync.completado;

    await IsarService.isar.animals.put(animal);
  }

  static Future<void> createOrUpdateLocalEvent(
    String serverId,
    Map<String, dynamic> data,
  ) async {
    final existing = await IsarService.isar.medicalEventRecords
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['lastUpdatedAt'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.lastUpdatedAt != null &&
        remoteUpdatedAt != null &&
        existing.lastUpdatedAt!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final event = existing ?? MedicalEventRecord();
    event.serverId = serverId;
    event.tipo = TipoEvento.values.byName(data['tipo']);
    event.date = (data['date'] as Timestamp).toDate();
    event.productName = data['productName'];
    event.dose = data['dose'];
    event.doseUnit = data['doseUnit'];
    event.veterinarian = data['veterinarian'];
    event.notes = data['notes'];
    event.loteId = data['loteId'];
    event.totalAnimalesLote = data['totalAnimalesLote'];
    event.prioridad = Prioridad.values.byName(data['prioridad'] ?? 'media');
    event.nextApplicationDate = (data['nextApplicationDate'] as Timestamp?)
        ?.toDate();
    event.lastUpdatedAt = remoteUpdatedAt;
    event.syncStatus = EstadoSync.completado;

    await IsarService.isar.medicalEventRecords.put(event);
  }

  static Future<void> createOrUpdateLocalProduction(
    String serverId,
    Map<String, dynamic> data,
  ) async {
    final existing = await IsarService.isar.productionRecords
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['lastUpdatedAt'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.lastUpdatedAt != null &&
        remoteUpdatedAt != null &&
        existing.lastUpdatedAt!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final production = existing ?? ProductionRecord();
    production.serverId = serverId;
    production.tipo = data['tipo'] ?? '';
    production.date = (data['date'] as Timestamp).toDate();
    production.idCria = data['idCria'];
    production.pesoKg = data['pesoKg'];
    production.litrosPorDia = data['litrosPorDia'];
    production.notes = data['notes'];
    production.lastUpdatedAt = remoteUpdatedAt;
    production.syncStatus = EstadoSync.completado;

    await IsarService.isar.productionRecords.put(production);
  }

  static Future<void> createOrUpdateLocalHerd(
    String serverId,
    Map<String, dynamic> data,
  ) async {
    final existing = await IsarService.isar.herds
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['lastUpdatedAt'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.lastUpdatedAt != null &&
        remoteUpdatedAt != null &&
        existing.lastUpdatedAt!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final herd = existing ?? Herd();
    herd.serverId = serverId;
    herd.name = data['name'] ?? '';
    herd.ownerUid = data['ownerUid'] ?? '';
    herd.estado = data['estado'] ?? '';
    herd.municipio = data['municipio'] ?? '';
    herd.totalCattleCount = data['totalCattleCount'] ?? 0;
    herd.lastUpdatedAt = remoteUpdatedAt;
    herd.syncStatus = EstadoSync.completado;

    await IsarService.isar.herds.put(herd);
  }

  static Future<void> createOrUpdateLocalBatchEvent(
    String serverId,
    Map<String, dynamic> data,
  ) async {
    final existing = await IsarService.isar.batchEventRecords
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();

    final remoteUpdatedAt = (data['lastUpdatedAt'] as Timestamp?)?.toDate();

    if (existing != null &&
        existing.lastUpdatedAt != null &&
        remoteUpdatedAt != null &&
        existing.lastUpdatedAt!.isAfter(remoteUpdatedAt)) {
      return;
    }

    final batch = existing ?? BatchEventRecord();
    batch.serverId = serverId;
    batch.loteId = data['loteId'] ?? '';
    batch.tipo = TipoEvento.values.byName(data['tipo']);
    batch.date = (data['date'] as Timestamp).toDate();
    batch.productName = data['productName'];
    batch.cantidadAnimales = data['cantidadAnimales'] ?? 0;
    batch.animalesIds = List<int>.from(data['animalesIds'] ?? []);
    batch.lastUpdatedAt = remoteUpdatedAt;
    batch.syncStatus = EstadoSync.completado;

    await IsarService.isar.batchEventRecords.put(batch);
  }
}
