import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';

part 'produccion_model.g.dart';

@collection
class RegistroProduccion {
  Id id = Isar.autoIncrement;
  // Parto | Pesaje | Producción de Leche
  late String tipo;
  late DateTime fecha;
  String? idCria; // para Parto
  double? pesoKg; // para Pesaje
  double? litrosPorDia; // para Producción de Leche
  String? notas;
  final animal = IsarLink<Animal>();
  @Index()
  String? serverId;
  DateTime? ultimaActualizacion;
}
