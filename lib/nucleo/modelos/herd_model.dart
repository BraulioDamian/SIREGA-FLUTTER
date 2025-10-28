import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

part 'herd_model.g.dart';

@collection
class Herd {
  Id id = Isar.autoIncrement;
  late String nombre;
  late String ownerUid;
  String estado = '';
  String municipio = '';
  int totalCattleCount = 0;

  // ===== SINCRONIZACIÓN =====
  @Index()
  String? serverId; // id remoto en Firestore
  DateTime? ultimaActualizacion;

  @Enumerated(EnumType.name)
  EstadoSync estadoSync = EstadoSync.pendiente;

  @Backlink(to: 'herd')
  final animales = IsarLinks<Animal>();
}
