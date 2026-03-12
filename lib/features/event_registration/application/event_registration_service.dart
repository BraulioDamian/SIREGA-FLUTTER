import 'package:isar/isar.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/models/medical_event_model.dart';
import 'package:sirega_app/core/models/batch_event_model.dart';
import 'package:uuid/uuid.dart';

class EventRegistrationService {
  final Isar isar;

  EventRegistrationService(this.isar);

  Future<void> registrarEvento({
    required TipoEvento tipo,
    required String producto,
    required DateTime date,
    required List<int> animalesIds,
    double? dose,
    String? doseUnit,
    String? veterinarian,
    String? applicationRoute,
    DateTime? nextApplicationDate,
    String? notes,
  }) async {
    final loteId = const Uuid().v4();
    final ahora = DateTime.now();

    final animales = await isar.animals.getAll(animalesIds);

    // Filtrar animales nulos
    final animalesValidos = animales.whereType<Animal>().toList();

    if (animalesValidos.isEmpty) {
      throw Exception(
        'No se encontraron animales válidos para registrar el evento',
      );
    }

    await isar.writeTxn(() async {
      final List<MedicalEventRecord> events = [];

      // Crear un evento para cada animal
      for (final animal in animalesValidos) {
        final evento = MedicalEventRecord()
          ..tipo = tipo
          ..date = date
          ..productName = producto
          ..dose = dose
          ..doseUnit = doseUnit
          ..veterinarian = veterinarian
          ..applicationRoute = applicationRoute
          ..nextApplicationDate = nextApplicationDate
          ..notes = notes
          ..loteId = loteId
          ..totalAnimalesLote = animalesValidos.length
          ..createdAt = ahora
          ..syncStatus = EstadoSync.pendiente;

        // Asignar el animal antes de guardar
        evento.animal.value = animal;
        events.add(evento);
      }

      // Guardar todos los events
      await isar.medicalEventRecords.putAll(events);

      // Guardar las relaciones
      for (final evento in events) {
        await evento.animal.save();
      }

      // Actualizar la date de última revisión del animal si es una revisión veterinaria
      if (tipo == TipoEvento.revisionVeterinaria) {
        for (final animal in animalesValidos) {
          animal.lastCheckupDate = date;
        }
        await isar.animals.putAll(animalesValidos);
      }

      // Guardar registro del lote (para historial)
      final lote = BatchEventRecord()
        ..loteId = loteId
        ..tipo = tipo
        ..date = date
        ..productName = producto
        ..cantidadAnimales = animalesValidos.length
        ..animalesIds = animalesValidos.map((a) => a.id).toList()
        ..createdAt = ahora
        ..syncStatus = EstadoSync.pendiente;

      await isar.batchEventRecords.put(lote);
    });
  }
}
