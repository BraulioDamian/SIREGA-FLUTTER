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

    final animales = await isar.animals.getAll(animalesIds);

    await isar.writeTxn(() async {
      final List<EventoSanitario> eventos = [];
      for (final animal in animales) {
        if (animal == null) continue;
        final evento = EventoSanitario()
          ..tipo = tipo
          ..fecha = fecha
          ..nombreProducto = producto
          ..dosis = dosis
          ..unidadDosis = unidadDosis
          ..veterinario = veterinario
          ..notas = notas
          ..loteId = loteId
          ..totalAnimalesLote = animales.length;
        
        eventos.add(evento);
      }
      await isar.eventoSanitarios.putAll(eventos);

      for(var i = 0; i < eventos.length; i++){
        eventos[i].animal.value = animales[i];
      }
      await isar.eventoSanitarios.putAll(eventos);

      // Guardar registro del lote (para historial)
      final lote = LoteEvento()
        ..loteId = loteId
        ..tipo = tipo
        ..fecha = fecha
        ..nombreProducto = producto
        ..cantidadAnimales = animales.length
        ..animalesIds = animales.map((a) => a!.id).toList();

      await isar.loteEventos.put(lote);
    });
  }
}
