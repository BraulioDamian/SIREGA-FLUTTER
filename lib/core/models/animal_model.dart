// lib/nucleo/modelos/animal_model.dart
import 'package:isar/isar.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/models/medical_event_model.dart';
import 'package:sirega_app/core/models/herd_model.dart';
import 'package:sirega_app/core/models/production_model.dart';
import 'package:sirega_app/core/models/siniga_model.dart'; // <-- AÑADIDO

part 'animal_model.g.dart';

@collection
class Animal {
  Id id = Isar.autoIncrement;

  // ===== IDENTIFICACIÓN =====
  @Index(unique: true, caseSensitive: false)
  String? rfidTagId;

  // Campo separado para el ID puro del chip NFC (para búsquedas de escaneo)
  @Index(unique: true, caseSensitive: false)
  String? nfcChipId;

  // El campo idAreteSINIIGA ha sido reemplazado por siniigaId
  SinigaId? siniigaId; // <-- CAMBIADO

  String? visualTagId;
  String? brandNumber;
  String? barcode;

  // ===== DATOS BÁSICOS =====
  late String name;

  @Enumerated(EnumType.name)
  late Sexo sex;

  late String breed;
  late DateTime birthDate;
  double? birthWeight;
  String? coatColor;
  String? distinctiveMarks;

  // ===== GEOLOCALIZACIÓN === ==
  double? latitude;
  double? longitude;
  DateTime? locationDate;
  String? currentLocation; // Potrero A, Corral 1, etc

  // ===== MULTIMEDIA =====
  List<String> photoUrls = [];
  String? profilePhotoUrl;
  String? photoUrl; // Mantener compatibilidad
  List<String> videoUrls = [];
  List<String> documentUrls = [];

  // ===== GENEALOGÍA =====
  final sire = IsarLink<Animal>();
  final dam = IsarLink<Animal>();
  String? sireBreed;
  String? damBreed;
  int? generation;
  String? registrationNumber;
  double? consiguity;

  // ===== ESTADO Y SALUD =====
  @Enumerated(EnumType.name)
  EstadoAnimal estado = EstadoAnimal.activo;

  @Enumerated(EnumType.name)
  EstadoSalud healthStatus = EstadoSalud.sano;

  // Descripción obligatoria cuando el estado es enfermo, crítico o en tratamiento
  String? healthDescription;

  DateTime? lastCheckupDate;
  String? lastCheckupVeterinarian;
  double? currentTemperature;
  int? heartRate;
  int? respiratoryRate;

  // ===== REPRODUCCIÓN =====
  @Enumerated(EnumType.name)
  EstadoReproductivo? reproductiveStatus;

  DateTime? lastCalvingDate;
  DateTime? nextCalvingDate;
  int calvingCount = 0;
  int offspringCount = 0;
  DateTime? lastServiceDate;
  String? lastServiceBull;
  bool isPregnant = false;
  int? gestationDays;
  DateTime? nextHeatDate;

  // ===== PRODUCCIÓN =====
  double? dailyMilkYield;
  double? totalMilkYield;
  double? currentWeight;
  double? averageDailyGain;
  DateTime? lastWeighDate;

  // ===== DATOS ECONÓMICOS =====
  double? purchasePrice;
  double? estimatedValue;
  DateTime? purchaseDate;
  String? seller;
  String? potentialBuyer;
  double? monthlyMaintenanceCost;
  double? totalRevenueGenerated;

  // ===== ALIMENTACIÓN =====
  String? dietType;
  double? dailyConsumptionKg;
  List<String> supplements = [];
  String? nutritionalProgram;

  // ===== METADATA Y NOTAS =====
  String? notes;
  @ignore
  Map<String, String> customFields = {};
  List<String> tags = [];

  // ===== SINCRONIZACIÓN =====
  @Index()
  String? serverId;
  DateTime? lastUpdatedAt;

  @Enumerated(EnumType.name)
  EstadoSync syncStatus = EstadoSync.pendiente;

  int localVersion = 1;
  String? dataHash;

  // ===== TRAZABILIDAD =====
  String? createdBy;
  DateTime createdAt = DateTime.now();
  String? modifiedBy;
  List<String> modificationHistory = [];

  // ===== RELACIONES =====
  final herd = IsarLink<Herd>();

  @Backlink(to: 'animal')
  final events = IsarLinks<MedicalEventRecord>();

  @Backlink(to: 'animal')
  final productions = IsarLinks<ProductionRecord>();

  @Backlink(to: 'dam')
  final offspring = IsarLinks<Animal>();

  @ignore
  String get displayVisualTagId {
    if (visualTagId != null && visualTagId!.trim().isNotEmpty) {
      return visualTagId!.trim();
    }
    return 'Sin Arete';
  }

  @ignore
  String get displaySiniigaId {
    if (siniigaId != null && siniigaId!.esValidoBasico) {
      return siniigaId!.formatoVisual;
    }
    return 'Sin Arete';
  }

  // ===== MÉTODOS DE UTILIDAD =====
  int getAgeInMonths() {
    final ahora = DateTime.now();
    final diferencia = ahora.difference(birthDate);
    return (diferencia.inDays / 30).floor();
  }

  int getAgeInDays() {
    final ahora = DateTime.now();
    return ahora.difference(birthDate).inDays;
  }

  String getFormattedAge() {
    final meses = getAgeInMonths();
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

  bool needsVaccination() {
    // Lógica para determinar si necesita vacunación
    return true; // Placeholder
  }

  bool needsDeworming() {
    // Lógica para determinar si necesita desparasitación
    return true; // Placeholder
  }
}
