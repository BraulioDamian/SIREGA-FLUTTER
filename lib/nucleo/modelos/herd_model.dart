import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';

part 'herd_model.g.dart';

@collection
class Herd {
  Id id = Isar.autoIncrement;
  late String nombre;
  late String ownerUid;
  String estado = '';
  String municipio = '';
  int totalCattleCount = 0;
  @Index()
  String? serverId; // id remoto en Firestore
  DateTime? ultimaActualizacion;

  @Backlink(to: 'herd')
  final animales = IsarLinks<Animal>();
}
