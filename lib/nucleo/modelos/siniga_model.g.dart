// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siniga_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SinigaIdSchema = Schema(
  name: r'SinigaId',
  id: -4821314872855555978,
  properties: {
    r'esValidoBasico': PropertySchema(
      id: 0,
      name: r'esValidoBasico',
      type: IsarType.bool,
    ),
    r'especie': PropertySchema(
      id: 1,
      name: r'especie',
      type: IsarType.string,
    ),
    r'estadoClave': PropertySchema(
      id: 2,
      name: r'estadoClave',
      type: IsarType.string,
    ),
    r'formatoVisual': PropertySchema(
      id: 3,
      name: r'formatoVisual',
      type: IsarType.string,
    ),
    r'fullId': PropertySchema(
      id: 4,
      name: r'fullId',
      type: IsarType.string,
    ),
    r'nombreEstadoSync': PropertySchema(
      id: 5,
      name: r'nombreEstadoSync',
      type: IsarType.string,
    ),
    r'numeroNacional': PropertySchema(
      id: 6,
      name: r'numeroNacional',
      type: IsarType.string,
    )
  },
  estimateSize: _sinigaIdEstimateSize,
  serialize: _sinigaIdSerialize,
  deserialize: _sinigaIdDeserialize,
  deserializeProp: _sinigaIdDeserializeProp,
);

int _sinigaIdEstimateSize(
  SinigaId object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.especie;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.estadoClave;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.formatoVisual.length * 3;
  bytesCount += 3 + object.fullId.length * 3;
  {
    final value = object.nombreEstadoSync;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroNacional;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sinigaIdSerialize(
  SinigaId object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.esValidoBasico);
  writer.writeString(offsets[1], object.especie);
  writer.writeString(offsets[2], object.estadoClave);
  writer.writeString(offsets[3], object.formatoVisual);
  writer.writeString(offsets[4], object.fullId);
  writer.writeString(offsets[5], object.nombreEstadoSync);
  writer.writeString(offsets[6], object.numeroNacional);
}

SinigaId _sinigaIdDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SinigaId(
    especie: reader.readStringOrNull(offsets[1]),
    estadoClave: reader.readStringOrNull(offsets[2]),
    numeroNacional: reader.readStringOrNull(offsets[6]),
  );
  return object;
}

P _sinigaIdDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SinigaIdQueryFilter
    on QueryBuilder<SinigaId, SinigaId, QFilterCondition> {
  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> esValidoBasicoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esValidoBasico',
        value: value,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'especie',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'especie',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'especie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'especie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'especie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'especie',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'especie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'especie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'especie',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'especie',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'especie',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> especieIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'especie',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> estadoClaveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estadoClave',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      estadoClaveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estadoClave',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> estadoClaveEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoClave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      estadoClaveGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoClave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> estadoClaveLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoClave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> estadoClaveBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoClave',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> estadoClaveStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoClave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> estadoClaveEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoClave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> estadoClaveContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoClave',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> estadoClaveMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoClave',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> estadoClaveIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoClave',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      estadoClaveIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoClave',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> formatoVisualEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formatoVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      formatoVisualGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formatoVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> formatoVisualLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formatoVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> formatoVisualBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formatoVisual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      formatoVisualStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formatoVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> formatoVisualEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formatoVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> formatoVisualContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formatoVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> formatoVisualMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formatoVisual',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      formatoVisualIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formatoVisual',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      formatoVisualIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formatoVisual',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullId',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> fullIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullId',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombreEstadoSync',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombreEstadoSync',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreEstadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreEstadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreEstadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreEstadoSync',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreEstadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreEstadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreEstadoSync',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreEstadoSync',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreEstadoSync',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      nombreEstadoSyncIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreEstadoSync',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      numeroNacionalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroNacional',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      numeroNacionalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroNacional',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> numeroNacionalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroNacional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      numeroNacionalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroNacional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      numeroNacionalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroNacional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> numeroNacionalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroNacional',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      numeroNacionalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroNacional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      numeroNacionalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroNacional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      numeroNacionalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroNacional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition> numeroNacionalMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroNacional',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      numeroNacionalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroNacional',
        value: '',
      ));
    });
  }

  QueryBuilder<SinigaId, SinigaId, QAfterFilterCondition>
      numeroNacionalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroNacional',
        value: '',
      ));
    });
  }
}

extension SinigaIdQueryObject
    on QueryBuilder<SinigaId, SinigaId, QFilterCondition> {}
