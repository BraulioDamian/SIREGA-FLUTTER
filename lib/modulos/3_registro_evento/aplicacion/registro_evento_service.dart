import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/lote_evento_model.dart';
import 'package:uuid/uuid.dart';

class RegistroEventoService {
  final Isar isar;

  RegistroEventoService(this.isar);

  Future<void> registrarEvento({
    required TipoEvento tipo,
    required String producto,
    required DateTime fecha,
    required List<int> animalesIds,
    double? dosis,
    String? unidadDosis,
    String? veterinario,
    String? notas,
  }) async {
    final loteId = const Uuid().v4();
    final ahora = DateTime.now();

    final animales = await isar.animals.getAll(animalesIds);

    // Filtrar animales nulos
    final animalesValidos = animales.whereType<Animal>().toList();

    if (animalesValidos.isEmpty) {
      throw Exception('No se encontraron animales válidos para registrar el evento');
    }

    await isar.writeTxn(() async {
      final List<EventoSanitario> eventos = [];

      // Crear un evento para cada animal
      for (final animal in animalesValidos) {
        final evento = EventoSanitario()
          ..tipo = tipo
          ..fecha = fecha
          ..nombreProducto = producto
          ..dosis = dosis
          ..unidadDosis = unidadDosis
          ..veterinario = veterinario
          ..notas = notas
          ..loteId = loteId
          ..totalAnimalesLote = animalesValidos.length
          ..fechaCreacion = ahora
          ..estadoSync = EstadoSync.pendiente;

        // Asignar el animal antes de guardar
        evento.animal.value = animal;
        eventos.add(evento);
      }

      // Guardar todos los eventos
      await isar.eventoSanitarios.putAll(eventos);

      // Guardar las relaciones
      for (final evento in eventos) {
        await evento.animal.save();
      }

      // Actualizar la fecha de última revisión del animal si es una revisión veterinaria
      if (tipo == TipoEvento.revisionVeterinaria) {
        for (final animal in animalesValidos) {
          animal.fechaUltimaRevision = fecha;
        }
        await isar.animals.putAll(animalesValidos);
      }

      // Guardar registro del lote (para historial)
      final lote = LoteEvento()
        ..loteId = loteId
        ..tipo = tipo
        ..fecha = fecha
        ..nombreProducto = producto
        ..cantidadAnimales = animalesValidos.length
        ..animalesIds = animalesValidos.map((a) => a.id).toList()
        ..fechaCreacion = ahora
        ..estadoSync = EstadoSync.pendiente;

      await isar.loteEventos.put(lote);
    });
  }
}
