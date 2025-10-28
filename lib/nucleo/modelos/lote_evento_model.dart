import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

part 'lote_evento_model.g.dart';

@collection
class LoteEvento {
  Id id = Isar.autoIncrement;
  late String loteId; // UUID

  @Enumerated(EnumType.name)
  late TipoEvento tipo;

  late DateTime fecha;
  String? nombreProducto;
  late int cantidadAnimales;

  // IDs de los animales en el lote
  List<int> animalesIds = [];

  DateTime fechaCreacion = DateTime.now();
}
