// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_event_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicalEventRecordCollection on Isar {
  IsarCollection<MedicalEventRecord> get medicalEventRecords =>
      this.collection();
}

const MedicalEventRecordSchema = CollectionSchema(
  name: r'MedicalEventRecord',
  id: 5119351680443294824,
  properties: {
    r'applicationRoute': PropertySchema(
      id: 0,
      name: r'applicationRoute',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(id: 2, name: r'date', type: IsarType.dateTime),
    r'dose': PropertySchema(id: 3, name: r'dose', type: IsarType.double),
    r'doseUnit': PropertySchema(
      id: 4,
      name: r'doseUnit',
      type: IsarType.string,
    ),
    r'esAplicacionUnica': PropertySchema(
      id: 5,
      name: r'esAplicacionUnica',
      type: IsarType.bool,
    ),
    r'intervaloDiasRecomendado': PropertySchema(
      id: 6,
      name: r'intervaloDiasRecomendado',
      type: IsarType.long,
    ),
    r'lastUpdatedAt': PropertySchema(
      id: 7,
      name: r'lastUpdatedAt',
      type: IsarType.dateTime,
    ),
    r'loteId': PropertySchema(id: 8, name: r'loteId', type: IsarType.string),
    r'nextApplicationDate': PropertySchema(
      id: 9,
      name: r'nextApplicationDate',
      type: IsarType.dateTime,
    ),
    r'notes': PropertySchema(id: 10, name: r'notes', type: IsarType.string),
    r'prioridad': PropertySchema(
      id: 11,
      name: r'prioridad',
      type: IsarType.string,
      enumMap: _MedicalEventRecordprioridadEnumValueMap,
    ),
    r'productName': PropertySchema(
      id: 12,
      name: r'productName',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 13,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 14,
      name: r'syncStatus',
      type: IsarType.string,
      enumMap: _MedicalEventRecordsyncStatusEnumValueMap,
    ),
    r'tipo': PropertySchema(
      id: 15,
      name: r'tipo',
      type: IsarType.string,
      enumMap: _MedicalEventRecordtipoEnumValueMap,
    ),
    r'totalAnimalesLote': PropertySchema(
      id: 16,
      name: r'totalAnimalesLote',
      type: IsarType.long,
    ),
    r'veterinarian': PropertySchema(
      id: 17,
      name: r'veterinarian',
      type: IsarType.string,
    ),
  },
  estimateSize: _medicalEventRecordEstimateSize,
  serialize: _medicalEventRecordSerialize,
  deserialize: _medicalEventRecordDeserialize,
  deserializeProp: _medicalEventRecordDeserializeProp,
  idName: r'id',
  indexes: {
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
    r'animal': LinkSchema(
      id: -1853012482899341254,
      name: r'animal',
      target: r'Animal',
      single: true,
    ),
  },
  embeddedSchemas: {},
  getId: _medicalEventRecordGetId,
  getLinks: _medicalEventRecordGetLinks,
  attach: _medicalEventRecordAttach,
  version: '3.1.0+1',
);

int _medicalEventRecordEstimateSize(
  MedicalEventRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.applicationRoute;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.doseUnit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.loteId;
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
  bytesCount += 3 + object.prioridad.name.length * 3;
  {
    final value = object.productName;
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
  bytesCount += 3 + object.syncStatus.name.length * 3;
  bytesCount += 3 + object.tipo.name.length * 3;
  {
    final value = object.veterinarian;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _medicalEventRecordSerialize(
  MedicalEventRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.applicationRoute);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeDouble(offsets[3], object.dose);
  writer.writeString(offsets[4], object.doseUnit);
  writer.writeBool(offsets[5], object.esAplicacionUnica);
  writer.writeLong(offsets[6], object.intervaloDiasRecomendado);
  writer.writeDateTime(offsets[7], object.lastUpdatedAt);
  writer.writeString(offsets[8], object.loteId);
  writer.writeDateTime(offsets[9], object.nextApplicationDate);
  writer.writeString(offsets[10], object.notes);
  writer.writeString(offsets[11], object.prioridad.name);
  writer.writeString(offsets[12], object.productName);
  writer.writeString(offsets[13], object.serverId);
  writer.writeString(offsets[14], object.syncStatus.name);
  writer.writeString(offsets[15], object.tipo.name);
  writer.writeLong(offsets[16], object.totalAnimalesLote);
  writer.writeString(offsets[17], object.veterinarian);
}

MedicalEventRecord _medicalEventRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MedicalEventRecord();
  object.applicationRoute = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.date = reader.readDateTime(offsets[2]);
  object.dose = reader.readDoubleOrNull(offsets[3]);
  object.doseUnit = reader.readStringOrNull(offsets[4]);
  object.esAplicacionUnica = reader.readBool(offsets[5]);
  object.id = id;
  object.intervaloDiasRecomendado = reader.readLongOrNull(offsets[6]);
  object.lastUpdatedAt = reader.readDateTimeOrNull(offsets[7]);
  object.loteId = reader.readStringOrNull(offsets[8]);
  object.nextApplicationDate = reader.readDateTimeOrNull(offsets[9]);
  object.notes = reader.readStringOrNull(offsets[10]);
  object.prioridad =
      _MedicalEventRecordprioridadValueEnumMap[reader.readStringOrNull(
        offsets[11],
      )] ??
      Prioridad.baja;
  object.productName = reader.readStringOrNull(offsets[12]);
  object.serverId = reader.readStringOrNull(offsets[13]);
  object.syncStatus =
      _MedicalEventRecordsyncStatusValueEnumMap[reader.readStringOrNull(
        offsets[14],
      )] ??
      EstadoSync.pendiente;
  object.tipo =
      _MedicalEventRecordtipoValueEnumMap[reader.readStringOrNull(
        offsets[15],
      )] ??
      TipoEvento.vacuna;
  object.totalAnimalesLote = reader.readLongOrNull(offsets[16]);
  object.veterinarian = reader.readStringOrNull(offsets[17]);
  return object;
}

P _medicalEventRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_MedicalEventRecordprioridadValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              Prioridad.baja)
          as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (_MedicalEventRecordsyncStatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              EstadoSync.pendiente)
          as P;
    case 15:
      return (_MedicalEventRecordtipoValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              TipoEvento.vacuna)
          as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MedicalEventRecordprioridadEnumValueMap = {
  r'baja': r'baja',
  r'media': r'media',
  r'alta': r'alta',
  r'critica': r'critica',
  r'urgente': r'urgente',
};
const _MedicalEventRecordprioridadValueEnumMap = {
  r'baja': Prioridad.baja,
  r'media': Prioridad.media,
  r'alta': Prioridad.alta,
  r'critica': Prioridad.critica,
  r'urgente': Prioridad.urgente,
};
const _MedicalEventRecordsyncStatusEnumValueMap = {
  r'pendiente': r'pendiente',
  r'enProceso': r'enProceso',
  r'completado': r'completado',
  r'error': r'error',
  r'conflicto': r'conflicto',
  r'cancelado': r'cancelado',
};
const _MedicalEventRecordsyncStatusValueEnumMap = {
  r'pendiente': EstadoSync.pendiente,
  r'enProceso': EstadoSync.enProceso,
  r'completado': EstadoSync.completado,
  r'error': EstadoSync.error,
  r'conflicto': EstadoSync.conflicto,
  r'cancelado': EstadoSync.cancelado,
};
const _MedicalEventRecordtipoEnumValueMap = {
  r'vacuna': r'vacuna',
  r'desparasitante': r'desparasitante',
  r'tratamiento': r'tratamiento',
  r'parto': r'parto',
  r'pesaje': r'pesaje',
  r'inseminacion': r'inseminacion',
  r'diagnosticoGestacion': r'diagnosticoGestacion',
  r'castracion': r'castracion',
  r'descorne': r'descorne',
  r'herraje': r'herraje',
  r'revisionVeterinaria': r'revisionVeterinaria',
  r'muestraLaboratorio': r'muestraLaboratorio',
  r'cambioAlimentacion': r'cambioAlimentacion',
  r'movimiento': r'movimiento',
  r'venta': r'venta',
  r'compra': r'compra',
  r'muerte': r'muerte',
  r'otro': r'otro',
};
const _MedicalEventRecordtipoValueEnumMap = {
  r'vacuna': TipoEvento.vacuna,
  r'desparasitante': TipoEvento.desparasitante,
  r'tratamiento': TipoEvento.tratamiento,
  r'parto': TipoEvento.parto,
  r'pesaje': TipoEvento.pesaje,
  r'inseminacion': TipoEvento.inseminacion,
  r'diagnosticoGestacion': TipoEvento.diagnosticoGestacion,
  r'castracion': TipoEvento.castracion,
  r'descorne': TipoEvento.descorne,
  r'herraje': TipoEvento.herraje,
  r'revisionVeterinaria': TipoEvento.revisionVeterinaria,
  r'muestraLaboratorio': TipoEvento.muestraLaboratorio,
  r'cambioAlimentacion': TipoEvento.cambioAlimentacion,
  r'movimiento': TipoEvento.movimiento,
  r'venta': TipoEvento.venta,
  r'compra': TipoEvento.compra,
  r'muerte': TipoEvento.muerte,
  r'otro': TipoEvento.otro,
};

Id _medicalEventRecordGetId(MedicalEventRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _medicalEventRecordGetLinks(
  MedicalEventRecord object,
) {
  return [object.animal];
}

void _medicalEventRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  MedicalEventRecord object,
) {
  object.id = id;
  object.animal.attach(col, col.isar.collection<Animal>(), r'animal', id);
}

extension MedicalEventRecordQueryWhereSort
    on QueryBuilder<MedicalEventRecord, MedicalEventRecord, QWhere> {
  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MedicalEventRecordQueryWhere
    on QueryBuilder<MedicalEventRecord, MedicalEventRecord, QWhereClause> {
  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhereClause>
  idBetween(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhereClause>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhereClause>
  serverIdIsNotNull() {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhereClause>
  serverIdEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterWhereClause>
  serverIdNotEqualTo(String? serverId) {
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

extension MedicalEventRecordQueryFilter
    on QueryBuilder<MedicalEventRecord, MedicalEventRecord, QFilterCondition> {
  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'applicationRoute'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'applicationRoute'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'applicationRoute',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'applicationRoute',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'applicationRoute',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'applicationRoute',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'applicationRoute',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'applicationRoute',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'applicationRoute',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'applicationRoute',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'applicationRoute', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  applicationRouteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'applicationRoute', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  createdAtBetween(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: value),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  dateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'date',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  dateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'date',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'date',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'dose'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'dose'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dose',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dose',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dose',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dose',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'doseUnit'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'doseUnit'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'doseUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'doseUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'doseUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'doseUnit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'doseUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'doseUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'doseUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'doseUnit',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'doseUnit', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  doseUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'doseUnit', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  esAplicacionUnicaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'esAplicacionUnica', value: value),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  idBetween(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  intervaloDiasRecomendadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'intervaloDiasRecomendado'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  intervaloDiasRecomendadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'intervaloDiasRecomendado'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  intervaloDiasRecomendadoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'intervaloDiasRecomendado',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  intervaloDiasRecomendadoGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'intervaloDiasRecomendado',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  intervaloDiasRecomendadoLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'intervaloDiasRecomendado',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  intervaloDiasRecomendadoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'intervaloDiasRecomendado',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  lastUpdatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastUpdatedAt'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  lastUpdatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastUpdatedAt'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  lastUpdatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdatedAt', value: value),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  lastUpdatedAtGreaterThan(DateTime? value, {bool include = false}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  lastUpdatedAtLessThan(DateTime? value, {bool include = false}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  lastUpdatedAtBetween(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'loteId'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'loteId'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'loteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'loteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'loteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'loteId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'loteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'loteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'loteId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'loteId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'loteId', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  loteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'loteId', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  nextApplicationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nextApplicationDate'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  nextApplicationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nextApplicationDate'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  nextApplicationDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nextApplicationDate', value: value),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  nextApplicationDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nextApplicationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  nextApplicationDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nextApplicationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  nextApplicationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nextApplicationDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesEqualTo(String? value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesGreaterThan(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesLessThan(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesBetween(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadEqualTo(Prioridad value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'prioridad',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadGreaterThan(
    Prioridad value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'prioridad',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadLessThan(
    Prioridad value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'prioridad',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadBetween(
    Prioridad lower,
    Prioridad upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'prioridad',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'prioridad',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'prioridad',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'prioridad',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'prioridad',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'prioridad', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  prioridadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'prioridad', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'productName'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'productName'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'productName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'productName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'productName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'productName', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'productName', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdEqualTo(String? value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdGreaterThan(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdLessThan(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdBetween(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusEqualTo(EstadoSync value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusGreaterThan(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusLessThan(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusBetween(
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncStatus', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncStatus', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoEqualTo(TipoEvento value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoGreaterThan(
    TipoEvento value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoLessThan(
    TipoEvento value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoBetween(
    TipoEvento lower,
    TipoEvento upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tipo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tipo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tipo', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tipo', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  totalAnimalesLoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'totalAnimalesLote'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  totalAnimalesLoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'totalAnimalesLote'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  totalAnimalesLoteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalAnimalesLote', value: value),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  totalAnimalesLoteGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalAnimalesLote',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  totalAnimalesLoteLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalAnimalesLote',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  totalAnimalesLoteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalAnimalesLote',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'veterinarian'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'veterinarian'),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'veterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'veterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'veterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'veterinarian',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'veterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'veterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'veterinarian',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'veterinarian',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'veterinarian', value: ''),
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  veterinarianIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'veterinarian', value: ''),
      );
    });
  }
}

extension MedicalEventRecordQueryObject
    on QueryBuilder<MedicalEventRecord, MedicalEventRecord, QFilterCondition> {}

extension MedicalEventRecordQueryLinks
    on QueryBuilder<MedicalEventRecord, MedicalEventRecord, QFilterCondition> {
  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  animal(FilterQuery<Animal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'animal');
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterFilterCondition>
  animalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animal', 0, true, 0, true);
    });
  }
}

extension MedicalEventRecordQuerySortBy
    on QueryBuilder<MedicalEventRecord, MedicalEventRecord, QSortBy> {
  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByApplicationRoute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'applicationRoute', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByApplicationRouteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'applicationRoute', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByDose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByDoseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByDoseUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doseUnit', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByDoseUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doseUnit', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByEsAplicacionUnica() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esAplicacionUnica', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByEsAplicacionUnicaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esAplicacionUnica', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByIntervaloDiasRecomendado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloDiasRecomendado', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByIntervaloDiasRecomendadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloDiasRecomendado', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByLastUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByLoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByLoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByNextApplicationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextApplicationDate', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByNextApplicationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextApplicationDate', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByTotalAnimalesLote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAnimalesLote', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByTotalAnimalesLoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAnimalesLote', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByVeterinarian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinarian', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  sortByVeterinarianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinarian', Sort.desc);
    });
  }
}

extension MedicalEventRecordQuerySortThenBy
    on QueryBuilder<MedicalEventRecord, MedicalEventRecord, QSortThenBy> {
  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByApplicationRoute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'applicationRoute', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByApplicationRouteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'applicationRoute', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByDose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByDoseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dose', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByDoseUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doseUnit', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByDoseUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doseUnit', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByEsAplicacionUnica() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esAplicacionUnica', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByEsAplicacionUnicaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esAplicacionUnica', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByIntervaloDiasRecomendado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloDiasRecomendado', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByIntervaloDiasRecomendadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloDiasRecomendado', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByLastUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByLoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByLoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByNextApplicationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextApplicationDate', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByNextApplicationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextApplicationDate', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByTotalAnimalesLote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAnimalesLote', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByTotalAnimalesLoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAnimalesLote', Sort.desc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByVeterinarian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinarian', Sort.asc);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QAfterSortBy>
  thenByVeterinarianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinarian', Sort.desc);
    });
  }
}

extension MedicalEventRecordQueryWhereDistinct
    on QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct> {
  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByApplicationRoute({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'applicationRoute',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByDose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dose');
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByDoseUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'doseUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByEsAplicacionUnica() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esAplicacionUnica');
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByIntervaloDiasRecomendado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intervaloDiasRecomendado');
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdatedAt');
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByLoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByNextApplicationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextApplicationDate');
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByPrioridad({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prioridad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByProductName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByTipo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByTotalAnimalesLote() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAnimalesLote');
    });
  }

  QueryBuilder<MedicalEventRecord, MedicalEventRecord, QDistinct>
  distinctByVeterinarian({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'veterinarian', caseSensitive: caseSensitive);
    });
  }
}

extension MedicalEventRecordQueryProperty
    on QueryBuilder<MedicalEventRecord, MedicalEventRecord, QQueryProperty> {
  QueryBuilder<MedicalEventRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MedicalEventRecord, String?, QQueryOperations>
  applicationRouteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'applicationRoute');
    });
  }

  QueryBuilder<MedicalEventRecord, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MedicalEventRecord, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<MedicalEventRecord, double?, QQueryOperations> doseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dose');
    });
  }

  QueryBuilder<MedicalEventRecord, String?, QQueryOperations>
  doseUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'doseUnit');
    });
  }

  QueryBuilder<MedicalEventRecord, bool, QQueryOperations>
  esAplicacionUnicaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esAplicacionUnica');
    });
  }

  QueryBuilder<MedicalEventRecord, int?, QQueryOperations>
  intervaloDiasRecomendadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intervaloDiasRecomendado');
    });
  }

  QueryBuilder<MedicalEventRecord, DateTime?, QQueryOperations>
  lastUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdatedAt');
    });
  }

  QueryBuilder<MedicalEventRecord, String?, QQueryOperations> loteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loteId');
    });
  }

  QueryBuilder<MedicalEventRecord, DateTime?, QQueryOperations>
  nextApplicationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextApplicationDate');
    });
  }

  QueryBuilder<MedicalEventRecord, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<MedicalEventRecord, Prioridad, QQueryOperations>
  prioridadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prioridad');
    });
  }

  QueryBuilder<MedicalEventRecord, String?, QQueryOperations>
  productNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productName');
    });
  }

  QueryBuilder<MedicalEventRecord, String?, QQueryOperations>
  serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<MedicalEventRecord, EstadoSync, QQueryOperations>
  syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<MedicalEventRecord, TipoEvento, QQueryOperations>
  tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<MedicalEventRecord, int?, QQueryOperations>
  totalAnimalesLoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAnimalesLote');
    });
  }

  QueryBuilder<MedicalEventRecord, String?, QQueryOperations>
  veterinarianProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'veterinarian');
    });
  }
}
