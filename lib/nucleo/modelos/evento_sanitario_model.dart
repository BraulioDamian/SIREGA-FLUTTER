// lib/nucleo/modelos/evento_sanitario_model.dart
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

part 'evento_sanitario_model.g.dart';

@collection
class EventoSanitario {
  Id id = Isar.autoIncrement;
  @Enumerated(EnumType.name)
  late TipoEvento tipo;
  late DateTime fecha;
  late String nombreProducto;
  String? dosis;
  String? notas;
  @Enumerated(EnumType.name)
  Prioridad prioridad = Prioridad.baja;
  final animal = IsarLink<Animal>();
  @Index()
  String? serverId;
  DateTime? ultimaActualizacion;
}