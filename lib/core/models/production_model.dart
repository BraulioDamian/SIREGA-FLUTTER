import 'package:isar/isar.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';

part 'production_model.g.dart';

@collection
class ProductionRecord {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  late ProductionType tipo;

  late DateTime date;
  String? idCria; // para birth
  double? pesoKg; // para weight
  double? litrosPorDia; // para milk

  @Enumerated(EnumType.name)
  Sexo? sexoCria; // para birth (antes se codificaba en notes)

  String? notes;
  final animal = IsarLink<Animal>();

  // ===== SINCRONIZACIÓN =====
  @Index()
  String? serverId;
  DateTime? lastUpdatedAt;

  @Enumerated(EnumType.name)
  EstadoSync syncStatus = EstadoSync.pendiente;
}
