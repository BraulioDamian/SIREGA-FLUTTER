// lib/nucleo/modelos/alerta.dart
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';

part 'alerta.g.dart';

@collection
class Alerta {
  Id id = Isar.autoIncrement;
  
  @Enumerated(EnumType.name)
  late TipoAlerta tipo;
  
  late String titulo;
  late String mensaje;
  String? descripcionDetallada;
  
  // Relación con el animal afectado
  final animal = IsarLink<Animal>();
  String? idAnimalReferencia; // Para búsqueda rápida
  
  // Temporalidad
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaProgramada;
  DateTime? fechaVencimiento;
  DateTime? fechaLectura;
  DateTime? fechaDismiss;
  
  // Estado
  bool leida = false;
  bool procesada = false;
  bool dismissPermanente = false;
  bool requiereAccion = true;
  
  @Enumerated(EnumType.name)
  Prioridad prioridad = Prioridad.media;
  
  @Enumerated(EnumType.name)
  EstadoAlerta estado = EstadoAlerta.activa;
  
  // Datos adicionales según tipo
  @ignore
  Map<String, String> datosAdicionales = {};
  String? accionRequerida;
  String? urlAccion;
  
  // Recurrencia
  bool esRecurrente = false;
  String? patronRecurrencia; // daily, weekly, monthly
  int? intervaloRecurrencia;
  DateTime? proximaOcurrencia;
  
  // Agrupación
  String? grupoId;
  String? categoriaId;
  List<String> etiquetas = [];
  
  // Usuario
  String? usuarioAsignado;
  String? creadoPor;
  
  // Seguimiento
  List<String> historialAcciones = [];
  String? resolucion;
  DateTime? fechaResolucion;
  String? resueltoPor;
}
