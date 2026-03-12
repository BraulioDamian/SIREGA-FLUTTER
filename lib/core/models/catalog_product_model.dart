// lib/nucleo/modelos/catalog_product_model.dart
import 'package:isar/isar.dart';
import 'package:sirega_app/core/models/enums.dart';

part 'catalog_product_model.g.dart';

@collection
class CatalogProduct {
  Id id = Isar.autoIncrement;
  late String name;
  String? description;
  @Enumerated(EnumType.name)
  late TipoEvento tipo;
  bool esDeSistema = true;
}
