import 'package:isar/isar.dart';
import 'package:sirega_app/core/models/enums.dart';

part 'batch_event_model.g.dart';

@collection
class BatchEventRecord {
  Id id = Isar.autoIncrement;
  late String loteId; // UUID

  @Enumerated(EnumType.name)
  late TipoEvento tipo;

  late DateTime date;
  String? productName;
  late int cantidadAnimales;

  // IDs de los animales en el lote
  List<int> animalesIds = [];

  DateTime createdAt = DateTime.now();

  // ===== SINCRONIZACIÓN =====
  @Index()
  String? serverId;
  DateTime? lastUpdatedAt;

  @Enumerated(EnumType.name)
  EstadoSync syncStatus = EstadoSync.pendiente;
}
