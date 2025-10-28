import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

part 'evento_sanitario_model.g.dart';

@collection
class EventoSanitario {
  Id id = Isar.autoIncrement;

  final animal = IsarLink<Animal>();

  // Para eventos masivos
  String? loteId; // UUID del lote de eventos
  int? totalAnimalesLote;

  @Enumerated(EnumType.name)
  late TipoEvento tipo;

  late DateTime fecha;
  String? nombreProducto;
  double? dosis;
  String? unidadDosis; // ml, mg, tabletas
  String? veterinario;
  String? notas;

  DateTime? fechaProximaAplicacion; // Para refuerzos

  @Enumerated(EnumType.name)
  Prioridad prioridad = Prioridad.media;

  DateTime fechaCreacion = DateTime.now();

  // ===== SINCRONIZACIÓN =====
  @Index()
  String? serverId;
  DateTime? ultimaActualizacion;

  @Enumerated(EnumType.name)
  EstadoSync estadoSync = EstadoSync.pendiente;
}