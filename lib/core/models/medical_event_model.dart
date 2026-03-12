import 'package:isar/isar.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';

part 'medical_event_model.g.dart';

@collection
class MedicalEventRecord {
  Id id = Isar.autoIncrement;

  final animal = IsarLink<Animal>();

  // Para events masivos
  String? loteId; // UUID del lote de events
  int? totalAnimalesLote;

  @Enumerated(EnumType.name)
  late TipoEvento tipo;

  late DateTime date;
  String? productName;
  double? dose;
  String? doseUnit; // ml, mg, tabletas
  String? veterinarian;
  String? applicationRoute; // Subcutánea, Intramuscular, Oral, etc.
  String? notes;

  /// true = vacuna de dose única (ej. Brucelosis), false = periódica con refuerzos
  bool esAplicacionUnica = false;

  /// Intervalo recomendado en días entre aplicaciones (null si es única)
  int? intervaloDiasRecomendado;

  DateTime? nextApplicationDate; // Para refuerzos

  @Enumerated(EnumType.name)
  Prioridad prioridad = Prioridad.media;

  DateTime createdAt = DateTime.now();

  // ===== SINCRONIZACIÓN =====
  @Index()
  String? serverId;
  DateTime? lastUpdatedAt;

  @Enumerated(EnumType.name)
  EstadoSync syncStatus = EstadoSync.pendiente;
}
