// lib/nucleo/modelos/configuracion_local.dart
import 'package:isar/isar.dart';

part 'configuracion_local.g.dart';

@collection
class ConfiguracionLocal {
  Id id = 1; // Solo una configuración por dispositivo
  
  // ===== PREFERENCIAS DE USUARIO =====
  bool modoOscuro = false;
  String idioma = 'es';
  String unidadPeso = 'kg'; // kg, lb
  String unidadTemperatura = 'C'; // C, F
  String formatoFecha = 'dd/MM/yyyy';
  bool sonidosActivos = true;
  bool vibracionActiva = true;
  
  // ===== NOTIFICACIONES =====
  bool notificacionesActivas = true;
  bool notificacionesVacunas = true;
  bool notificacionesPartos = true;
  bool notificacionesTratamientos = true;
  bool notificacionesPesajes = true;
  String horaNotificacionDiaria = '07:00';
  
  // ===== SINCRONIZACIÓN =====
  int intervaloSyncMinutos = 30;
  bool syncAutomatico = true;
  bool syncSoloWifi = true;
  bool syncEnSegundoPlano = true;
  DateTime? ultimaSync;
  DateTime? ultimaSyncExitosa;
  int registrosPendientesSync = 0;
  
  // ===== HARDWARE NFC/BLUETOOTH =====
  String? dispositivoBLEVinculado;
  String? nombreDispositivoBLE;
  String? macDispositivoBLE;
  int rangoLecturaCm = 50;
  int potenciaLecturaNFC = 100; // 0-100%
  bool sonidoLecturaExitosa = true;
  bool vibracionLecturaExitosa = true;
  int timeoutLecturaSeg = 10;
  
  // ===== ALERTAS Y RECORDATORIOS =====
  int diasAnticipacionVacunas = 7;
  int diasAnticipacionDesparasitante = 3;
  int diasAnticipacionParto = 5;
  bool alertasStockMedicamentos = true;
  int umbralMinimoMedicamentos = 5;
  
  // ===== CACHE Y OPTIMIZACIÓN =====
  int diasCacheFotos = 30;
  bool compresionFotos = true;
  int calidadFotosJpeg = 80; // 0-100
  int maxAnchoFotos = 1920;
  int maxAltoFotos = 1080;
  bool eliminarCacheAutomatico = true;
  int maxCacheMB = 500;
  
  // ===== SEGURIDAD =====
  bool requierePin = false;
  String? pinHash;
  bool bloqueoInactividad = true;
  int minutosInactividad = 15;
  bool cifradoLocal = false;
  DateTime? ultimoAcceso;
  
  // ===== BACKUP =====
  bool backupAutomatico = true;
  String? rutaBackup;
  int diasRetencionBackup = 30;
  DateTime? ultimoBackup;
  bool backupEnNube = false;
  
  // ===== DATOS DEL RANCHO =====
  String? nombreRancho;
  String? propietario;
  String? telefono;
  String? email;
  String? direccion;
  String? municipio;
  String? estado;
  String? codigoPostal;
  String? registroGanadero;
  String? logoUrl;
  
  // ===== PREFERENCIAS DE VISUALIZACIÓN =====
  bool mostrarFotosLista = true;
  String vistaListaDefecto = 'grid'; // grid, list, cards
  String ordenListaDefecto = 'nombre'; // nombre, fecha, arete
  bool ordenAscendente = true;
  int registrosPorPagina = 20;
  
  // ===== ESTADÍSTICAS DE USO =====
  int totalAnimalesRegistrados = 0;
  int totalEventosRegistrados = 0;
  DateTime? fechaInstalacion;
  int diasUsoConsecutivos = 0;
  DateTime? fechaUltimoUso;
}
