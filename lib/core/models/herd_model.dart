import 'package:isar/isar.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';

part 'herd_model.g.dart';

@collection
class Herd {
  Id id = Isar.autoIncrement;
  late String name;
  late String ownerUid;
  String estado = '';
  String municipio = '';
  int totalCattleCount = 0;

  // ===== SINCRONIZACIÓN =====
  @Index()
  String? serverId; // id remoto en Firestore
  DateTime? lastUpdatedAt;

  @Enumerated(EnumType.name)
  EstadoSync syncStatus = EstadoSync.pendiente;

  @Backlink(to: 'herd')
  final animales = IsarLinks<Animal>();
}
