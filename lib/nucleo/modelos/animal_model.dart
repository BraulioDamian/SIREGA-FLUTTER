// lib/nucleo/modelos/animal_model.dart
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/herd_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/modelos/siniga_model.dart'; // <-- AÑADIDO

part 'animal_model.g.dart';

@collection
class Animal {
  Id id = Isar.autoIncrement;
  
  // ===== IDENTIFICACIÓN =====
  @Index(unique: true, caseSensitive: false)
  String? idAreteNFC;
  
  // Campo separado para el ID puro del chip NFC (para búsquedas de escaneo)
  @Index(unique: true, caseSensitive: false)
  String? nfcChipId;
  
  // El campo idAreteSINIIGA ha sido reemplazado por siniigaId
  SinigaId? siniigaId; // <-- CAMBIADO
  
  String? idAreteVisual;
  String? numeroHerrado;
  String? codigoBarras;
  
  // ===== DATOS BÁSICOS =====
  late String nombre;
  
  @Enumerated(EnumType.name)
  late Sexo sexo;
  
  late String raza;
  late DateTime fechaNacimiento;
  double? pesoNacimiento;
  String? colorPelaje;
  String? senasParticulares;
  
  // ===== GEOLOCALIZACIÓN === ==
  double? latitud;
  double? longitud;
  DateTime? fechaUbicacion;
  String? zonaActual; // Potrero A, Corral 1, etc
  
  // ===== MULTIMEDIA =====
  List<String> fotosUrls = [];
  String? fotoPerfilUrl;
  String? fotoUrl; // Mantener compatibilidad
  List<String> videosUrls = [];
  List<String> documentosUrls = [];
  
  // ===== GENEALOGÍA =====
  final padre = IsarLink<Animal>();
  final madre = IsarLink<Animal>();
  String? razaPadre;
  String? razaMadre;
  int? generacion;
  String? registroGenealogico;
  double? consanguinidad;
  
  // ===== ESTADO Y SALUD =====
  @Enumerated(EnumType.name)
  EstadoAnimal estado = EstadoAnimal.activo;

  @Enumerated(EnumType.name)
  EstadoSalud estadoSalud = EstadoSalud.sano;

  // Descripción obligatoria cuando el estado es enfermo, crítico o en tratamiento
  String? descripcionSalud;

  DateTime? fechaUltimaRevision;
  String? veterinarioUltimaRevision;
  double? temperaturaActual;
  int? frecuenciaCardiaca;
  int? frecuenciaRespiratoria;
  
  // ===== REPRODUCCIÓN =====
  @Enumerated(EnumType.name)
  EstadoReproductivo? estadoReproductivo;
  
  DateTime? fechaUltimoParto;
  DateTime? fechaProximoParto;
  int numeroPartos = 0;
  int numeroCrias = 0;
  DateTime? fechaUltimoServicio;
  String? toroUltimoServicio;
  bool gestante = false;
  int? diasGestacion;
  DateTime? fechaProximoCelo;
  
  // ===== PRODUCCIÓN =====
  double? promedioLecheDiario;
  double? produccionLecheTotal;
  double? pesoActual;
  double? gananciaPromedioDiaria;
  DateTime? fechaUltimoPesaje;
  
  // ===== DATOS ECONÓMICOS =====
  double? valorCompra;
  double? valorEstimado;
  DateTime? fechaCompra;
  String? vendedor;
  String? compradorPotencial;
  double? costoMantenimientoMensual;
  double? ingresoGeneradoTotal;
  
  // ===== ALIMENTACIÓN =====
  String? tipoAlimentacion;
  double? consumoDiarioKg;
  List<String> suplementos = [];
  String? programaNutricional;
  
  // ===== METADATA Y NOTAS =====
  String? notas;
  @ignore
  Map<String, String> camposPersonalizados = {};
  List<String> etiquetas = [];
  
  // ===== SINCRONIZACIÓN =====
  @Index()
  String? serverId;
  DateTime? ultimaActualizacion;
  
  @Enumerated(EnumType.name)
  EstadoSync estadoSync = EstadoSync.pendiente;
  
  int versionLocal = 1;
  String? hashDatos;
  
  // ===== TRAZABILIDAD =====
  String? usuarioCreacion;
  DateTime fechaCreacion = DateTime.now();
  String? usuarioModificacion;
  List<String> historialModificaciones = [];
  
  // ===== RELACIONES =====
  final herd = IsarLink<Herd>();
  
  @Backlink(to: 'animal')
  final eventos = IsarLinks<EventoSanitario>();
  
  @Backlink(to: 'animal')
  final producciones = IsarLinks<RegistroProduccion>();
  
  @Backlink(to: 'madre')
  final crias = IsarLinks<Animal>();

  @ignore
  String get idAreteVisualParaMostrar {
    if (idAreteVisual != null && idAreteVisual!.trim().isNotEmpty) {
      return idAreteVisual!.trim();
    }
    return 'Sin Arete';
  }

  @ignore
  String get idSinigaParaMostrar {
    if (siniigaId != null && siniigaId!.esValidoBasico) {
      return siniigaId!.formatoVisual;
    }
    return 'Sin Arete';
  }
  
  // ===== MÉTODOS DE UTILIDAD =====
  int getEdadEnMeses() {
    final ahora = DateTime.now();
    final diferencia = ahora.difference(fechaNacimiento);
    return (diferencia.inDays / 30).floor();
  }
  
  int getEdadEnDias() {
    final ahora = DateTime.now();
    return ahora.difference(fechaNacimiento).inDays;
  }
  
  String getEdadFormateada() {
    final meses = getEdadEnMeses();
    if (meses < 12) {
      return '$meses meses';
    } else {
      final anos = (meses / 12).floor();
      final mesesRestantes = meses % 12;
      if (mesesRestantes == 0) {
        return '$anos año${anos > 1 ? 's' : ''}';
      }
      return '$anos año${anos > 1 ? 's' : ''} $mesesRestantes mes${mesesRestantes > 1 ? 'es' : ''}';
    }
  }
  
  bool necesitaVacunacion() {
    // Lógica para determinar si necesita vacunación
    return true; // Placeholder
  }
  
  bool necesitaDesparasitacion() {
    // Lógica para determinar si necesita desparasitación
    return true; // Placeholder
  }
}