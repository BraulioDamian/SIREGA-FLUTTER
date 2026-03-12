// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnimalCollection on Isar {
  IsarCollection<Animal> get animals => this.collection();
}

const AnimalSchema = CollectionSchema(
  name: r'Animal',
  id: 5509621733869852096,
  properties: {
    r'averageDailyGain': PropertySchema(
      id: 0,
      name: r'averageDailyGain',
      type: IsarType.double,
    ),
    r'barcode': PropertySchema(id: 1, name: r'barcode', type: IsarType.string),
    r'birthDate': PropertySchema(
      id: 2,
      name: r'birthDate',
      type: IsarType.dateTime,
    ),
    r'birthWeight': PropertySchema(
      id: 3,
      name: r'birthWeight',
      type: IsarType.double,
    ),
    r'brandNumber': PropertySchema(
      id: 4,
      name: r'brandNumber',
      type: IsarType.string,
    ),
    r'breed': PropertySchema(id: 5, name: r'breed', type: IsarType.string),
    r'calvingCount': PropertySchema(
      id: 6,
      name: r'calvingCount',
      type: IsarType.long,
    ),
    r'coatColor': PropertySchema(
      id: 7,
      name: r'coatColor',
      type: IsarType.string,
    ),
    r'consiguity': PropertySchema(
      id: 8,
      name: r'consiguity',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 9,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'createdBy': PropertySchema(
      id: 10,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'currentLocation': PropertySchema(
      id: 11,
      name: r'currentLocation',
      type: IsarType.string,
    ),
    r'currentTemperature': PropertySchema(
      id: 12,
      name: r'currentTemperature',
      type: IsarType.double,
    ),
    r'currentWeight': PropertySchema(
      id: 13,
      name: r'currentWeight',
      type: IsarType.double,
    ),
    r'dailyConsumptionKg': PropertySchema(
      id: 14,
      name: r'dailyConsumptionKg',
      type: IsarType.double,
    ),
    r'dailyMilkYield': PropertySchema(
      id: 15,
      name: r'dailyMilkYield',
      type: IsarType.double,
    ),
    r'damBreed': PropertySchema(
      id: 16,
      name: r'damBreed',
      type: IsarType.string,
    ),
    r'dataHash': PropertySchema(
      id: 17,
      name: r'dataHash',
      type: IsarType.string,
    ),
    r'dietType': PropertySchema(
      id: 18,
      name: r'dietType',
      type: IsarType.string,
    ),
    r'distinctiveMarks': PropertySchema(
      id: 19,
      name: r'distinctiveMarks',
      type: IsarType.string,
    ),
    r'documentUrls': PropertySchema(
      id: 20,
      name: r'documentUrls',
      type: IsarType.stringList,
    ),
    r'estado': PropertySchema(
      id: 21,
      name: r'estado',
      type: IsarType.string,
      enumMap: _AnimalestadoEnumValueMap,
    ),
    r'estimatedValue': PropertySchema(
      id: 22,
      name: r'estimatedValue',
      type: IsarType.double,
    ),
    r'generation': PropertySchema(
      id: 23,
      name: r'generation',
      type: IsarType.long,
    ),
    r'gestationDays': PropertySchema(
      id: 24,
      name: r'gestationDays',
      type: IsarType.long,
    ),
    r'healthDescription': PropertySchema(
      id: 25,
      name: r'healthDescription',
      type: IsarType.string,
    ),
    r'healthStatus': PropertySchema(
      id: 26,
      name: r'healthStatus',
      type: IsarType.string,
      enumMap: _AnimalhealthStatusEnumValueMap,
    ),
    r'heartRate': PropertySchema(
      id: 27,
      name: r'heartRate',
      type: IsarType.long,
    ),
    r'isPregnant': PropertySchema(
      id: 28,
      name: r'isPregnant',
      type: IsarType.bool,
    ),
    r'lastCalvingDate': PropertySchema(
      id: 29,
      name: r'lastCalvingDate',
      type: IsarType.dateTime,
    ),
    r'lastCheckupDate': PropertySchema(
      id: 30,
      name: r'lastCheckupDate',
      type: IsarType.dateTime,
    ),
    r'lastCheckupVeterinarian': PropertySchema(
      id: 31,
      name: r'lastCheckupVeterinarian',
      type: IsarType.string,
    ),
    r'lastServiceBull': PropertySchema(
      id: 32,
      name: r'lastServiceBull',
      type: IsarType.string,
    ),
    r'lastServiceDate': PropertySchema(
      id: 33,
      name: r'lastServiceDate',
      type: IsarType.dateTime,
    ),
    r'lastUpdatedAt': PropertySchema(
      id: 34,
      name: r'lastUpdatedAt',
      type: IsarType.dateTime,
    ),
    r'lastWeighDate': PropertySchema(
      id: 35,
      name: r'lastWeighDate',
      type: IsarType.dateTime,
    ),
    r'latitude': PropertySchema(
      id: 36,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'localVersion': PropertySchema(
      id: 37,
      name: r'localVersion',
      type: IsarType.long,
    ),
    r'locationDate': PropertySchema(
      id: 38,
      name: r'locationDate',
      type: IsarType.dateTime,
    ),
    r'longitude': PropertySchema(
      id: 39,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'modificationHistory': PropertySchema(
      id: 40,
      name: r'modificationHistory',
      type: IsarType.stringList,
    ),
    r'modifiedBy': PropertySchema(
      id: 41,
      name: r'modifiedBy',
      type: IsarType.string,
    ),
    r'monthlyMaintenanceCost': PropertySchema(
      id: 42,
      name: r'monthlyMaintenanceCost',
      type: IsarType.double,
    ),
    r'name': PropertySchema(id: 43, name: r'name', type: IsarType.string),
    r'nextCalvingDate': PropertySchema(
      id: 44,
      name: r'nextCalvingDate',
      type: IsarType.dateTime,
    ),
    r'nextHeatDate': PropertySchema(
      id: 45,
      name: r'nextHeatDate',
      type: IsarType.dateTime,
    ),
    r'nfcChipId': PropertySchema(
      id: 46,
      name: r'nfcChipId',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(id: 47, name: r'notes', type: IsarType.string),
    r'nutritionalProgram': PropertySchema(
      id: 48,
      name: r'nutritionalProgram',
      type: IsarType.string,
    ),
    r'offspringCount': PropertySchema(
      id: 49,
      name: r'offspringCount',
      type: IsarType.long,
    ),
    r'photoUrl': PropertySchema(
      id: 50,
      name: r'photoUrl',
      type: IsarType.string,
    ),
    r'photoUrls': PropertySchema(
      id: 51,
      name: r'photoUrls',
      type: IsarType.stringList,
    ),
    r'potentialBuyer': PropertySchema(
      id: 52,
      name: r'potentialBuyer',
      type: IsarType.string,
    ),
    r'profilePhotoUrl': PropertySchema(
      id: 53,
      name: r'profilePhotoUrl',
      type: IsarType.string,
    ),
    r'purchaseDate': PropertySchema(
      id: 54,
      name: r'purchaseDate',
      type: IsarType.dateTime,
    ),
    r'purchasePrice': PropertySchema(
      id: 55,
      name: r'purchasePrice',
      type: IsarType.double,
    ),
    r'registrationNumber': PropertySchema(
      id: 56,
      name: r'registrationNumber',
      type: IsarType.string,
    ),
    r'reproductiveStatus': PropertySchema(
      id: 57,
      name: r'reproductiveStatus',
      type: IsarType.string,
      enumMap: _AnimalreproductiveStatusEnumValueMap,
    ),
    r'respiratoryRate': PropertySchema(
      id: 58,
      name: r'respiratoryRate',
      type: IsarType.long,
    ),
    r'rfidTagId': PropertySchema(
      id: 59,
      name: r'rfidTagId',
      type: IsarType.string,
    ),
    r'seller': PropertySchema(id: 60, name: r'seller', type: IsarType.string),
    r'serverId': PropertySchema(
      id: 61,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'sex': PropertySchema(
      id: 62,
      name: r'sex',
      type: IsarType.string,
      enumMap: _AnimalsexEnumValueMap,
    ),
    r'siniigaId': PropertySchema(
      id: 63,
      name: r'siniigaId',
      type: IsarType.object,
      target: r'SinigaId',
    ),
    r'sireBreed': PropertySchema(
      id: 64,
      name: r'sireBreed',
      type: IsarType.string,
    ),
    r'supplements': PropertySchema(
      id: 65,
      name: r'supplements',
      type: IsarType.stringList,
    ),
    r'syncStatus': PropertySchema(
      id: 66,
      name: r'syncStatus',
      type: IsarType.string,
      enumMap: _AnimalsyncStatusEnumValueMap,
    ),
    r'tags': PropertySchema(id: 67, name: r'tags', type: IsarType.stringList),
    r'totalMilkYield': PropertySchema(
      id: 68,
      name: r'totalMilkYield',
      type: IsarType.double,
    ),
    r'totalRevenueGenerated': PropertySchema(
      id: 69,
      name: r'totalRevenueGenerated',
      type: IsarType.double,
    ),
    r'videoUrls': PropertySchema(
      id: 70,
      name: r'videoUrls',
      type: IsarType.stringList,
    ),
    r'visualTagId': PropertySchema(
      id: 71,
      name: r'visualTagId',
      type: IsarType.string,
    ),
  },
  estimateSize: _animalEstimateSize,
  serialize: _animalSerialize,
  deserialize: _animalDeserialize,
  deserializeProp: _animalDeserializeProp,
  idName: r'id',
  indexes: {
    r'rfidTagId': IndexSchema(
      id: 7564995566336399953,
      name: r'rfidTagId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'rfidTagId',
          type: IndexType.hash,
          caseSensitive: false,
        ),
      ],
    ),
    r'nfcChipId': IndexSchema(
      id: -2017615473009466056,
      name: r'nfcChipId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nfcChipId',
          type: IndexType.hash,
          caseSensitive: false,
        ),
      ],
    ),
    r'serverId': IndexSchema(
      id: -7950187970872907662,
      name: r'serverId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'serverId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {
    r'sire': LinkSchema(
      id: -6107347803505687823,
      name: r'sire',
      target: r'Animal',
      single: true,
    ),
    r'dam': LinkSchema(
      id: 3624923435204242570,
      name: r'dam',
      target: r'Animal',
      single: true,
    ),
    r'herd': LinkSchema(
      id: -2593496057963308978,
      name: r'herd',
      target: r'Herd',
      single: true,
    ),
    r'events': LinkSchema(
      id: 5454460270097014566,
      name: r'events',
      target: r'MedicalEventRecord',
      single: false,
      linkName: r'animal',
    ),
    r'productions': LinkSchema(
      id: -2536405647200898138,
      name: r'productions',
      target: r'ProductionRecord',
      single: false,
      linkName: r'animal',
    ),
    r'offspring': LinkSchema(
      id: 3028279186445937318,
      name: r'offspring',
      target: r'Animal',
      single: false,
      linkName: r'dam',
    ),
  },
  embeddedSchemas: {r'SinigaId': SinigaIdSchema},
  getId: _animalGetId,
  getLinks: _animalGetLinks,
  attach: _animalAttach,
  version: '3.1.0+1',
);

int _animalEstimateSize(
  Animal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.barcode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.brandNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.breed.length * 3;
  {
    final value = object.coatColor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.currentLocation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.damBreed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dataHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dietType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.distinctiveMarks;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.documentUrls.length * 3;
  {
    for (var i = 0; i < object.documentUrls.length; i++) {
      final value = object.documentUrls[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.estado.name.length * 3;
  {
    final value = object.healthDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.healthStatus.name.length * 3;
  {
    final value = object.lastCheckupVeterinarian;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastServiceBull;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.modificationHistory.length * 3;
  {
    for (var i = 0; i < object.modificationHistory.length; i++) {
      final value = object.modificationHistory[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.modifiedBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.nfcChipId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nutritionalProgram;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.photoUrls.length * 3;
  {
    for (var i = 0; i < object.photoUrls.length; i++) {
      final value = object.photoUrls[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.potentialBuyer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.profilePhotoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.registrationNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reproductiveStatus;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.rfidTagId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.seller;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sex.name.length * 3;
  {
    final value = object.siniigaId;
    if (value != null) {
      bytesCount +=
          3 +
          SinigaIdSchema.estimateSize(value, allOffsets[SinigaId]!, allOffsets);
    }
  }
  {
    final value = object.sireBreed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.supplements.length * 3;
  {
    for (var i = 0; i < object.supplements.length; i++) {
      final value = object.supplements[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.syncStatus.name.length * 3;
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.videoUrls.length * 3;
  {
    for (var i = 0; i < object.videoUrls.length; i++) {
      final value = object.videoUrls[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.visualTagId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _animalSerialize(
  Animal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageDailyGain);
  writer.writeString(offsets[1], object.barcode);
  writer.writeDateTime(offsets[2], object.birthDate);
  writer.writeDouble(offsets[3], object.birthWeight);
  writer.writeString(offsets[4], object.brandNumber);
  writer.writeString(offsets[5], object.breed);
  writer.writeLong(offsets[6], object.calvingCount);
  writer.writeString(offsets[7], object.coatColor);
  writer.writeDouble(offsets[8], object.consiguity);
  writer.writeDateTime(offsets[9], object.createdAt);
  writer.writeString(offsets[10], object.createdBy);
  writer.writeString(offsets[11], object.currentLocation);
  writer.writeDouble(offsets[12], object.currentTemperature);
  writer.writeDouble(offsets[13], object.currentWeight);
  writer.writeDouble(offsets[14], object.dailyConsumptionKg);
  writer.writeDouble(offsets[15], object.dailyMilkYield);
  writer.writeString(offsets[16], object.damBreed);
  writer.writeString(offsets[17], object.dataHash);
  writer.writeString(offsets[18], object.dietType);
  writer.writeString(offsets[19], object.distinctiveMarks);
  writer.writeStringList(offsets[20], object.documentUrls);
  writer.writeString(offsets[21], object.estado.name);
  writer.writeDouble(offsets[22], object.estimatedValue);
  writer.writeLong(offsets[23], object.generation);
  writer.writeLong(offsets[24], object.gestationDays);
  writer.writeString(offsets[25], object.healthDescription);
  writer.writeString(offsets[26], object.healthStatus.name);
  writer.writeLong(offsets[27], object.heartRate);
  writer.writeBool(offsets[28], object.isPregnant);
  writer.writeDateTime(offsets[29], object.lastCalvingDate);
  writer.writeDateTime(offsets[30], object.lastCheckupDate);
  writer.writeString(offsets[31], object.lastCheckupVeterinarian);
  writer.writeString(offsets[32], object.lastServiceBull);
  writer.writeDateTime(offsets[33], object.lastServiceDate);
  writer.writeDateTime(offsets[34], object.lastUpdatedAt);
  writer.writeDateTime(offsets[35], object.lastWeighDate);
  writer.writeDouble(offsets[36], object.latitude);
  writer.writeLong(offsets[37], object.localVersion);
  writer.writeDateTime(offsets[38], object.locationDate);
  writer.writeDouble(offsets[39], object.longitude);
  writer.writeStringList(offsets[40], object.modificationHistory);
  writer.writeString(offsets[41], object.modifiedBy);
  writer.writeDouble(offsets[42], object.monthlyMaintenanceCost);
  writer.writeString(offsets[43], object.name);
  writer.writeDateTime(offsets[44], object.nextCalvingDate);
  writer.writeDateTime(offsets[45], object.nextHeatDate);
  writer.writeString(offsets[46], object.nfcChipId);
  writer.writeString(offsets[47], object.notes);
  writer.writeString(offsets[48], object.nutritionalProgram);
  writer.writeLong(offsets[49], object.offspringCount);
  writer.writeString(offsets[50], object.photoUrl);
  writer.writeStringList(offsets[51], object.photoUrls);
  writer.writeString(offsets[52], object.potentialBuyer);
  writer.writeString(offsets[53], object.profilePhotoUrl);
  writer.writeDateTime(offsets[54], object.purchaseDate);
  writer.writeDouble(offsets[55], object.purchasePrice);
  writer.writeString(offsets[56], object.registrationNumber);
  writer.writeString(offsets[57], object.reproductiveStatus?.name);
  writer.writeLong(offsets[58], object.respiratoryRate);
  writer.writeString(offsets[59], object.rfidTagId);
  writer.writeString(offsets[60], object.seller);
  writer.writeString(offsets[61], object.serverId);
  writer.writeString(offsets[62], object.sex.name);
  writer.writeObject<SinigaId>(
    offsets[63],
    allOffsets,
    SinigaIdSchema.serialize,
    object.siniigaId,
  );
  writer.writeString(offsets[64], object.sireBreed);
  writer.writeStringList(offsets[65], object.supplements);
  writer.writeString(offsets[66], object.syncStatus.name);
  writer.writeStringList(offsets[67], object.tags);
  writer.writeDouble(offsets[68], object.totalMilkYield);
  writer.writeDouble(offsets[69], object.totalRevenueGenerated);
  writer.writeStringList(offsets[70], object.videoUrls);
  writer.writeString(offsets[71], object.visualTagId);
}

Animal _animalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Animal();
  object.averageDailyGain = reader.readDoubleOrNull(offsets[0]);
  object.barcode = reader.readStringOrNull(offsets[1]);
  object.birthDate = reader.readDateTime(offsets[2]);
  object.birthWeight = reader.readDoubleOrNull(offsets[3]);
  object.brandNumber = reader.readStringOrNull(offsets[4]);
  object.breed = reader.readString(offsets[5]);
  object.calvingCount = reader.readLong(offsets[6]);
  object.coatColor = reader.readStringOrNull(offsets[7]);
  object.consiguity = reader.readDoubleOrNull(offsets[8]);
  object.createdAt = reader.readDateTime(offsets[9]);
  object.createdBy = reader.readStringOrNull(offsets[10]);
  object.currentLocation = reader.readStringOrNull(offsets[11]);
  object.currentTemperature = reader.readDoubleOrNull(offsets[12]);
  object.currentWeight = reader.readDoubleOrNull(offsets[13]);
  object.dailyConsumptionKg = reader.readDoubleOrNull(offsets[14]);
  object.dailyMilkYield = reader.readDoubleOrNull(offsets[15]);
  object.damBreed = reader.readStringOrNull(offsets[16]);
  object.dataHash = reader.readStringOrNull(offsets[17]);
  object.dietType = reader.readStringOrNull(offsets[18]);
  object.distinctiveMarks = reader.readStringOrNull(offsets[19]);
  object.documentUrls = reader.readStringList(offsets[20]) ?? [];
  object.estado =
      _AnimalestadoValueEnumMap[reader.readStringOrNull(offsets[21])] ??
      EstadoAnimal.activo;
  object.estimatedValue = reader.readDoubleOrNull(offsets[22]);
  object.generation = reader.readLongOrNull(offsets[23]);
  object.gestationDays = reader.readLongOrNull(offsets[24]);
  object.healthDescription = reader.readStringOrNull(offsets[25]);
  object.healthStatus =
      _AnimalhealthStatusValueEnumMap[reader.readStringOrNull(offsets[26])] ??
      EstadoSalud.sano;
  object.heartRate = reader.readLongOrNull(offsets[27]);
  object.id = id;
  object.isPregnant = reader.readBool(offsets[28]);
  object.lastCalvingDate = reader.readDateTimeOrNull(offsets[29]);
  object.lastCheckupDate = reader.readDateTimeOrNull(offsets[30]);
  object.lastCheckupVeterinarian = reader.readStringOrNull(offsets[31]);
  object.lastServiceBull = reader.readStringOrNull(offsets[32]);
  object.lastServiceDate = reader.readDateTimeOrNull(offsets[33]);
  object.lastUpdatedAt = reader.readDateTimeOrNull(offsets[34]);
  object.lastWeighDate = reader.readDateTimeOrNull(offsets[35]);
  object.latitude = reader.readDoubleOrNull(offsets[36]);
  object.localVersion = reader.readLong(offsets[37]);
  object.locationDate = reader.readDateTimeOrNull(offsets[38]);
  object.longitude = reader.readDoubleOrNull(offsets[39]);
  object.modificationHistory = reader.readStringList(offsets[40]) ?? [];
  object.modifiedBy = reader.readStringOrNull(offsets[41]);
  object.monthlyMaintenanceCost = reader.readDoubleOrNull(offsets[42]);
  object.name = reader.readString(offsets[43]);
  object.nextCalvingDate = reader.readDateTimeOrNull(offsets[44]);
  object.nextHeatDate = reader.readDateTimeOrNull(offsets[45]);
  object.nfcChipId = reader.readStringOrNull(offsets[46]);
  object.notes = reader.readStringOrNull(offsets[47]);
  object.nutritionalProgram = reader.readStringOrNull(offsets[48]);
  object.offspringCount = reader.readLong(offsets[49]);
  object.photoUrl = reader.readStringOrNull(offsets[50]);
  object.photoUrls = reader.readStringList(offsets[51]) ?? [];
  object.potentialBuyer = reader.readStringOrNull(offsets[52]);
  object.profilePhotoUrl = reader.readStringOrNull(offsets[53]);
  object.purchaseDate = reader.readDateTimeOrNull(offsets[54]);
  object.purchasePrice = reader.readDoubleOrNull(offsets[55]);
  object.registrationNumber = reader.readStringOrNull(offsets[56]);
  object.reproductiveStatus =
      _AnimalreproductiveStatusValueEnumMap[reader.readStringOrNull(
        offsets[57],
      )];
  object.respiratoryRate = reader.readLongOrNull(offsets[58]);
  object.rfidTagId = reader.readStringOrNull(offsets[59]);
  object.seller = reader.readStringOrNull(offsets[60]);
  object.serverId = reader.readStringOrNull(offsets[61]);
  object.sex =
      _AnimalsexValueEnumMap[reader.readStringOrNull(offsets[62])] ??
      Sexo.macho;
  object.siniigaId = reader.readObjectOrNull<SinigaId>(
    offsets[63],
    SinigaIdSchema.deserialize,
    allOffsets,
  );
  object.sireBreed = reader.readStringOrNull(offsets[64]);
  object.supplements = reader.readStringList(offsets[65]) ?? [];
  object.syncStatus =
      _AnimalsyncStatusValueEnumMap[reader.readStringOrNull(offsets[66])] ??
      EstadoSync.pendiente;
  object.tags = reader.readStringList(offsets[67]) ?? [];
  object.totalMilkYield = reader.readDoubleOrNull(offsets[68]);
  object.totalRevenueGenerated = reader.readDoubleOrNull(offsets[69]);
  object.videoUrls = reader.readStringList(offsets[70]) ?? [];
  object.visualTagId = reader.readStringOrNull(offsets[71]);
  return object;
}

P _animalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringList(offset) ?? []) as P;
    case 21:
      return (_AnimalestadoValueEnumMap[reader.readStringOrNull(offset)] ??
              EstadoAnimal.activo)
          as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (_AnimalhealthStatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              EstadoSalud.sano)
          as P;
    case 27:
      return (reader.readLongOrNull(offset)) as P;
    case 28:
      return (reader.readBool(offset)) as P;
    case 29:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 30:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 34:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 35:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 36:
      return (reader.readDoubleOrNull(offset)) as P;
    case 37:
      return (reader.readLong(offset)) as P;
    case 38:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 39:
      return (reader.readDoubleOrNull(offset)) as P;
    case 40:
      return (reader.readStringList(offset) ?? []) as P;
    case 41:
      return (reader.readStringOrNull(offset)) as P;
    case 42:
      return (reader.readDoubleOrNull(offset)) as P;
    case 43:
      return (reader.readString(offset)) as P;
    case 44:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 45:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 46:
      return (reader.readStringOrNull(offset)) as P;
    case 47:
      return (reader.readStringOrNull(offset)) as P;
    case 48:
      return (reader.readStringOrNull(offset)) as P;
    case 49:
      return (reader.readLong(offset)) as P;
    case 50:
      return (reader.readStringOrNull(offset)) as P;
    case 51:
      return (reader.readStringList(offset) ?? []) as P;
    case 52:
      return (reader.readStringOrNull(offset)) as P;
    case 53:
      return (reader.readStringOrNull(offset)) as P;
    case 54:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 55:
      return (reader.readDoubleOrNull(offset)) as P;
    case 56:
      return (reader.readStringOrNull(offset)) as P;
    case 57:
      return (_AnimalreproductiveStatusValueEnumMap[reader.readStringOrNull(
            offset,
          )])
          as P;
    case 58:
      return (reader.readLongOrNull(offset)) as P;
    case 59:
      return (reader.readStringOrNull(offset)) as P;
    case 60:
      return (reader.readStringOrNull(offset)) as P;
    case 61:
      return (reader.readStringOrNull(offset)) as P;
    case 62:
      return (_AnimalsexValueEnumMap[reader.readStringOrNull(offset)] ??
              Sexo.macho)
          as P;
    case 63:
      return (reader.readObjectOrNull<SinigaId>(
            offset,
            SinigaIdSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 64:
      return (reader.readStringOrNull(offset)) as P;
    case 65:
      return (reader.readStringList(offset) ?? []) as P;
    case 66:
      return (_AnimalsyncStatusValueEnumMap[reader.readStringOrNull(offset)] ??
              EstadoSync.pendiente)
          as P;
    case 67:
      return (reader.readStringList(offset) ?? []) as P;
    case 68:
      return (reader.readDoubleOrNull(offset)) as P;
    case 69:
      return (reader.readDoubleOrNull(offset)) as P;
    case 70:
      return (reader.readStringList(offset) ?? []) as P;
    case 71:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AnimalestadoEnumValueMap = {
  r'activo': r'activo',
  r'vendido': r'vendido',
  r'muerto': r'muerto',
  r'perdido': r'perdido',
  r'enfermo': r'enfermo',
  r'cuarentena': r'cuarentena',
  r'prestado': r'prestado',
  r'enTransito': r'enTransito',
};
const _AnimalestadoValueEnumMap = {
  r'activo': EstadoAnimal.activo,
  r'vendido': EstadoAnimal.vendido,
  r'muerto': EstadoAnimal.muerto,
  r'perdido': EstadoAnimal.perdido,
  r'enfermo': EstadoAnimal.enfermo,
  r'cuarentena': EstadoAnimal.cuarentena,
  r'prestado': EstadoAnimal.prestado,
  r'enTransito': EstadoAnimal.enTransito,
};
const _AnimalhealthStatusEnumValueMap = {
  r'sano': r'sano',
  r'enfermo': r'enfermo',
  r'convaleciente': r'convaleciente',
  r'critico': r'critico',
  r'enTratamiento': r'enTratamiento',
  r'enObservacion': r'enObservacion',
};
const _AnimalhealthStatusValueEnumMap = {
  r'sano': EstadoSalud.sano,
  r'enfermo': EstadoSalud.enfermo,
  r'convaleciente': EstadoSalud.convaleciente,
  r'critico': EstadoSalud.critico,
  r'enTratamiento': EstadoSalud.enTratamiento,
  r'enObservacion': EstadoSalud.enObservacion,
};
const _AnimalreproductiveStatusEnumValueMap = {
  r'virgen': r'virgen',
  r'servida': r'servida',
  r'isPregnant': r'isPregnant',
  r'lactante': r'lactante',
  r'seca': r'seca',
  r'descarte': r'descarte',
  r'reproductorActivo': r'reproductorActivo',
  r'reproductorInactivo': r'reproductorInactivo',
};
const _AnimalreproductiveStatusValueEnumMap = {
  r'virgen': EstadoReproductivo.virgen,
  r'servida': EstadoReproductivo.servida,
  r'isPregnant': EstadoReproductivo.isPregnant,
  r'lactante': EstadoReproductivo.lactante,
  r'seca': EstadoReproductivo.seca,
  r'descarte': EstadoReproductivo.descarte,
  r'reproductorActivo': EstadoReproductivo.reproductorActivo,
  r'reproductorInactivo': EstadoReproductivo.reproductorInactivo,
};
const _AnimalsexEnumValueMap = {
  r'macho': r'macho',
  r'hembra': r'hembra',
  r'castrado': r'castrado',
};
const _AnimalsexValueEnumMap = {
  r'macho': Sexo.macho,
  r'hembra': Sexo.hembra,
  r'castrado': Sexo.castrado,
};
const _AnimalsyncStatusEnumValueMap = {
  r'pendiente': r'pendiente',
  r'enProceso': r'enProceso',
  r'completado': r'completado',
  r'error': r'error',
  r'conflicto': r'conflicto',
  r'cancelado': r'cancelado',
};
const _AnimalsyncStatusValueEnumMap = {
  r'pendiente': EstadoSync.pendiente,
  r'enProceso': EstadoSync.enProceso,
  r'completado': EstadoSync.completado,
  r'error': EstadoSync.error,
  r'conflicto': EstadoSync.conflicto,
  r'cancelado': EstadoSync.cancelado,
};

Id _animalGetId(Animal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _animalGetLinks(Animal object) {
  return [
    object.sire,
    object.dam,
    object.herd,
    object.events,
    object.productions,
    object.offspring,
  ];
}

void _animalAttach(IsarCollection<dynamic> col, Id id, Animal object) {
  object.id = id;
  object.sire.attach(col, col.isar.collection<Animal>(), r'sire', id);
  object.dam.attach(col, col.isar.collection<Animal>(), r'dam', id);
  object.herd.attach(col, col.isar.collection<Herd>(), r'herd', id);
  object.events.attach(
    col,
    col.isar.collection<MedicalEventRecord>(),
    r'events',
    id,
  );
  object.productions.attach(
    col,
    col.isar.collection<ProductionRecord>(),
    r'productions',
    id,
  );
  object.offspring.attach(col, col.isar.collection<Animal>(), r'offspring', id);
}

extension AnimalByIndex on IsarCollection<Animal> {
  Future<Animal?> getByRfidTagId(String? rfidTagId) {
    return getByIndex(r'rfidTagId', [rfidTagId]);
  }

  Animal? getByRfidTagIdSync(String? rfidTagId) {
    return getByIndexSync(r'rfidTagId', [rfidTagId]);
  }

  Future<bool> deleteByRfidTagId(String? rfidTagId) {
    return deleteByIndex(r'rfidTagId', [rfidTagId]);
  }

  bool deleteByRfidTagIdSync(String? rfidTagId) {
    return deleteByIndexSync(r'rfidTagId', [rfidTagId]);
  }

  Future<List<Animal?>> getAllByRfidTagId(List<String?> rfidTagIdValues) {
    final values = rfidTagIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'rfidTagId', values);
  }

  List<Animal?> getAllByRfidTagIdSync(List<String?> rfidTagIdValues) {
    final values = rfidTagIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'rfidTagId', values);
  }

  Future<int> deleteAllByRfidTagId(List<String?> rfidTagIdValues) {
    final values = rfidTagIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'rfidTagId', values);
  }

  int deleteAllByRfidTagIdSync(List<String?> rfidTagIdValues) {
    final values = rfidTagIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'rfidTagId', values);
  }

  Future<Id> putByRfidTagId(Animal object) {
    return putByIndex(r'rfidTagId', object);
  }

  Id putByRfidTagIdSync(Animal object, {bool saveLinks = true}) {
    return putByIndexSync(r'rfidTagId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRfidTagId(List<Animal> objects) {
    return putAllByIndex(r'rfidTagId', objects);
  }

  List<Id> putAllByRfidTagIdSync(
    List<Animal> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'rfidTagId', objects, saveLinks: saveLinks);
  }

  Future<Animal?> getByNfcChipId(String? nfcChipId) {
    return getByIndex(r'nfcChipId', [nfcChipId]);
  }

  Animal? getByNfcChipIdSync(String? nfcChipId) {
    return getByIndexSync(r'nfcChipId', [nfcChipId]);
  }

  Future<bool> deleteByNfcChipId(String? nfcChipId) {
    return deleteByIndex(r'nfcChipId', [nfcChipId]);
  }

  bool deleteByNfcChipIdSync(String? nfcChipId) {
    return deleteByIndexSync(r'nfcChipId', [nfcChipId]);
  }

  Future<List<Animal?>> getAllByNfcChipId(List<String?> nfcChipIdValues) {
    final values = nfcChipIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'nfcChipId', values);
  }

  List<Animal?> getAllByNfcChipIdSync(List<String?> nfcChipIdValues) {
    final values = nfcChipIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'nfcChipId', values);
  }

  Future<int> deleteAllByNfcChipId(List<String?> nfcChipIdValues) {
    final values = nfcChipIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'nfcChipId', values);
  }

  int deleteAllByNfcChipIdSync(List<String?> nfcChipIdValues) {
    final values = nfcChipIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'nfcChipId', values);
  }

  Future<Id> putByNfcChipId(Animal object) {
    return putByIndex(r'nfcChipId', object);
  }

  Id putByNfcChipIdSync(Animal object, {bool saveLinks = true}) {
    return putByIndexSync(r'nfcChipId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNfcChipId(List<Animal> objects) {
    return putAllByIndex(r'nfcChipId', objects);
  }

  List<Id> putAllByNfcChipIdSync(
    List<Animal> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'nfcChipId', objects, saveLinks: saveLinks);
  }
}

extension AnimalQueryWhereSort on QueryBuilder<Animal, Animal, QWhere> {
  QueryBuilder<Animal, Animal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimalQueryWhere on QueryBuilder<Animal, Animal, QWhereClause> {
  QueryBuilder<Animal, Animal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> rfidTagIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'rfidTagId', value: [null]),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> rfidTagIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'rfidTagId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> rfidTagIdEqualTo(
    String? rfidTagId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'rfidTagId', value: [rfidTagId]),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> rfidTagIdNotEqualTo(
    String? rfidTagId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'rfidTagId',
                lower: [],
                upper: [rfidTagId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'rfidTagId',
                lower: [rfidTagId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'rfidTagId',
                lower: [rfidTagId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'rfidTagId',
                lower: [],
                upper: [rfidTagId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> nfcChipIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'nfcChipId', value: [null]),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> nfcChipIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nfcChipId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> nfcChipIdEqualTo(
    String? nfcChipId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'nfcChipId', value: [nfcChipId]),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> nfcChipIdNotEqualTo(
    String? nfcChipId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nfcChipId',
                lower: [],
                upper: [nfcChipId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nfcChipId',
                lower: [nfcChipId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nfcChipId',
                lower: [nfcChipId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nfcChipId',
                lower: [],
                upper: [nfcChipId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'serverId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> serverIdEqualTo(
    String? serverId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> serverIdNotEqualTo(
    String? serverId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [],
                upper: [serverId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [serverId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [serverId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'serverId',
                lower: [],
                upper: [serverId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension AnimalQueryFilter on QueryBuilder<Animal, Animal, QFilterCondition> {
  QueryBuilder<Animal, Animal, QAfterFilterCondition> averageDailyGainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'averageDailyGain'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  averageDailyGainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'averageDailyGain'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> averageDailyGainEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'averageDailyGain',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  averageDailyGainGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'averageDailyGain',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> averageDailyGainLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'averageDailyGain',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> averageDailyGainBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'averageDailyGain',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'barcode'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'barcode'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'barcode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'barcode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'barcode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'barcode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'barcode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'barcode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'barcode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'barcode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'barcode', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> barcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'barcode', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthDateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'birthDate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'birthDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'birthDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'birthDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'birthWeight'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'birthWeight'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'birthWeight',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'birthWeight',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'birthWeight',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> birthWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'birthWeight',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'brandNumber'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'brandNumber'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'brandNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'brandNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'brandNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'brandNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'brandNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'brandNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'brandNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'brandNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandNumber', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> brandNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'brandNumber', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'breed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'breed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'breed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'breed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'breed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'breed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'breed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'breed',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'breed', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> breedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'breed', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> calvingCountEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'calvingCount', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> calvingCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'calvingCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> calvingCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'calvingCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> calvingCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'calvingCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'coatColor'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'coatColor'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'coatColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'coatColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'coatColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'coatColor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'coatColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'coatColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'coatColor',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'coatColor',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'coatColor', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> coatColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'coatColor', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consiguityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'consiguity'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consiguityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'consiguity'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consiguityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'consiguity',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consiguityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'consiguity',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consiguityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'consiguity',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consiguityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'consiguity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdBy'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdBy'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdBy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'createdBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'createdBy',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdBy', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'createdBy', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentLocationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentLocation'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  currentLocationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentLocation'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentLocationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currentLocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  currentLocationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentLocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentLocationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentLocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentLocationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentLocation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentLocationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'currentLocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentLocationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'currentLocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentLocationContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'currentLocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentLocationMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'currentLocation',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentLocationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentLocation', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  currentLocationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'currentLocation', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  currentTemperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentTemperature'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  currentTemperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentTemperature'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentTemperatureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currentTemperature',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  currentTemperatureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentTemperature',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  currentTemperatureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentTemperature',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentTemperatureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentTemperature',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentWeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentWeight'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentWeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentWeight'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentWeightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currentWeight',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentWeightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentWeight',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentWeightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentWeight',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> currentWeightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentWeight',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  dailyConsumptionKgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dailyConsumptionKg'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  dailyConsumptionKgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dailyConsumptionKg'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dailyConsumptionKgEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dailyConsumptionKg',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  dailyConsumptionKgGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dailyConsumptionKg',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  dailyConsumptionKgLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dailyConsumptionKg',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dailyConsumptionKgBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dailyConsumptionKg',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dailyMilkYieldIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dailyMilkYield'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  dailyMilkYieldIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dailyMilkYield'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dailyMilkYieldEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dailyMilkYield',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dailyMilkYieldGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dailyMilkYield',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dailyMilkYieldLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dailyMilkYield',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dailyMilkYieldBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dailyMilkYield',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'damBreed'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'damBreed'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'damBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'damBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'damBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'damBreed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'damBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'damBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'damBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'damBreed',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'damBreed', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damBreedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'damBreed', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dataHash'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dataHash'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dataHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dataHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dataHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dataHash',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dataHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dataHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dataHash',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dataHash',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dataHash', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dataHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dataHash', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dietType'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dietType'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dietType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dietType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dietType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dietType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'dietType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'dietType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'dietType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'dietType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dietType', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dietTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'dietType', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> distinctiveMarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'distinctiveMarks'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  distinctiveMarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'distinctiveMarks'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> distinctiveMarksEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'distinctiveMarks',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  distinctiveMarksGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'distinctiveMarks',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> distinctiveMarksLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'distinctiveMarks',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> distinctiveMarksBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'distinctiveMarks',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  distinctiveMarksStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'distinctiveMarks',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> distinctiveMarksEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'distinctiveMarks',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> distinctiveMarksContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'distinctiveMarks',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> distinctiveMarksMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'distinctiveMarks',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  distinctiveMarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'distinctiveMarks', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  distinctiveMarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'distinctiveMarks', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'documentUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'documentUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'documentUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'documentUrls',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'documentUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'documentUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'documentUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'documentUrls',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'documentUrls', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'documentUrls', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> documentUrlsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'documentUrls', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> documentUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'documentUrls', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> documentUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'documentUrls', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'documentUrls', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  documentUrlsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'documentUrls', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> documentUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoEqualTo(
    EstadoAnimal value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'estado',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoGreaterThan(
    EstadoAnimal value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'estado',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoLessThan(
    EstadoAnimal value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'estado',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoBetween(
    EstadoAnimal lower,
    EstadoAnimal upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'estado',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'estado',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'estado',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'estado',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'estado',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'estado', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'estado', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estimatedValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'estimatedValue'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  estimatedValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'estimatedValue'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estimatedValueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'estimatedValue',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estimatedValueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'estimatedValue',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estimatedValueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'estimatedValue',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estimatedValueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'estimatedValue',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'generation'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'generation'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'generation', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'generation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'generation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'generation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> gestationDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'gestationDays'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> gestationDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'gestationDays'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> gestationDaysEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'gestationDays', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> gestationDaysGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'gestationDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> gestationDaysLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'gestationDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> gestationDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'gestationDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  healthDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'healthDescription'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  healthDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'healthDescription'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'healthDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  healthDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'healthDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'healthDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'healthDescription',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  healthDescriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'healthDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'healthDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthDescriptionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'healthDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthDescriptionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'healthDescription',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  healthDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'healthDescription', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  healthDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'healthDescription', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusEqualTo(
    EstadoSalud value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'healthStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusGreaterThan(
    EstadoSalud value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'healthStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusLessThan(
    EstadoSalud value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'healthStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusBetween(
    EstadoSalud lower,
    EstadoSalud upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'healthStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'healthStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'healthStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'healthStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'healthStatus',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'healthStatus', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> healthStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'healthStatus', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> heartRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'heartRate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> heartRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'heartRate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> heartRateEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'heartRate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> heartRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'heartRate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> heartRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'heartRate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> heartRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'heartRate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> isPregnantEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isPregnant', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastCalvingDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastCalvingDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCalvingDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastCalvingDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastCalvingDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastCalvingDate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCalvingDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastCalvingDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastCalvingDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastCalvingDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastCalvingDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastCalvingDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastCheckupDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastCheckupDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastCheckupDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastCheckupDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastCheckupDate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastCheckupDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastCheckupDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastCheckupDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastCheckupDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastCheckupDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastCheckupVeterinarian'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastCheckupVeterinarian'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastCheckupVeterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastCheckupVeterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastCheckupVeterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastCheckupVeterinarian',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastCheckupVeterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastCheckupVeterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastCheckupVeterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastCheckupVeterinarian',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastCheckupVeterinarian',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastCheckupVeterinarianIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'lastCheckupVeterinarian',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceBullIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastServiceBull'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastServiceBullIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastServiceBull'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceBullEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastServiceBull',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastServiceBullGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastServiceBull',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceBullLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastServiceBull',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceBullBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastServiceBull',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceBullStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastServiceBull',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceBullEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastServiceBull',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceBullContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastServiceBull',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceBullMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastServiceBull',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceBullIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastServiceBull', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastServiceBullIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastServiceBull', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastServiceDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastServiceDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastServiceDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastServiceDate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  lastServiceDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastServiceDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastServiceDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastServiceDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastServiceDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastUpdatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastUpdatedAt'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastUpdatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastUpdatedAt'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastUpdatedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdatedAt', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastUpdatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastUpdatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastUpdatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastWeighDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastWeighDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastWeighDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastWeighDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastWeighDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastWeighDate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastWeighDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastWeighDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastWeighDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastWeighDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lastWeighDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastWeighDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'latitude'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'latitude'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'latitude',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'latitude',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'latitude',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'latitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> localVersionEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'localVersion', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> localVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'localVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> localVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'localVersion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> localVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'localVersion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> locationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'locationDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> locationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'locationDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> locationDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'locationDate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> locationDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'locationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> locationDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'locationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> locationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'locationDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'longitude'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'longitude'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'longitude',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'longitude',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'longitude',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'longitude',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'modificationHistory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'modificationHistory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'modificationHistory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'modificationHistory',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'modificationHistory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'modificationHistory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'modificationHistory',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'modificationHistory',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modificationHistory', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'modificationHistory',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'modificationHistory',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'modificationHistory', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'modificationHistory', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'modificationHistory', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'modificationHistory',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  modificationHistoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'modificationHistory',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'modifiedBy'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'modifiedBy'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'modifiedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'modifiedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'modifiedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'modifiedBy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'modifiedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'modifiedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'modifiedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'modifiedBy',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modifiedBy', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> modifiedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'modifiedBy', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  monthlyMaintenanceCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'monthlyMaintenanceCost'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  monthlyMaintenanceCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'monthlyMaintenanceCost'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  monthlyMaintenanceCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'monthlyMaintenanceCost',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  monthlyMaintenanceCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'monthlyMaintenanceCost',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  monthlyMaintenanceCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'monthlyMaintenanceCost',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  monthlyMaintenanceCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'monthlyMaintenanceCost',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextCalvingDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nextCalvingDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nextCalvingDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nextCalvingDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextCalvingDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nextCalvingDate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nextCalvingDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nextCalvingDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextCalvingDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nextCalvingDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextCalvingDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nextCalvingDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextHeatDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nextHeatDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextHeatDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nextHeatDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextHeatDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nextHeatDate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextHeatDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nextHeatDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextHeatDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nextHeatDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nextHeatDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nextHeatDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nfcChipId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nfcChipId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nfcChipId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nfcChipId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nfcChipId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nfcChipId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nfcChipId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nfcChipId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nfcChipId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nfcChipId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nfcChipId', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nfcChipId', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'notes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nutritionalProgramIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nutritionalProgram'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nutritionalProgramIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nutritionalProgram'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nutritionalProgramEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nutritionalProgram',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nutritionalProgramGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nutritionalProgram',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nutritionalProgramLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nutritionalProgram',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nutritionalProgramBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nutritionalProgram',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nutritionalProgramStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nutritionalProgram',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nutritionalProgramEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nutritionalProgram',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nutritionalProgramContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nutritionalProgram',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nutritionalProgramMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nutritionalProgram',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nutritionalProgramIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nutritionalProgram', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  nutritionalProgramIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nutritionalProgram', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspringCountEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'offspringCount', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspringCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'offspringCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspringCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'offspringCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspringCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'offspringCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoUrl'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoUrl'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'photoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photoUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'photoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'photoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'photoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'photoUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoUrl', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoUrl', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'photoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  photoUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photoUrls',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  photoUrlsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'photoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'photoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'photoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'photoUrls',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  photoUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoUrls', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  photoUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoUrls', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoUrls', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoUrls', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoUrls', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoUrls', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  photoUrlsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'photoUrls', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photoUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'potentialBuyer'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  potentialBuyerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'potentialBuyer'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'potentialBuyer',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'potentialBuyer',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'potentialBuyer',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'potentialBuyer',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'potentialBuyer',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'potentialBuyer',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'potentialBuyer',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'potentialBuyer',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> potentialBuyerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'potentialBuyer', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  potentialBuyerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'potentialBuyer', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> profilePhotoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'profilePhotoUrl'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  profilePhotoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'profilePhotoUrl'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> profilePhotoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'profilePhotoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  profilePhotoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'profilePhotoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> profilePhotoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'profilePhotoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> profilePhotoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'profilePhotoUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> profilePhotoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'profilePhotoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> profilePhotoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'profilePhotoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> profilePhotoUrlContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'profilePhotoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> profilePhotoUrlMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'profilePhotoUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> profilePhotoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'profilePhotoUrl', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  profilePhotoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'profilePhotoUrl', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchaseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'purchaseDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchaseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'purchaseDate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchaseDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'purchaseDate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchaseDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'purchaseDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchaseDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'purchaseDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchaseDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'purchaseDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchasePriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'purchasePrice'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchasePriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'purchasePrice'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchasePriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'purchasePrice',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchasePriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'purchasePrice',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchasePriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'purchasePrice',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> purchasePriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'purchasePrice',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  registrationNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'registrationNumber'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  registrationNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'registrationNumber'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> registrationNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'registrationNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  registrationNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'registrationNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  registrationNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'registrationNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> registrationNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'registrationNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  registrationNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'registrationNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  registrationNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'registrationNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  registrationNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'registrationNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> registrationNumberMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'registrationNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  registrationNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'registrationNumber', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  registrationNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'registrationNumber', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  reproductiveStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'reproductiveStatus'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  reproductiveStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'reproductiveStatus'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> reproductiveStatusEqualTo(
    EstadoReproductivo? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reproductiveStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  reproductiveStatusGreaterThan(
    EstadoReproductivo? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reproductiveStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  reproductiveStatusLessThan(
    EstadoReproductivo? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reproductiveStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> reproductiveStatusBetween(
    EstadoReproductivo? lower,
    EstadoReproductivo? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reproductiveStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  reproductiveStatusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reproductiveStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  reproductiveStatusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reproductiveStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  reproductiveStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reproductiveStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> reproductiveStatusMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reproductiveStatus',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  reproductiveStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reproductiveStatus', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  reproductiveStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reproductiveStatus', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> respiratoryRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'respiratoryRate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  respiratoryRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'respiratoryRate'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> respiratoryRateEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'respiratoryRate', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  respiratoryRateGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'respiratoryRate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> respiratoryRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'respiratoryRate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> respiratoryRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'respiratoryRate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rfidTagId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rfidTagId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rfidTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rfidTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rfidTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rfidTagId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'rfidTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'rfidTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'rfidTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'rfidTagId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rfidTagId', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> rfidTagIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rfidTagId', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'seller'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'seller'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'seller',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'seller',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'seller',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'seller',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'seller',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'seller',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'seller',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'seller',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'seller', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sellerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'seller', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'serverId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'serverId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'serverId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexEqualTo(
    Sexo value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexGreaterThan(
    Sexo value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexLessThan(
    Sexo value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexBetween(
    Sexo lower,
    Sexo upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sex',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sex', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sex', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> siniigaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'siniigaId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> siniigaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'siniigaId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sireBreed'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sireBreed'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sireBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sireBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sireBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sireBreed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sireBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sireBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sireBreed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sireBreed',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sireBreed', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireBreedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sireBreed', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> supplementsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'supplements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  supplementsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'supplements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  supplementsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'supplements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> supplementsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'supplements',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  supplementsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'supplements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  supplementsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'supplements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  supplementsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'supplements',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> supplementsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'supplements',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  supplementsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'supplements', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  supplementsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'supplements', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> supplementsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supplements', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> supplementsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supplements', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> supplementsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supplements', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> supplementsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supplements', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  supplementsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'supplements', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> supplementsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'supplements',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusEqualTo(
    EstadoSync value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusGreaterThan(
    EstadoSync value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusLessThan(
    EstadoSync value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusBetween(
    EstadoSync lower,
    EstadoSync upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'syncStatus',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncStatus', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncStatus', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tags',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tags',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'tags', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> totalMilkYieldIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'totalMilkYield'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  totalMilkYieldIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'totalMilkYield'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> totalMilkYieldEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalMilkYield',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> totalMilkYieldGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalMilkYield',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> totalMilkYieldLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalMilkYield',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> totalMilkYieldBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalMilkYield',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  totalRevenueGeneratedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'totalRevenueGenerated'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  totalRevenueGeneratedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'totalRevenueGenerated'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  totalRevenueGeneratedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalRevenueGenerated',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  totalRevenueGeneratedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalRevenueGenerated',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  totalRevenueGeneratedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalRevenueGenerated',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  totalRevenueGeneratedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalRevenueGenerated',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'videoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  videoUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'videoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'videoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'videoUrls',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  videoUrlsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'videoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'videoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'videoUrls',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'videoUrls',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  videoUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'videoUrls', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  videoUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'videoUrls', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'videoUrls', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'videoUrls', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'videoUrls', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'videoUrls', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  videoUrlsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'videoUrls', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videoUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videoUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'visualTagId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'visualTagId'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'visualTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'visualTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'visualTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'visualTagId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'visualTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'visualTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'visualTagId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'visualTagId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'visualTagId', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> visualTagIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'visualTagId', value: ''),
      );
    });
  }
}

extension AnimalQueryObject on QueryBuilder<Animal, Animal, QFilterCondition> {
  QueryBuilder<Animal, Animal, QAfterFilterCondition> siniigaId(
    FilterQuery<SinigaId> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'siniigaId');
    });
  }
}

extension AnimalQueryLinks on QueryBuilder<Animal, Animal, QFilterCondition> {
  QueryBuilder<Animal, Animal, QAfterFilterCondition> sire(
    FilterQuery<Animal> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'sire');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sireIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sire', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> dam(
    FilterQuery<Animal> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'dam');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> damIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'dam', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> herd(
    FilterQuery<Herd> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'herd');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> herdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'herd', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> events(
    FilterQuery<MedicalEventRecord> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'events');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'events',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> productions(
    FilterQuery<ProductionRecord> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'productions');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> productionsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productions', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> productionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productions', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> productionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productions', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> productionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productions', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  productionsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productions', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> productionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'productions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspring(
    FilterQuery<Animal> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'offspring');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspringLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'offspring', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'offspring', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'offspring', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspringLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'offspring', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  offspringLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'offspring', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> offspringLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'offspring',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension AnimalQuerySortBy on QueryBuilder<Animal, Animal, QSortBy> {
  QueryBuilder<Animal, Animal, QAfterSortBy> sortByAverageDailyGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageDailyGain', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByAverageDailyGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageDailyGain', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBirthWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthWeight', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBirthWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthWeight', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBrandNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandNumber', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBrandNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandNumber', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBreed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breed', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByBreedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breed', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCalvingCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calvingCount', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCalvingCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calvingCount', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCoatColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coatColor', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCoatColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coatColor', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByConsiguity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consiguity', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByConsiguityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consiguity', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCurrentLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLocation', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCurrentLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLocation', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCurrentTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTemperature', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCurrentTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTemperature', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCurrentWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWeight', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCurrentWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWeight', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDailyConsumptionKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyConsumptionKg', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDailyConsumptionKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyConsumptionKg', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDailyMilkYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyMilkYield', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDailyMilkYieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyMilkYield', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDamBreed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'damBreed', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDamBreedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'damBreed', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDataHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHash', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDataHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHash', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDietType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dietType', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDietTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dietType', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDistinctiveMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distinctiveMarks', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDistinctiveMarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distinctiveMarks', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstimatedValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedValue', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstimatedValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedValue', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGestationDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gestationDays', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGestationDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gestationDays', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHealthDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthDescription', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHealthDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthDescription', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHealthStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthStatus', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHealthStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthStatus', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heartRate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heartRate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByIsPregnant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPregnant', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByIsPregnantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPregnant', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastCalvingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCalvingDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastCalvingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCalvingDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastCheckupDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckupDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastCheckupDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckupDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastCheckupVeterinarian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckupVeterinarian', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
  sortByLastCheckupVeterinarianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckupVeterinarian', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastServiceBull() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastServiceBull', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastServiceBullDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastServiceBull', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastServiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastServiceDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastServiceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastServiceDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastWeighDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWeighDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLastWeighDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWeighDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLocalVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localVersion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLocalVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localVersion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLocationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLocationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modifiedBy', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modifiedBy', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByMonthlyMaintenanceCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyMaintenanceCost', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
  sortByMonthlyMaintenanceCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyMaintenanceCost', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNextCalvingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextCalvingDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNextCalvingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextCalvingDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNextHeatDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHeatDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNextHeatDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHeatDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNfcChipId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nfcChipId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNfcChipIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nfcChipId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNutritionalProgram() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionalProgram', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNutritionalProgramDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionalProgram', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByOffspringCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offspringCount', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByOffspringCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offspringCount', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUrl', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUrl', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPotentialBuyer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potentialBuyer', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPotentialBuyerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potentialBuyer', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByProfilePhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePhotoUrl', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByProfilePhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePhotoUrl', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRegistrationNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNumber', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRegistrationNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNumber', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByReproductiveStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reproductiveStatus', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByReproductiveStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reproductiveStatus', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRespiratoryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respiratoryRate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRespiratoryRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respiratoryRate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRfidTagId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidTagId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRfidTagIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidTagId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySeller() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seller', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySellerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seller', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sex', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sex', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySireBreed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sireBreed', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySireBreedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sireBreed', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByTotalMilkYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMilkYield', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByTotalMilkYieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMilkYield', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByTotalRevenueGenerated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRevenueGenerated', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByTotalRevenueGeneratedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRevenueGenerated', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByVisualTagId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualTagId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByVisualTagIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualTagId', Sort.desc);
    });
  }
}

extension AnimalQuerySortThenBy on QueryBuilder<Animal, Animal, QSortThenBy> {
  QueryBuilder<Animal, Animal, QAfterSortBy> thenByAverageDailyGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageDailyGain', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByAverageDailyGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageDailyGain', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBirthWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthWeight', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBirthWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthWeight', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBrandNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandNumber', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBrandNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandNumber', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBreed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breed', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByBreedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'breed', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCalvingCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calvingCount', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCalvingCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calvingCount', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCoatColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coatColor', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCoatColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coatColor', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByConsiguity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consiguity', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByConsiguityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consiguity', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCurrentLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLocation', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCurrentLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLocation', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCurrentTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTemperature', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCurrentTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTemperature', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCurrentWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWeight', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCurrentWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWeight', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDailyConsumptionKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyConsumptionKg', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDailyConsumptionKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyConsumptionKg', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDailyMilkYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyMilkYield', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDailyMilkYieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyMilkYield', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDamBreed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'damBreed', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDamBreedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'damBreed', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDataHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHash', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDataHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataHash', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDietType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dietType', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDietTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dietType', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDistinctiveMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distinctiveMarks', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDistinctiveMarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distinctiveMarks', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstimatedValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedValue', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstimatedValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedValue', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGestationDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gestationDays', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGestationDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gestationDays', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHealthDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthDescription', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHealthDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthDescription', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHealthStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthStatus', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHealthStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthStatus', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heartRate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'heartRate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIsPregnant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPregnant', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIsPregnantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPregnant', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastCalvingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCalvingDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastCalvingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCalvingDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastCheckupDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckupDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastCheckupDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckupDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastCheckupVeterinarian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckupVeterinarian', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
  thenByLastCheckupVeterinarianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckupVeterinarian', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastServiceBull() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastServiceBull', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastServiceBullDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastServiceBull', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastServiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastServiceDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastServiceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastServiceDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastWeighDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWeighDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLastWeighDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWeighDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLocalVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localVersion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLocalVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localVersion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLocationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLocationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modifiedBy', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modifiedBy', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByMonthlyMaintenanceCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyMaintenanceCost', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
  thenByMonthlyMaintenanceCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyMaintenanceCost', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNextCalvingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextCalvingDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNextCalvingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextCalvingDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNextHeatDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHeatDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNextHeatDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHeatDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNfcChipId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nfcChipId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNfcChipIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nfcChipId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNutritionalProgram() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionalProgram', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNutritionalProgramDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionalProgram', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByOffspringCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offspringCount', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByOffspringCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offspringCount', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUrl', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUrl', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPotentialBuyer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potentialBuyer', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPotentialBuyerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potentialBuyer', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByProfilePhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePhotoUrl', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByProfilePhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profilePhotoUrl', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRegistrationNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNumber', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRegistrationNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNumber', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByReproductiveStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reproductiveStatus', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByReproductiveStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reproductiveStatus', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRespiratoryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respiratoryRate', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRespiratoryRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respiratoryRate', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRfidTagId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidTagId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRfidTagIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rfidTagId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySeller() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seller', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySellerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seller', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sex', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sex', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySireBreed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sireBreed', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySireBreedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sireBreed', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByTotalMilkYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMilkYield', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByTotalMilkYieldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMilkYield', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByTotalRevenueGenerated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRevenueGenerated', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByTotalRevenueGeneratedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRevenueGenerated', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByVisualTagId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualTagId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByVisualTagIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visualTagId', Sort.desc);
    });
  }
}

extension AnimalQueryWhereDistinct on QueryBuilder<Animal, Animal, QDistinct> {
  QueryBuilder<Animal, Animal, QDistinct> distinctByAverageDailyGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageDailyGain');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByBarcode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barcode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthDate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByBirthWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthWeight');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByBrandNumber({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByBreed({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'breed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByCalvingCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calvingCount');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByCoatColor({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coatColor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByConsiguity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consiguity');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByCreatedBy({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByCurrentLocation({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'currentLocation',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByCurrentTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentTemperature');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByCurrentWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentWeight');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDailyConsumptionKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyConsumptionKg');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDailyMilkYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyMilkYield');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDamBreed({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'damBreed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDataHash({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDietType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dietType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDistinctiveMarks({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'distinctiveMarks',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDocumentUrls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentUrls');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByEstado({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByEstimatedValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedValue');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generation');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByGestationDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gestationDays');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByHealthDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'healthDescription',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByHealthStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'healthStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'heartRate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByIsPregnant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPregnant');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLastCalvingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCalvingDate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLastCheckupDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCheckupDate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLastCheckupVeterinarian({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'lastCheckupVeterinarian',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLastServiceBull({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'lastServiceBull',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLastServiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastServiceDate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdatedAt');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLastWeighDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWeighDate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLocalVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localVersion');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLocationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationDate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByModificationHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modificationHistory');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByModifiedBy({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modifiedBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByMonthlyMaintenanceCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyMaintenanceCost');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNextCalvingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextCalvingDate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNextHeatDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextHeatDate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNfcChipId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nfcChipId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNutritionalProgram({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'nutritionalProgram',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByOffspringCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'offspringCount');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByPhotoUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByPhotoUrls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoUrls');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByPotentialBuyer({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'potentialBuyer',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByProfilePhotoUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'profilePhotoUrl',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByPurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchasePrice');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByRegistrationNumber({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'registrationNumber',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByReproductiveStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'reproductiveStatus',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByRespiratoryRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'respiratoryRate');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByRfidTagId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rfidTagId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctBySeller({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seller', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByServerId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctBySex({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctBySireBreed({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sireBreed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctBySupplements() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplements');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctBySyncStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByTotalMilkYield() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalMilkYield');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByTotalRevenueGenerated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalRevenueGenerated');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByVideoUrls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videoUrls');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByVisualTagId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visualTagId', caseSensitive: caseSensitive);
    });
  }
}

extension AnimalQueryProperty on QueryBuilder<Animal, Animal, QQueryProperty> {
  QueryBuilder<Animal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> averageDailyGainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageDailyGain');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> barcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barcode');
    });
  }

  QueryBuilder<Animal, DateTime, QQueryOperations> birthDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthDate');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> birthWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthWeight');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> brandNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandNumber');
    });
  }

  QueryBuilder<Animal, String, QQueryOperations> breedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'breed');
    });
  }

  QueryBuilder<Animal, int, QQueryOperations> calvingCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calvingCount');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> coatColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coatColor');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> consiguityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consiguity');
    });
  }

  QueryBuilder<Animal, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> currentLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLocation');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> currentTemperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentTemperature');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> currentWeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentWeight');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> dailyConsumptionKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyConsumptionKg');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> dailyMilkYieldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyMilkYield');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> damBreedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'damBreed');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> dataHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataHash');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> dietTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dietType');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> distinctiveMarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distinctiveMarks');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> documentUrlsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentUrls');
    });
  }

  QueryBuilder<Animal, EstadoAnimal, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> estimatedValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedValue');
    });
  }

  QueryBuilder<Animal, int?, QQueryOperations> generationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generation');
    });
  }

  QueryBuilder<Animal, int?, QQueryOperations> gestationDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gestationDays');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> healthDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthDescription');
    });
  }

  QueryBuilder<Animal, EstadoSalud, QQueryOperations> healthStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthStatus');
    });
  }

  QueryBuilder<Animal, int?, QQueryOperations> heartRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'heartRate');
    });
  }

  QueryBuilder<Animal, bool, QQueryOperations> isPregnantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPregnant');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> lastCalvingDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCalvingDate');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> lastCheckupDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCheckupDate');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations>
  lastCheckupVeterinarianProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCheckupVeterinarian');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> lastServiceBullProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastServiceBull');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> lastServiceDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastServiceDate');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> lastUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdatedAt');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> lastWeighDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWeighDate');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<Animal, int, QQueryOperations> localVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localVersion');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> locationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationDate');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations>
  modificationHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modificationHistory');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> modifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modifiedBy');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations>
  monthlyMaintenanceCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyMaintenanceCost');
    });
  }

  QueryBuilder<Animal, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> nextCalvingDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextCalvingDate');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> nextHeatDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextHeatDate');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> nfcChipIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nfcChipId');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> nutritionalProgramProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nutritionalProgram');
    });
  }

  QueryBuilder<Animal, int, QQueryOperations> offspringCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'offspringCount');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> photoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoUrl');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> photoUrlsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoUrls');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> potentialBuyerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'potentialBuyer');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> profilePhotoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profilePhotoUrl');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> purchasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchasePrice');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> registrationNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registrationNumber');
    });
  }

  QueryBuilder<Animal, EstadoReproductivo?, QQueryOperations>
  reproductiveStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reproductiveStatus');
    });
  }

  QueryBuilder<Animal, int?, QQueryOperations> respiratoryRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'respiratoryRate');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> rfidTagIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rfidTagId');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> sellerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seller');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<Animal, Sexo, QQueryOperations> sexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sex');
    });
  }

  QueryBuilder<Animal, SinigaId?, QQueryOperations> siniigaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siniigaId');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> sireBreedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sireBreed');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> supplementsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplements');
    });
  }

  QueryBuilder<Animal, EstadoSync, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> totalMilkYieldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalMilkYield');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations>
  totalRevenueGeneratedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalRevenueGenerated');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> videoUrlsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoUrls');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> visualTagIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visualTagId');
    });
  }
}
