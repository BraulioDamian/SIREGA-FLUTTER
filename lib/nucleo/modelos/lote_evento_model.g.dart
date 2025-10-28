// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lote_evento_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLoteEventoCollection on Isar {
  IsarCollection<LoteEvento> get loteEventos => this.collection();
}

const LoteEventoSchema = CollectionSchema(
  name: r'LoteEvento',
  id: 7062900821285138691,
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
    r'fecha': PropertySchema(
      id: 2,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 3,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'loteId': PropertySchema(
      id: 4,
      name: r'loteId',
      type: IsarType.string,
    ),
    r'nombreProducto': PropertySchema(
      id: 5,
      name: r'nombreProducto',
      type: IsarType.string,
    ),
    r'tipo': PropertySchema(
      id: 6,
      name: r'tipo',
      type: IsarType.string,
      enumMap: _LoteEventotipoEnumValueMap,
    )
  },
  estimateSize: _loteEventoEstimateSize,
  serialize: _loteEventoSerialize,
  deserialize: _loteEventoDeserialize,
  deserializeProp: _loteEventoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _loteEventoGetId,
  getLinks: _loteEventoGetLinks,
  attach: _loteEventoAttach,
  version: '3.1.0+1',
);

int _loteEventoEstimateSize(
  LoteEvento object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.animalesIds.length * 8;
  bytesCount += 3 + object.loteId.length * 3;
  {
    final value = object.nombreProducto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tipo.name.length * 3;
  return bytesCount;
}

void _loteEventoSerialize(
  LoteEvento object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.animalesIds);
  writer.writeLong(offsets[1], object.cantidadAnimales);
  writer.writeDateTime(offsets[2], object.fecha);
  writer.writeDateTime(offsets[3], object.fechaCreacion);
  writer.writeString(offsets[4], object.loteId);
  writer.writeString(offsets[5], object.nombreProducto);
  writer.writeString(offsets[6], object.tipo.name);
}

LoteEvento _loteEventoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LoteEvento();
  object.animalesIds = reader.readLongList(offsets[0]) ?? [];
  object.cantidadAnimales = reader.readLong(offsets[1]);
  object.fecha = reader.readDateTime(offsets[2]);
  object.fechaCreacion = reader.readDateTime(offsets[3]);
  object.id = id;
  object.loteId = reader.readString(offsets[4]);
  object.nombreProducto = reader.readStringOrNull(offsets[5]);
  object.tipo =
      _LoteEventotipoValueEnumMap[reader.readStringOrNull(offsets[6])] ??
          TipoEvento.vacuna;
  return object;
}

P _loteEventoDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (_LoteEventotipoValueEnumMap[reader.readStringOrNull(offset)] ??
          TipoEvento.vacuna) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LoteEventotipoEnumValueMap = {
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
const _LoteEventotipoValueEnumMap = {
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

Id _loteEventoGetId(LoteEvento object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _loteEventoGetLinks(LoteEvento object) {
  return [];
}

void _loteEventoAttach(IsarCollection<dynamic> col, Id id, LoteEvento object) {
  object.id = id;
}

extension LoteEventoQueryWhereSort
    on QueryBuilder<LoteEvento, LoteEvento, QWhere> {
  QueryBuilder<LoteEvento, LoteEvento, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LoteEventoQueryWhere
    on QueryBuilder<LoteEvento, LoteEvento, QWhereClause> {
  QueryBuilder<LoteEvento, LoteEvento, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterWhereClause> idBetween(
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
}

extension LoteEventoQueryFilter
    on QueryBuilder<LoteEvento, LoteEvento, QFilterCondition> {
  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      animalesIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'animalesIds',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      animalesIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'animalesIds',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      animalesIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'animalesIds',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      animalesIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'animalesIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      animalesIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'animalesIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      animalesIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'animalesIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      animalesIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'animalesIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      animalesIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'animalesIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      animalesIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'animalesIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      cantidadAnimalesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cantidadAnimales',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      cantidadAnimalesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cantidadAnimales',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      cantidadAnimalesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cantidadAnimales',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      cantidadAnimalesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cantidadAnimales',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> fechaEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> fechaGreaterThan(
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> fechaLessThan(
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> fechaBetween(
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      fechaCreacionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      fechaCreacionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      fechaCreacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> loteIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> loteIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> loteIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> loteIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> loteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'loteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> loteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'loteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> loteIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'loteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> loteIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'loteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> loteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      loteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'loteId',
        value: '',
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombreProducto',
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombreProducto',
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreProducto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreProducto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition>
      nombreProductoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoEqualTo(
    TipoEvento value, {
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoGreaterThan(
    TipoEvento value, {
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoLessThan(
    TipoEvento value, {
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoBetween(
    TipoEvento lower,
    TipoEvento upper, {
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoStartsWith(
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoEndsWith(
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

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterFilterCondition> tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }
}

extension LoteEventoQueryObject
    on QueryBuilder<LoteEvento, LoteEvento, QFilterCondition> {}

extension LoteEventoQueryLinks
    on QueryBuilder<LoteEvento, LoteEvento, QFilterCondition> {}

extension LoteEventoQuerySortBy
    on QueryBuilder<LoteEvento, LoteEvento, QSortBy> {
  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByCantidadAnimales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadAnimales', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy>
      sortByCantidadAnimalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadAnimales', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByLoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByLoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByNombreProducto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy>
      sortByNombreProductoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension LoteEventoQuerySortThenBy
    on QueryBuilder<LoteEvento, LoteEvento, QSortThenBy> {
  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByCantidadAnimales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadAnimales', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy>
      thenByCantidadAnimalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cantidadAnimales', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByLoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByLoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByNombreProducto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy>
      thenByNombreProductoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.desc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension LoteEventoQueryWhereDistinct
    on QueryBuilder<LoteEvento, LoteEvento, QDistinct> {
  QueryBuilder<LoteEvento, LoteEvento, QDistinct> distinctByAnimalesIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'animalesIds');
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QDistinct> distinctByCantidadAnimales() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cantidadAnimales');
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QDistinct> distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QDistinct> distinctByLoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QDistinct> distinctByNombreProducto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreProducto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LoteEvento, LoteEvento, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension LoteEventoQueryProperty
    on QueryBuilder<LoteEvento, LoteEvento, QQueryProperty> {
  QueryBuilder<LoteEvento, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LoteEvento, List<int>, QQueryOperations> animalesIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'animalesIds');
    });
  }

  QueryBuilder<LoteEvento, int, QQueryOperations> cantidadAnimalesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cantidadAnimales');
    });
  }

  QueryBuilder<LoteEvento, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<LoteEvento, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<LoteEvento, String, QQueryOperations> loteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loteId');
    });
  }

  QueryBuilder<LoteEvento, String?, QQueryOperations> nombreProductoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreProducto');
    });
  }

  QueryBuilder<LoteEvento, TipoEvento, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}
