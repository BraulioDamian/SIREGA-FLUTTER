// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_product_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCatalogProductCollection on Isar {
  IsarCollection<CatalogProduct> get catalogProducts => this.collection();
}

const CatalogProductSchema = CollectionSchema(
  name: r'CatalogProduct',
  id: 6459001474798068021,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'esDeSistema': PropertySchema(
      id: 1,
      name: r'esDeSistema',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(id: 2, name: r'name', type: IsarType.string),
    r'tipo': PropertySchema(
      id: 3,
      name: r'tipo',
      type: IsarType.string,
      enumMap: _CatalogProducttipoEnumValueMap,
    ),
  },
  estimateSize: _catalogProductEstimateSize,
  serialize: _catalogProductSerialize,
  deserialize: _catalogProductDeserialize,
  deserializeProp: _catalogProductDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _catalogProductGetId,
  getLinks: _catalogProductGetLinks,
  attach: _catalogProductAttach,
  version: '3.1.0+1',
);

int _catalogProductEstimateSize(
  CatalogProduct object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.tipo.name.length * 3;
  return bytesCount;
}

void _catalogProductSerialize(
  CatalogProduct object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeBool(offsets[1], object.esDeSistema);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.tipo.name);
}

CatalogProduct _catalogProductDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CatalogProduct();
  object.description = reader.readStringOrNull(offsets[0]);
  object.esDeSistema = reader.readBool(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[2]);
  object.tipo =
      _CatalogProducttipoValueEnumMap[reader.readStringOrNull(offsets[3])] ??
      TipoEvento.vacuna;
  return object;
}

P _catalogProductDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_CatalogProducttipoValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              TipoEvento.vacuna)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CatalogProducttipoEnumValueMap = {
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
const _CatalogProducttipoValueEnumMap = {
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

Id _catalogProductGetId(CatalogProduct object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _catalogProductGetLinks(CatalogProduct object) {
  return [];
}

void _catalogProductAttach(
  IsarCollection<dynamic> col,
  Id id,
  CatalogProduct object,
) {
  object.id = id;
}

extension CatalogProductQueryWhereSort
    on QueryBuilder<CatalogProduct, CatalogProduct, QWhere> {
  QueryBuilder<CatalogProduct, CatalogProduct, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CatalogProductQueryWhere
    on QueryBuilder<CatalogProduct, CatalogProduct, QWhereClause> {
  QueryBuilder<CatalogProduct, CatalogProduct, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterWhereClause> idBetween(
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
}

extension CatalogProductQueryFilter
    on QueryBuilder<CatalogProduct, CatalogProduct, QFilterCondition> {
  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  esDeSistemaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'esDeSistema', value: value),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameGreaterThan(
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameLessThan(
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameBetween(
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
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

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tipo', value: ''),
      );
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterFilterCondition>
  tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tipo', value: ''),
      );
    });
  }
}

extension CatalogProductQueryObject
    on QueryBuilder<CatalogProduct, CatalogProduct, QFilterCondition> {}

extension CatalogProductQueryLinks
    on QueryBuilder<CatalogProduct, CatalogProduct, QFilterCondition> {}

extension CatalogProductQuerySortBy
    on QueryBuilder<CatalogProduct, CatalogProduct, QSortBy> {
  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy>
  sortByEsDeSistema() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeSistema', Sort.asc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy>
  sortByEsDeSistemaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeSistema', Sort.desc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension CatalogProductQuerySortThenBy
    on QueryBuilder<CatalogProduct, CatalogProduct, QSortThenBy> {
  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy>
  thenByEsDeSistema() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeSistema', Sort.asc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy>
  thenByEsDeSistemaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esDeSistema', Sort.desc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension CatalogProductQueryWhereDistinct
    on QueryBuilder<CatalogProduct, CatalogProduct, QDistinct> {
  QueryBuilder<CatalogProduct, CatalogProduct, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QDistinct>
  distinctByEsDeSistema() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esDeSistema');
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CatalogProduct, CatalogProduct, QDistinct> distinctByTipo({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension CatalogProductQueryProperty
    on QueryBuilder<CatalogProduct, CatalogProduct, QQueryProperty> {
  QueryBuilder<CatalogProduct, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CatalogProduct, String?, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CatalogProduct, bool, QQueryOperations> esDeSistemaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esDeSistema');
    });
  }

  QueryBuilder<CatalogProduct, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CatalogProduct, TipoEvento, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}
