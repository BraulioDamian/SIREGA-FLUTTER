// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'herd_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHerdCollection on Isar {
  IsarCollection<Herd> get herds => this.collection();
}

const HerdSchema = CollectionSchema(
  name: r'Herd',
  id: -9018197384750735169,
  properties: {
    r'estado': PropertySchema(
      id: 0,
      name: r'estado',
      type: IsarType.string,
    ),
    r'estadoSync': PropertySchema(
      id: 1,
      name: r'estadoSync',
      type: IsarType.string,
      enumMap: _HerdestadoSyncEnumValueMap,
    ),
    r'municipio': PropertySchema(
      id: 2,
      name: r'municipio',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 3,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'ownerUid': PropertySchema(
      id: 4,
      name: r'ownerUid',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 5,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'totalCattleCount': PropertySchema(
      id: 6,
      name: r'totalCattleCount',
      type: IsarType.long,
    ),
    r'ultimaActualizacion': PropertySchema(
      id: 7,
      name: r'ultimaActualizacion',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _herdEstimateSize,
  serialize: _herdSerialize,
  deserialize: _herdDeserialize,
  deserializeProp: _herdDeserializeProp,
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
    r'animales': LinkSchema(
      id: -2820679147055583452,
      name: r'animales',
      target: r'Animal',
      single: false,
      linkName: r'herd',
    )
  },
  embeddedSchemas: {},
  getId: _herdGetId,
  getLinks: _herdGetLinks,
  attach: _herdAttach,
  version: '3.1.0+1',
);

int _herdEstimateSize(
  Herd object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.estado.length * 3;
  bytesCount += 3 + object.estadoSync.name.length * 3;
  bytesCount += 3 + object.municipio.length * 3;
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.ownerUid.length * 3;
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _herdSerialize(
  Herd object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.estado);
  writer.writeString(offsets[1], object.estadoSync.name);
  writer.writeString(offsets[2], object.municipio);
  writer.writeString(offsets[3], object.nombre);
  writer.writeString(offsets[4], object.ownerUid);
  writer.writeString(offsets[5], object.serverId);
  writer.writeLong(offsets[6], object.totalCattleCount);
  writer.writeDateTime(offsets[7], object.ultimaActualizacion);
}

Herd _herdDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Herd();
  object.estado = reader.readString(offsets[0]);
  object.estadoSync =
      _HerdestadoSyncValueEnumMap[reader.readStringOrNull(offsets[1])] ??
          EstadoSync.pendiente;
  object.id = id;
  object.municipio = reader.readString(offsets[2]);
  object.nombre = reader.readString(offsets[3]);
  object.ownerUid = reader.readString(offsets[4]);
  object.serverId = reader.readStringOrNull(offsets[5]);
  object.totalCattleCount = reader.readLong(offsets[6]);
  object.ultimaActualizacion = reader.readDateTimeOrNull(offsets[7]);
  return object;
}

P _herdDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_HerdestadoSyncValueEnumMap[reader.readStringOrNull(offset)] ??
          EstadoSync.pendiente) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _HerdestadoSyncEnumValueMap = {
  r'pendiente': r'pendiente',
  r'enProceso': r'enProceso',
  r'completado': r'completado',
  r'error': r'error',
  r'conflicto': r'conflicto',
  r'cancelado': r'cancelado',
};
const _HerdestadoSyncValueEnumMap = {
  r'pendiente': EstadoSync.pendiente,
  r'enProceso': EstadoSync.enProceso,
  r'completado': EstadoSync.completado,
  r'error': EstadoSync.error,
  r'conflicto': EstadoSync.conflicto,
  r'cancelado': EstadoSync.cancelado,
};

Id _herdGetId(Herd object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _herdGetLinks(Herd object) {
  return [object.animales];
}

void _herdAttach(IsarCollection<dynamic> col, Id id, Herd object) {
  object.id = id;
  object.animales.attach(col, col.isar.collection<Animal>(), r'animales', id);
}

extension HerdQueryWhereSort on QueryBuilder<Herd, Herd, QWhere> {
  QueryBuilder<Herd, Herd, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HerdQueryWhere on QueryBuilder<Herd, Herd, QWhereClause> {
  QueryBuilder<Herd, Herd, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Herd, Herd, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Herd, Herd, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Herd, Herd, QAfterWhereClause> idBetween(
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

  QueryBuilder<Herd, Herd, QAfterWhereClause> serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterWhereClause> serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serverId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterWhereClause> serverIdEqualTo(
      String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [serverId],
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterWhereClause> serverIdNotEqualTo(
      String? serverId) {
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

extension HerdQueryFilter on QueryBuilder<Herd, Herd, QFilterCondition> {
  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncEqualTo(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncGreaterThan(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncLessThan(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncBetween(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncStartsWith(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncEndsWith(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoSync',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoSync',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> estadoSyncIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoSync',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'municipio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'municipio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'municipio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipio',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> municipioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'municipio',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerUid',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ownerUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerUid',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdEqualTo(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdGreaterThan(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdLessThan(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdBetween(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdStartsWith(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdEndsWith(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> totalCattleCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCattleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> totalCattleCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCattleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> totalCattleCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCattleCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> totalCattleCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCattleCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ultimaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ultimaActualizacion',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition>
      ultimaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ultimaActualizacion',
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ultimaActualizacionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ultimaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition>
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ultimaActualizacionLessThan(
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

  QueryBuilder<Herd, Herd, QAfterFilterCondition> ultimaActualizacionBetween(
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

extension HerdQueryObject on QueryBuilder<Herd, Herd, QFilterCondition> {}

extension HerdQueryLinks on QueryBuilder<Herd, Herd, QFilterCondition> {
  QueryBuilder<Herd, Herd, QAfterFilterCondition> animales(
      FilterQuery<Animal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'animales');
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> animalesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animales', length, true, length, true);
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> animalesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animales', 0, true, 0, true);
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> animalesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animales', 0, false, 999999, true);
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> animalesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animales', 0, true, length, include);
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> animalesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animales', length, include, 999999, true);
    });
  }

  QueryBuilder<Herd, Herd, QAfterFilterCondition> animalesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'animales', lower, includeLower, upper, includeUpper);
    });
  }
}

extension HerdQuerySortBy on QueryBuilder<Herd, Herd, QSortBy> {
  QueryBuilder<Herd, Herd, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByEstadoSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByEstadoSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByMunicipio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipio', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByMunicipioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipio', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByOwnerUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUid', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByOwnerUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUid', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByTotalCattleCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCattleCount', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByTotalCattleCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCattleCount', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> sortByUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.desc);
    });
  }
}

extension HerdQuerySortThenBy on QueryBuilder<Herd, Herd, QSortThenBy> {
  QueryBuilder<Herd, Herd, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByEstadoSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByEstadoSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByMunicipio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipio', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByMunicipioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipio', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByOwnerUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUid', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByOwnerUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerUid', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByTotalCattleCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCattleCount', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByTotalCattleCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCattleCount', Sort.desc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Herd, Herd, QAfterSortBy> thenByUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.desc);
    });
  }
}

extension HerdQueryWhereDistinct on QueryBuilder<Herd, Herd, QDistinct> {
  QueryBuilder<Herd, Herd, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Herd, Herd, QDistinct> distinctByEstadoSync(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoSync', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Herd, Herd, QDistinct> distinctByMunicipio(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Herd, Herd, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Herd, Herd, QDistinct> distinctByOwnerUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Herd, Herd, QDistinct> distinctByServerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Herd, Herd, QDistinct> distinctByTotalCattleCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCattleCount');
    });
  }

  QueryBuilder<Herd, Herd, QDistinct> distinctByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ultimaActualizacion');
    });
  }
}

extension HerdQueryProperty on QueryBuilder<Herd, Herd, QQueryProperty> {
  QueryBuilder<Herd, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Herd, String, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Herd, EstadoSync, QQueryOperations> estadoSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoSync');
    });
  }

  QueryBuilder<Herd, String, QQueryOperations> municipioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipio');
    });
  }

  QueryBuilder<Herd, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Herd, String, QQueryOperations> ownerUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerUid');
    });
  }

  QueryBuilder<Herd, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<Herd, int, QQueryOperations> totalCattleCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCattleCount');
    });
  }

  QueryBuilder<Herd, DateTime?, QQueryOperations>
      ultimaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ultimaActualizacion');
    });
  }
}
