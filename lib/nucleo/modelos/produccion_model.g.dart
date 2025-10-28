// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produccion_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegistroProduccionCollection on Isar {
  IsarCollection<RegistroProduccion> get registroProduccions =>
      this.collection();
}

const RegistroProduccionSchema = CollectionSchema(
  name: r'RegistroProduccion',
  id: -819501691636569775,
  properties: {
    r'estadoSync': PropertySchema(
      id: 0,
      name: r'estadoSync',
      type: IsarType.string,
      enumMap: _RegistroProduccionestadoSyncEnumValueMap,
    ),
    r'fecha': PropertySchema(
      id: 1,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'idCria': PropertySchema(
      id: 2,
      name: r'idCria',
      type: IsarType.string,
    ),
    r'litrosPorDia': PropertySchema(
      id: 3,
      name: r'litrosPorDia',
      type: IsarType.double,
    ),
    r'notas': PropertySchema(
      id: 4,
      name: r'notas',
      type: IsarType.string,
    ),
    r'pesoKg': PropertySchema(
      id: 5,
      name: r'pesoKg',
      type: IsarType.double,
    ),
    r'serverId': PropertySchema(
      id: 6,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'tipo': PropertySchema(
      id: 7,
      name: r'tipo',
      type: IsarType.string,
    ),
    r'ultimaActualizacion': PropertySchema(
      id: 8,
      name: r'ultimaActualizacion',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _registroProduccionEstimateSize,
  serialize: _registroProduccionSerialize,
  deserialize: _registroProduccionDeserialize,
  deserializeProp: _registroProduccionDeserializeProp,
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
        )
      ],
    )
  },
  links: {
    r'animal': LinkSchema(
      id: 8226965955159551942,
      name: r'animal',
      target: r'Animal',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _registroProduccionGetId,
  getLinks: _registroProduccionGetLinks,
  attach: _registroProduccionAttach,
  version: '3.1.0+1',
);

int _registroProduccionEstimateSize(
  RegistroProduccion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.estadoSync.name.length * 3;
  {
    final value = object.idCria;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notas;
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
  bytesCount += 3 + object.tipo.length * 3;
  return bytesCount;
}

void _registroProduccionSerialize(
  RegistroProduccion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.estadoSync.name);
  writer.writeDateTime(offsets[1], object.fecha);
  writer.writeString(offsets[2], object.idCria);
  writer.writeDouble(offsets[3], object.litrosPorDia);
  writer.writeString(offsets[4], object.notas);
  writer.writeDouble(offsets[5], object.pesoKg);
  writer.writeString(offsets[6], object.serverId);
  writer.writeString(offsets[7], object.tipo);
  writer.writeDateTime(offsets[8], object.ultimaActualizacion);
}

RegistroProduccion _registroProduccionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegistroProduccion();
  object.estadoSync = _RegistroProduccionestadoSyncValueEnumMap[
          reader.readStringOrNull(offsets[0])] ??
      EstadoSync.pendiente;
  object.fecha = reader.readDateTime(offsets[1]);
  object.id = id;
  object.idCria = reader.readStringOrNull(offsets[2]);
  object.litrosPorDia = reader.readDoubleOrNull(offsets[3]);
  object.notas = reader.readStringOrNull(offsets[4]);
  object.pesoKg = reader.readDoubleOrNull(offsets[5]);
  object.serverId = reader.readStringOrNull(offsets[6]);
  object.tipo = reader.readString(offsets[7]);
  object.ultimaActualizacion = reader.readDateTimeOrNull(offsets[8]);
  return object;
}

P _registroProduccionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_RegistroProduccionestadoSyncValueEnumMap[
              reader.readStringOrNull(offset)] ??
          EstadoSync.pendiente) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RegistroProduccionestadoSyncEnumValueMap = {
  r'pendiente': r'pendiente',
  r'enProceso': r'enProceso',
  r'completado': r'completado',
  r'error': r'error',
  r'conflicto': r'conflicto',
  r'cancelado': r'cancelado',
};
const _RegistroProduccionestadoSyncValueEnumMap = {
  r'pendiente': EstadoSync.pendiente,
  r'enProceso': EstadoSync.enProceso,
  r'completado': EstadoSync.completado,
  r'error': EstadoSync.error,
  r'conflicto': EstadoSync.conflicto,
  r'cancelado': EstadoSync.cancelado,
};

Id _registroProduccionGetId(RegistroProduccion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _registroProduccionGetLinks(
    RegistroProduccion object) {
  return [object.animal];
}

void _registroProduccionAttach(
    IsarCollection<dynamic> col, Id id, RegistroProduccion object) {
  object.id = id;
  object.animal.attach(col, col.isar.collection<Animal>(), r'animal', id);
}

extension RegistroProduccionQueryWhereSort
    on QueryBuilder<RegistroProduccion, RegistroProduccion, QWhere> {
  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RegistroProduccionQueryWhere
    on QueryBuilder<RegistroProduccion, RegistroProduccion, QWhereClause> {
  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhereClause>
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

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhereClause>
      serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [null],
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhereClause>
      serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serverId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhereClause>
      serverIdEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [serverId],
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterWhereClause>
      serverIdNotEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [],
              upper: [serverId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [serverId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [serverId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serverId',
              lower: [],
              upper: [serverId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RegistroProduccionQueryFilter
    on QueryBuilder<RegistroProduccion, RegistroProduccion, QFilterCondition> {
  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncEqualTo(
    EstadoSync value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncGreaterThan(
    EstadoSync value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncLessThan(
    EstadoSync value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncBetween(
    EstadoSync lower,
    EstadoSync upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoSync',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoSync',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoSync',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      estadoSyncIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoSync',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      fechaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      fechaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      fechaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      fechaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fecha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idCria',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idCria',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idCria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idCria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idCria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idCria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCria',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      idCriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idCria',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      litrosPorDiaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'litrosPorDia',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      litrosPorDiaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'litrosPorDia',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      litrosPorDiaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'litrosPorDia',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      litrosPorDiaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'litrosPorDia',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      litrosPorDiaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'litrosPorDia',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      litrosPorDiaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'litrosPorDia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      pesoKgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pesoKg',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      pesoKgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pesoKg',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      pesoKgEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pesoKg',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      pesoKgGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pesoKg',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      pesoKgLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pesoKg',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      pesoKgBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pesoKg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      ultimaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ultimaActualizacion',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      ultimaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ultimaActualizacion',
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      ultimaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ultimaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      ultimaActualizacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ultimaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      ultimaActualizacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ultimaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      ultimaActualizacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ultimaActualizacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RegistroProduccionQueryObject
    on QueryBuilder<RegistroProduccion, RegistroProduccion, QFilterCondition> {}

extension RegistroProduccionQueryLinks
    on QueryBuilder<RegistroProduccion, RegistroProduccion, QFilterCondition> {
  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      animal(FilterQuery<Animal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'animal');
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterFilterCondition>
      animalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animal', 0, true, 0, true);
    });
  }
}

extension RegistroProduccionQuerySortBy
    on QueryBuilder<RegistroProduccion, RegistroProduccion, QSortBy> {
  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByEstadoSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByEstadoSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByIdCria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCria', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByIdCriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCria', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByLitrosPorDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litrosPorDia', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByLitrosPorDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litrosPorDia', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByPesoKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoKg', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByPesoKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoKg', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      sortByUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.desc);
    });
  }
}

extension RegistroProduccionQuerySortThenBy
    on QueryBuilder<RegistroProduccion, RegistroProduccion, QSortThenBy> {
  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByEstadoSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByEstadoSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByIdCria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCria', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByIdCriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCria', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByLitrosPorDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litrosPorDia', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByLitrosPorDiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'litrosPorDia', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByPesoKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoKg', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByPesoKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoKg', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QAfterSortBy>
      thenByUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.desc);
    });
  }
}

extension RegistroProduccionQueryWhereDistinct
    on QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct> {
  QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct>
      distinctByEstadoSync({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoSync', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct>
      distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct>
      distinctByIdCria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct>
      distinctByLitrosPorDia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'litrosPorDia');
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct>
      distinctByNotas({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct>
      distinctByPesoKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pesoKg');
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct>
      distinctByServerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct>
      distinctByTipo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RegistroProduccion, RegistroProduccion, QDistinct>
      distinctByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ultimaActualizacion');
    });
  }
}

extension RegistroProduccionQueryProperty
    on QueryBuilder<RegistroProduccion, RegistroProduccion, QQueryProperty> {
  QueryBuilder<RegistroProduccion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegistroProduccion, EstadoSync, QQueryOperations>
      estadoSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoSync');
    });
  }

  QueryBuilder<RegistroProduccion, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<RegistroProduccion, String?, QQueryOperations> idCriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCria');
    });
  }

  QueryBuilder<RegistroProduccion, double?, QQueryOperations>
      litrosPorDiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'litrosPorDia');
    });
  }

  QueryBuilder<RegistroProduccion, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<RegistroProduccion, double?, QQueryOperations> pesoKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pesoKg');
    });
  }

  QueryBuilder<RegistroProduccion, String?, QQueryOperations>
      serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<RegistroProduccion, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<RegistroProduccion, DateTime?, QQueryOperations>
      ultimaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ultimaActualizacion');
    });
  }
}
