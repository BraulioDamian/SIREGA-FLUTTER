// Data Transfer Objects (DTO) for Firestore

class UserDto {
  final String email;
  final String fullName;
  final DateTime createdAt;
  final List<String> accessibleHerds;
  const UserDto({required this.email, required this.fullName, required this.createdAt, required this.accessibleHerds});
  Map<String, dynamic> toJson() => {
    'email': email,
    'fullName': fullName,
    'createdAt': createdAt.toUtc().toIso8601String(),
    'accessibleHerds': accessibleHerds,
  };
  static UserDto fromJson(Map<String, dynamic> j) => UserDto(
    email: j['email'] ?? '',
    fullName: j['fullName'] ?? '',
    createdAt: DateTime.parse(j['createdAt']),
    accessibleHerds: (j['accessibleHerds'] as List?)?.cast<String>() ?? const [],
  );
}

class HerdDto {
  final String name;
  final String ownerUid;
  final String state;
  final String municipality;
  final int totalCattleCount;
  const HerdDto({required this.name, required this.ownerUid, required this.state, required this.municipality, required this.totalCattleCount});
  Map<String, dynamic> toJson() => {
    'name': name,
    'ownerUid': ownerUid,
    'location': {'state': state, 'municipality': municipality},
    'totalCattleCount': totalCattleCount,
  };
  static HerdDto fromJson(Map<String, dynamic> j) => HerdDto(
    name: j['name'] ?? '',
    ownerUid: j['ownerUid'] ?? '',
    state: (j['location']?['state'] ?? '') as String,
    municipality: (j['location']?['municipality'] ?? '') as String,
    totalCattleCount: (j['totalCattleCount'] ?? 0) as int,
  );
}

class CattleDto {
  final String visualId;
  final String name;
  final String breed;
  final DateTime birthDate;
  final String gender; // Hembra|Macho
  final String status; // Activo|Vendido|Muerto
  final String? photoUrl;
  final String? notes;
  final DateTime lastUpdated;
  const CattleDto({required this.visualId, required this.name, required this.breed, required this.birthDate, required this.gender, required this.status, this.photoUrl, this.notes, required this.lastUpdated});
  Map<String, dynamic> toJson() => {
    'visualId': visualId,
    'name': name,
    'breed': breed,
    'birthDate': birthDate.toUtc().toIso8601String(),
    'gender': gender,
    'status': status,
    'photoUrl': photoUrl,
    'notes': notes,
    'lastUpdated': lastUpdated.toUtc().toIso8601String(),
  };
  static CattleDto fromJson(Map<String, dynamic> j) => CattleDto(
    visualId: j['visualId'] ?? '',
    name: j['name'] ?? '',
    breed: j['breed'] ?? '',
    birthDate: DateTime.parse(j['birthDate']),
    gender: j['gender'] ?? '',
    status: j['status'] ?? '',
    photoUrl: j['photoUrl'],
    notes: j['notes'],
    lastUpdated: DateTime.parse(j['lastUpdated']),
  );
}

class HealthRecordDto {
  final String eventType;
  final String productName;
  final String dose;
  final String vetInCharge;
  final String? notes;
  final DateTime eventDate;
  const HealthRecordDto({required this.eventType, required this.productName, required this.dose, required this.vetInCharge, this.notes, required this.eventDate});
  Map<String, dynamic> toJson() => {
    'eventType': eventType,
    'productName': productName,
    'dose': dose,
    'vetInCharge': vetInCharge,
    'notes': notes,
    'eventDate': eventDate.toUtc().toIso8601String(),
  };
  static HealthRecordDto fromJson(Map<String, dynamic> j) => HealthRecordDto(
    eventType: j['eventType'] ?? '',
    productName: j['productName'] ?? '',
    dose: j['dose'] ?? '',
    vetInCharge: j['vetInCharge'] ?? '',
    notes: j['notes'],
    eventDate: DateTime.parse(j['eventDate']),
  );
}

class GenealogyDto {
  final String relationship; // Madre|Padre
  final String parentNfcTagId;
  const GenealogyDto({required this.relationship, required this.parentNfcTagId});
  Map<String, dynamic> toJson() => {
    'relationship': relationship,
    'parentNfcTagId': parentNfcTagId,
  };
  static GenealogyDto fromJson(Map<String, dynamic> j) => GenealogyDto(
    relationship: j['relationship'] ?? '',
    parentNfcTagId: j['parentNfcTagId'] ?? '',
  );
}

class ProductionRecordDto {
  final String eventType; // Parto|Pesaje|Producción de Leche
  final DateTime eventDate;
  final String? offspringId;
  final num? weightKg;
  final num? litersPerDay;
  final String? notes;
  const ProductionRecordDto({required this.eventType, required this.eventDate, this.offspringId, this.weightKg, this.litersPerDay, this.notes});
  Map<String, dynamic> toJson() => {
    'eventType': eventType,
    'eventDate': eventDate.toUtc().toIso8601String(),
    'value': {
      if (offspringId != null) 'offspringId': offspringId,
      if (weightKg != null) 'weightKg': weightKg,
      if (litersPerDay != null) 'litersPerDay': litersPerDay,
    },
    'notes': notes,
  };
  static ProductionRecordDto fromJson(Map<String, dynamic> j) => ProductionRecordDto(
    eventType: j['eventType'] ?? '',
    eventDate: DateTime.parse(j['eventDate']),
    offspringId: (j['value']?['offspringId']) as String?,
    weightKg: (j['value']?['weightKg']) as num?,
    litersPerDay: (j['value']?['litersPerDay']) as num?,
    notes: j['notes'],
  );
}
