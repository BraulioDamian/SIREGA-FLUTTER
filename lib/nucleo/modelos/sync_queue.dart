// lib/nucleo/modelos/sync_queue.dart
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

part 'sync_queue.g.dart';

@collection
class SyncQueue {
  Id id = Isar.autoIncrement;
  
  @Enumerated(EnumType.name)
  late TipoOperacion operacion;
  
  @Enumerated(EnumType.name)
  late TipoEntidad entidad;
  
  late int entidadId;
  late String datosJson; // Datos serializados en JSON
  
  DateTime fechaCreacion = DateTime.now();
  DateTime? fechaUltimoIntento;
  int intentos = 0;
  int maxIntentos = 5;
  
  @Enumerated(EnumType.name)
  EstadoSync estado = EstadoSync.pendiente;
  
  String? mensajeError;
  String? stackTrace;
  
  @Index()
  int prioridad = 0; // 0=normal, 1=alta, 2=crítica
  
  // Para reintentos exponenciales
  int tiempoEsperaSegundos = 30;
  
  // Metadata
  String? dispositivoOrigen;
  String? usuarioId;
  
  // Para detección de conflictos
  String? hashOriginal;
  int? versionOriginal;
}
