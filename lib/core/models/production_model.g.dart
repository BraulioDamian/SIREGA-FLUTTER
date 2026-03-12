// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductionRecordCollection on Isar {
  IsarCollection<ProductionRecord> get productionRecords => this.collection();
}

const ProductionRecordSchema = CollectionSchema(
  name: r'ProductionRecord',
  id: 3539130391359248267,
  properties: {
    r'date': PropertySchema(id: 0, name: r'date', type: IsarType.dateTime),
    r'idCria': PropertySchema(id: 1, name: r'idCria', type: IsarType.string),
    r'lastUpdatedAt': PropertySchema(
      id: 2,
      name: r'lastUpdatedAt',
      type: IsarType.dateTime,
    ),
    r'litrosPorDia': PropertySchema(
      id: 3,
      name: r'litrosPorDia',
      type: IsarType.double,
    ),
    r'notes': PropertySchema(id: 4, name: r'notes', type: IsarType.string),
    r'pesoKg': PropertySchema(id: 5, name: r'pesoKg', type: IsarType.double),
    r'serverId': PropertySchema(
      id: 6,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'sexoCria': PropertySchema(
      id: 7,
      name: r'sexoCria',
      type: IsarType.string,
      enumMap: _ProductionRecordsexoCriaEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 8,
      name: r'syncStatus',
      type: IsarType.string,
      enumMap: _ProductionRecordsyncStatusEnumValueMap,
    ),
    r'tipo': PropertySchema(
      id: 9,
      name: r'tipo',
      type: IsarType.string,
      enumMap: _ProductionRecordtipoEnumValueMap,
    ),
  },
  estimateSize: _productionRecordEstimateSize,
  serialize: _productionRecordSerialize,
  deserialize: _productionRecordDeserialize,
  deserializeProp: _productionRecordDeserializeProp,
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
      id: -787253233696560365,
      name: r'animal',
      target: r'Animal',
      single: true,
    ),
  },
  embeddedSchemas: {},
  getId: _productionRecordGetId,
  getLinks: _productionRecordGetLinks,
  attach: _productionRecordAttach,
  version: '3.1.0+1',
);

int _productionRecordEstimateSize(
  ProductionRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.idCria;
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
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sexoCria;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.syncStatus.name.length * 3;
  bytesCount += 3 + object.tipo.name.length * 3;
  return bytesCount;
}

void _productionRecordSerialize(
  ProductionRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.idCria);
  writer.writeDateTime(offsets[2], object.lastUpdatedAt);
  writer.writeDouble(offsets[3], object.litrosPorDia);
  writer.writeString(offsets[4], object.notes);
  writer.writeDouble(offsets[5], object.pesoKg);
  writer.writeString(offsets[6], object.serverId);
  writer.writeString(offsets[7], object.sexoCria?.name);
  writer.writeString(offsets[8], object.syncStatus.name);
  writer.writeString(offsets[9], object.tipo.name);
}

ProductionRecord _productionRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductionRecord();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.idCria = reader.readStringOrNull(offsets[1]);
  object.lastUpdatedAt = reader.readDateTimeOrNull(offsets[2]);
  object.litrosPorDia = reader.readDoubleOrNull(offsets[3]);
  object.notes = reader.readStringOrNull(offsets[4]);
  object.pesoKg = reader.readDoubleOrNull(offsets[5]);
  object.serverId = reader.readStringOrNull(offsets[6]);
  object.sexoCria =
      _ProductionRecordsexoCriaValueEnumMap[reader.readStringOrNull(
        offsets[7],
      )];
  object.syncStatus =
      _ProductionRecordsyncStatusValueEnumMap[reader.readStringOrNull(
        offsets[8],
      )] ??
      EstadoSync.pendiente;
  object.tipo =
      _ProductionRecordtipoValueEnumMap[reader.readStringOrNull(offsets[9])] ??
      ProductionType.weight;
  return object;
}

P _productionRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_ProductionRecordsexoCriaValueEnumMap[reader.readStringOrNull(
            offset,
          )])
          as P;
    case 8:
      return (_ProductionRecordsyncStatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              EstadoSync.pendiente)
          as P;
    case 9:
      return (_ProductionRecordtipoValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              ProductionType.weight)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProductionRecordsexoCriaEnumValueMap = {
  r'macho': r'macho',
  r'hembra': r'hembra',
  r'castrado': r'castrado',
};
const _ProductionRecordsexoCriaValueEnumMap = {
  r'macho': Sexo.macho,
  r'hembra': Sexo.hembra,
  r'castrado': Sexo.castrado,
};
const _ProductionRecordsyncStatusEnumValueMap = {
  r'pendiente': r'pendiente',
  r'enProceso': r'enProceso',
  r'completado': r'completado',
  r'error': r'error',
  r'conflicto': r'conflicto',
  r'cancelado': r'cancelado',
};
const _ProductionRecordsyncStatusValueEnumMap = {
  r'pendiente': EstadoSync.pendiente,
  r'enProceso': EstadoSync.enProceso,
  r'completado': EstadoSync.completado,
  r'error': EstadoSync.error,
  r'conflicto': EstadoSync.conflicto,
  r'cancelado': EstadoSync.cancelado,
};
const _ProductionRecordtipoEnumValueMap = {
  r'weight': r'weight',
  r'milk': r'milk',
  r'birth': r'birth',
};
const _ProductionRecordtipoValueEnumMap = {
  r'weight': ProductionType.weight,
  r'milk': ProductionType.milk,
  r'birth': ProductionType.birth,
};

Id _productionRecordGetId(ProductionRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productionRecordGetLinks(ProductionRecord object) {
  return [object.animal];
}

void _productionRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  ProductionRecord object,
) {
  object.id = id;
  object.animal.attach(col, col.isar.collection<Animal>(), r'animal', id);
}

extension ProductionRecordQueryWhereSort
    on QueryBuilder<ProductionRecord, ProductionRecord, QWhere> {
  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductionRecordQueryWhere
    on QueryBuilder<ProductionRecord, ProductionRecord, QWhereClause> {
  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhereClause>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhereClause> idBetween(
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhereClause>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [null]),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhereClause>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhereClause>
  serverIdEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'serverId', value: [serverId]),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterWhereClause>
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

extension ProductionRecordQueryFilter
    on QueryBuilder<ProductionRecord, ProductionRecord, QFilterCondition> {
  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: value),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'idCria'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'idCria'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'idCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'idCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'idCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'idCria',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'idCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'idCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'idCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'idCria',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'idCria', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  idCriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'idCria', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  lastUpdatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastUpdatedAt'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  lastUpdatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastUpdatedAt'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  lastUpdatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdatedAt', value: value),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  litrosPorDiaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'litrosPorDia'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  litrosPorDiaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'litrosPorDia'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  litrosPorDiaEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'litrosPorDia',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  litrosPorDiaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'litrosPorDia',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  litrosPorDiaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'litrosPorDia',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  litrosPorDiaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'litrosPorDia',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  pesoKgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pesoKg'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  pesoKgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pesoKg'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  pesoKgEqualTo(double? value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pesoKg',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  pesoKgGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pesoKg',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  pesoKgLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pesoKg',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  pesoKgBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pesoKg',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'serverId'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'serverId', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sexoCria'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sexoCria'),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaEqualTo(Sexo? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sexoCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaGreaterThan(
    Sexo? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sexoCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaLessThan(
    Sexo? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sexoCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaBetween(
    Sexo? lower,
    Sexo? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sexoCria',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sexoCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sexoCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sexoCria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sexoCria',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sexoCria', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  sexoCriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sexoCria', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncStatus', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncStatus', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  tipoEqualTo(ProductionType value, {bool caseSensitive = true}) {
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  tipoGreaterThan(
    ProductionType value, {
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  tipoLessThan(
    ProductionType value, {
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  tipoBetween(
    ProductionType lower,
    ProductionType upper, {
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
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

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tipo', value: ''),
      );
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tipo', value: ''),
      );
    });
  }
}

extension ProductionRecordQueryObject
    on QueryBuilder<ProductionRecord, ProductionRecord, QFilterCondition> {}

extension ProductionRecordQueryLinks
    on QueryBuilder<ProductionRecord, ProductionRecord, QFilterCondition> {
  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  animal(FilterQuery<Animal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'animal');
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterFilterCondition>
  animalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animal', 0, true, 0, true);
    });
  }
}

extension ProductionRecordQuerySortBy
    on QueryBuilder<ProductionRecord, ProductionRecord, QSortBy> {
  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByIdCria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCria', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByIdCriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCria', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByLastUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByLitrosPorDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litrosPorDia', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByLitrosPorDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litrosPorDia', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByPesoKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoKg', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByPesoKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoKg', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortBySexoCria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexoCria', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortBySexoCriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexoCria', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension ProductionRecordQuerySortThenBy
    on QueryBuilder<ProductionRecord, ProductionRecord, QSortThenBy> {
  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByIdCria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCria', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByIdCriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCria', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByLastUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdatedAt', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByLitrosPorDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litrosPorDia', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByLitrosPorDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litrosPorDia', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByPesoKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoKg', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByPesoKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoKg', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenBySexoCria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexoCria', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenBySexoCriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexoCria', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QAfterSortBy>
  thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension ProductionRecordQueryWhereDistinct
    on QueryBuilder<ProductionRecord, ProductionRecord, QDistinct> {
  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct> distinctByIdCria({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct>
  distinctByLastUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdatedAt');
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct>
  distinctByLitrosPorDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'litrosPorDia');
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct>
  distinctByPesoKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pesoKg');
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct>
  distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct>
  distinctBySexoCria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sexoCria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct>
  distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductionRecord, ProductionRecord, QDistinct> distinctByTipo({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension ProductionRecordQueryProperty
    on QueryBuilder<ProductionRecord, ProductionRecord, QQueryProperty> {
  QueryBuilder<ProductionRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductionRecord, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ProductionRecord, String?, QQueryOperations> idCriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCria');
    });
  }

  QueryBuilder<ProductionRecord, DateTime?, QQueryOperations>
  lastUpdatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdatedAt');
    });
  }

  QueryBuilder<ProductionRecord, double?, QQueryOperations>
  litrosPorDiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'litrosPorDia');
    });
  }

  QueryBuilder<ProductionRecord, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<ProductionRecord, double?, QQueryOperations> pesoKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pesoKg');
    });
  }

  QueryBuilder<ProductionRecord, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<ProductionRecord, Sexo?, QQueryOperations> sexoCriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sexoCria');
    });
  }

  QueryBuilder<ProductionRecord, EstadoSync, QQueryOperations>
  syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<ProductionRecord, ProductionType, QQueryOperations>
  tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}
