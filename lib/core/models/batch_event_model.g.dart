// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_event_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBatchEventRecordCollection on Isar {
  IsarCollection<BatchEventRecord> get batchEventRecords => this.collection();
}

const BatchEventRecordSchema = CollectionSchema(
  name: r'BatchEventRecord',
  id: 1057035472955965501,
  properties: {
    r'animalesIds': PropertySchema(
      id: 0,
      name: r'animalesIds',
      type: IsarType.longList,
    ),
    r'cantidadAnimales': PropertySchema(
      id: 1,
      name: r'cantidadAnimales',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(id: 3, name: r'date', type: IsarType.dateTime),
    r'lastUpdatedAt': PropertySchema(
      id: 4,
      name: r'lastUpdatedAt',
      type: IsarType.dateTime,
    ),
    r'loteId': PropertySchema(id: 5, name: r'loteId', type: IsarType.string),
    r'productName': PropertySchema(
      id: 6,
      name: r'productName',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 7,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 8,
      name: r'syncStatus',
      type: IsarType.string,
      enumMap: _BatchEventRecordsyncStatusEnumValueMap,
    ),
    r'tipo': PropertySchema(
      id: 9,
      name: r'tipo',
      type: IsarType.string,
      enumMap: _BatchEventRecordtipoEnumValueMap,
    ),
  },
  estimateSize: _batchEventRecordEstimateSize,
  serialize: _batchEventRecordSerialize,
  deserialize: _batchEventRecordDeserialize,
  deserializeProp: _batchEventRecordDeserializeProp,
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
  links: {},
  embeddedSchemas: {},
  getId: _batchEventRecordGetId,
  getLinks: _batchEventRecordGetLinks,
  attach: _batchEventRecordAttach,
  version: '3.1.0+1',
);

int _batchEventRecordEstimateSize(
  BatchEventRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.animalesIds.length * 8;
  bytesCount += 3 + object.loteId.length * 3;
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
  return bytesCount;
}

void _batchEventRecordSerialize(
  BatchEventRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.animalesIds);
  writer.writeLong(offsets[1], object.cantidadAnimales);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDateTime(offsets[3], object.date);
  writer.writeDateTime(offsets[4], object.lastUpdatedAt);
  writer.writeString(offsets[5], object.loteId);
  writer.writeString(offsets[6], object.productName);
  writer.writeString(offsets[7], object.serverId);
  writer.writeString(offsets[8], object.syncStatus.name);
  writer.writeString(offsets[9], object.tipo.name);
}

BatchEventRecord _batchEventRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BatchEventRecord();
  object.animalesIds = reader.readLongList(offsets[0]) ?? [];
  object.cantidadAnimales = reader.readLong(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.date = reader.readDateTime(offsets[3]);
  object.id = id;
  object.lastUpdatedAt = reader.readDateTimeOrNull(offsets[4]);
  object.loteId = reader.readString(offsets[5]);
  object.productName = reader.readStringOrNull(offsets[6]);
  object.serverId = reader.readStringOrNull(offsets[7]);
  object.syncStatus =
      _BatchEventRecordsyncStatusValueEnumMap[reader.readStringOrNull(
        offsets[8],
      )] ??
      EstadoSync.pendiente;
  object.tipo =
      _BatchEventRecordtipoValueEnumMap[reader.readStringOrNull(offsets[9])] ??
      TipoEvento.vacuna;
  return object;
}

P _batchEventRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (_BatchEventRecordsyncStatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              EstadoSync.pendiente)
          as P;
    case 9:
      return (_BatchEventRecordtipoValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              TipoEvento.vacuna)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BatchEventRecordsyncStatusEnumValueMap = {
  r'pendiente': r'pendiente',
  r'enProceso': r'enProceso',
  r'completado': r'completado',
  r'error': r'error',
  r'conflicto': r'conflicto',
  r'cancelado': r'cancelado',
};
const _BatchEventRecordsyncStatusValueEnumMap = {
  r'pendiente': EstadoSync.pendiente,
  r'enProceso': EstadoSync.enProceso,
  r'completado': EstadoSync.completado,
  r'error': EstadoSync.error,
  r'conflicto': EstadoSync.conflicto,
  r'cancelado': EstadoSync.cancelado,
};
const _BatchEventRecordtipoEnumValueMap = {
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
const _BatchEventRecordtipoValueEnumMap = {
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

Id _batchEventRecordGetId(BatchEventRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _batchEventRecordGetLinks(BatchEventRecord object) {
  return [];
}

void _batchEventRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  BatchEventRecord object,
) {
  object.id = id;
}

extension BatchEventRecordQueryWhereSort
    on QueryBuilder<BatchEventRecord, BatchEventRecord, QWhere> {
  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BatchEventRecordQueryWhere
    on QueryBuilder<BatchEventRecord, BatchEventRecord, QWhereClause> {
  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhereClause>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhereClause> idBetween(
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhereClause>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhereClause>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhereClause>
  serverIdEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterWhereClause>
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

extension BatchEventRecordQueryFilter
    on QueryBuilder<BatchEventRecord, BatchEventRecord, QFilterCondition> {
  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'animalesIds', value: value),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'animalesIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'animalesIds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'animalesIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'animalesIds', length, true, length, true);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'animalesIds', 0, true, 0, true);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'animalesIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'animalesIds', 0, true, length, include);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'animalesIds', length, include, 999999, true);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  animalesIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'animalesIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  cantidadAnimalesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cantidadAnimales', value: value),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  cantidadAnimalesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cantidadAnimales',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  cantidadAnimalesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cantidadAnimales',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  cantidadAnimalesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cantidadAnimales',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: value),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  lastUpdatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastUpdatedAt'),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  lastUpdatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastUpdatedAt'),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  lastUpdatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdatedAt', value: value),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  loteIdEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  loteIdGreaterThan(
    String value, {
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  loteIdLessThan(
    String value, {
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  loteIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  loteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'loteId', value: ''),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  loteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'loteId', value: ''),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  productNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'productName'),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  productNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'productName'),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'productName', value: ''),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'productName', value: ''),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncStatus', value: ''),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncStatus', value: ''),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
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

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tipo', value: ''),
      );
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterFilterCondition>
  tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tipo', value: ''),
      );
    });
  }
}

extension BatchEventRecordQueryObject
    on QueryBuilder<BatchEventRecord, BatchEventRecord, QFilterCondition> {}

extension BatchEventRecordQueryLinks
    on QueryBuilder<BatchEventRecord, BatchEventRecord, QFilterCondition> {}

extension BatchEventRecordQuerySortBy
    on QueryBuilder<BatchEventRecord, BatchEventRecord, QSortBy> {
  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByCantidadAnimales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadAnimales', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByCantidadAnimalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadAnimales', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByLastUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByLoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByLoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension BatchEventRecordQuerySortThenBy
    on QueryBuilder<BatchEventRecord, BatchEventRecord, QSortThenBy> {
  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByCantidadAnimales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadAnimales', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByCantidadAnimalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadAnimales', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByLastUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByLoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByLoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QAfterSortBy>
  thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension BatchEventRecordQueryWhereDistinct
    on QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct> {
  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct>
  distinctByAnimalesIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'animalesIds');
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct>
  distinctByCantidadAnimales() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidadAnimales');
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct>
  distinctByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdatedAt');
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct> distinctByLoteId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct>
  distinctByProductName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct>
  distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct>
  distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BatchEventRecord, BatchEventRecord, QDistinct> distinctByTipo({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension BatchEventRecordQueryProperty
    on QueryBuilder<BatchEventRecord, BatchEventRecord, QQueryProperty> {
  QueryBuilder<BatchEventRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BatchEventRecord, List<int>, QQueryOperations>
  animalesIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'animalesIds');
    });
  }

  QueryBuilder<BatchEventRecord, int, QQueryOperations>
  cantidadAnimalesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidadAnimales');
    });
  }

  QueryBuilder<BatchEventRecord, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BatchEventRecord, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<BatchEventRecord, DateTime?, QQueryOperations>
  lastUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdatedAt');
    });
  }

  QueryBuilder<BatchEventRecord, String, QQueryOperations> loteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loteId');
    });
  }

  QueryBuilder<BatchEventRecord, String?, QQueryOperations>
  productNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productName');
    });
  }

  QueryBuilder<BatchEventRecord, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<BatchEventRecord, EstadoSync, QQueryOperations>
  syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<BatchEventRecord, TipoEvento, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}
