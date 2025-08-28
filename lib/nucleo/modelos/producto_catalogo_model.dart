// lib/nucleo/modelos/producto_catalogo_model.dart
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

part 'producto_catalogo_model.g.dart';

@collection
class ProductoCatalogo {
  Id id = Isar.autoIncrement;
  late String nombre;
  String? descripcion;
  @Enumerated(EnumType.name)
  late TipoEvento tipo;
  bool esDeSistema = true;
}