import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

part 'produccion_model.g.dart';

@collection
class RegistroProduccion {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  late ProductionType tipo;

  late DateTime fecha;
  String? idCria; // para birth
  double? pesoKg; // para weight
  double? litrosPorDia; // para milk

  @Enumerated(EnumType.name)
  Sexo? sexoCria; // para birth (antes se codificaba en notas)

  String? notas;
  final animal = IsarLink<Animal>();

  // ===== SINCRONIZACIÓN =====
  @Index()
  String? serverId;
  DateTime? ultimaActualizacion;

  @Enumerated(EnumType.name)
  EstadoSync estadoSync = EstadoSync.pendiente;
}
