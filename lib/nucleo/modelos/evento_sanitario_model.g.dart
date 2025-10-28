// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evento_sanitario_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEventoSanitarioCollection on Isar {
  IsarCollection<EventoSanitario> get eventoSanitarios => this.collection();
}

const EventoSanitarioSchema = CollectionSchema(
  name: r'EventoSanitario',
  id: -1364545029248129044,
  properties: {
    r'dosis': PropertySchema(
      id: 0,
      name: r'dosis',
      type: IsarType.double,
    ),
    r'fecha': PropertySchema(
      id: 1,
      name: r'fecha',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 2,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaProximaAplicacion': PropertySchema(
      id: 3,
      name: r'fechaProximaAplicacion',
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
    r'notas': PropertySchema(
      id: 6,
      name: r'notas',
      type: IsarType.string,
    ),
    r'prioridad': PropertySchema(
      id: 7,
      name: r'prioridad',
      type: IsarType.string,
      enumMap: _EventoSanitarioprioridadEnumValueMap,
    ),
    r'serverId': PropertySchema(
      id: 8,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'tipo': PropertySchema(
      id: 9,
      name: r'tipo',
      type: IsarType.string,
      enumMap: _EventoSanitariotipoEnumValueMap,
    ),
    r'totalAnimalesLote': PropertySchema(
      id: 10,
      name: r'totalAnimalesLote',
      type: IsarType.long,
    ),
    r'ultimaActualizacion': PropertySchema(
      id: 11,
      name: r'ultimaActualizacion',
      type: IsarType.dateTime,
    ),
    r'unidadDosis': PropertySchema(
      id: 12,
      name: r'unidadDosis',
      type: IsarType.string,
    ),
    r'veterinario': PropertySchema(
      id: 13,
      name: r'veterinario',
      type: IsarType.string,
    )
  },
  estimateSize: _eventoSanitarioEstimateSize,
  serialize: _eventoSanitarioSerialize,
  deserialize: _eventoSanitarioDeserialize,
  deserializeProp: _eventoSanitarioDeserializeProp,
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
      id: 980050261165887356,
      name: r'animal',
      target: r'Animal',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _eventoSanitarioGetId,
  getLinks: _eventoSanitarioGetLinks,
  attach: _eventoSanitarioAttach,
  version: '3.1.0+1',
);

int _eventoSanitarioEstimateSize(
  EventoSanitario object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.loteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nombreProducto;
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
  bytesCount += 3 + object.prioridad.name.length * 3;
  {
    final value = object.serverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tipo.name.length * 3;
  {
    final value = object.unidadDosis;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.veterinario;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _eventoSanitarioSerialize(
  EventoSanitario object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.dosis);
  writer.writeDateTime(offsets[1], object.fecha);
  writer.writeDateTime(offsets[2], object.fechaCreacion);
  writer.writeDateTime(offsets[3], object.fechaProximaAplicacion);
  writer.writeString(offsets[4], object.loteId);
  writer.writeString(offsets[5], object.nombreProducto);
  writer.writeString(offsets[6], object.notas);
  writer.writeString(offsets[7], object.prioridad.name);
  writer.writeString(offsets[8], object.serverId);
  writer.writeString(offsets[9], object.tipo.name);
  writer.writeLong(offsets[10], object.totalAnimalesLote);
  writer.writeDateTime(offsets[11], object.ultimaActualizacion);
  writer.writeString(offsets[12], object.unidadDosis);
  writer.writeString(offsets[13], object.veterinario);
}

EventoSanitario _eventoSanitarioDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EventoSanitario();
  object.dosis = reader.readDoubleOrNull(offsets[0]);
  object.fecha = reader.readDateTime(offsets[1]);
  object.fechaCreacion = reader.readDateTime(offsets[2]);
  object.fechaProximaAplicacion = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.loteId = reader.readStringOrNull(offsets[4]);
  object.nombreProducto = reader.readStringOrNull(offsets[5]);
  object.notas = reader.readStringOrNull(offsets[6]);
  object.prioridad = _EventoSanitarioprioridadValueEnumMap[
          reader.readStringOrNull(offsets[7])] ??
      Prioridad.baja;
  object.serverId = reader.readStringOrNull(offsets[8]);
  object.tipo =
      _EventoSanitariotipoValueEnumMap[reader.readStringOrNull(offsets[9])] ??
          TipoEvento.vacuna;
  object.totalAnimalesLote = reader.readLongOrNull(offsets[10]);
  object.ultimaActualizacion = reader.readDateTimeOrNull(offsets[11]);
  object.unidadDosis = reader.readStringOrNull(offsets[12]);
  object.veterinario = reader.readStringOrNull(offsets[13]);
  return object;
}

P _eventoSanitarioDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_EventoSanitarioprioridadValueEnumMap[
              reader.readStringOrNull(offset)] ??
          Prioridad.baja) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (_EventoSanitariotipoValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TipoEvento.vacuna) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EventoSanitarioprioridadEnumValueMap = {
  r'baja': r'baja',
  r'media': r'media',
  r'alta': r'alta',
  r'critica': r'critica',
  r'urgente': r'urgente',
};
const _EventoSanitarioprioridadValueEnumMap = {
  r'baja': Prioridad.baja,
  r'media': Prioridad.media,
  r'alta': Prioridad.alta,
  r'critica': Prioridad.critica,
  r'urgente': Prioridad.urgente,
};
const _EventoSanitariotipoEnumValueMap = {
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
const _EventoSanitariotipoValueEnumMap = {
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

Id _eventoSanitarioGetId(EventoSanitario object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _eventoSanitarioGetLinks(EventoSanitario object) {
  return [object.animal];
}

void _eventoSanitarioAttach(
    IsarCollection<dynamic> col, Id id, EventoSanitario object) {
  object.id = id;
  object.animal.attach(col, col.isar.collection<Animal>(), r'animal', id);
}

extension EventoSanitarioQueryWhereSort
    on QueryBuilder<EventoSanitario, EventoSanitario, QWhere> {
  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EventoSanitarioQueryWhere
    on QueryBuilder<EventoSanitario, EventoSanitario, QWhereClause> {
  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhereClause>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhereClause> idBetween(
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhereClause>
      serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [null],
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhereClause>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhereClause>
      serverIdEqualTo(String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [serverId],
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterWhereClause>
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

extension EventoSanitarioQueryFilter
    on QueryBuilder<EventoSanitario, EventoSanitario, QFilterCondition> {
  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      dosisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dosis',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      dosisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dosis',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      dosisEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosis',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      dosisGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosis',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      dosisLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosis',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      dosisBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      fechaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      fechaProximaAplicacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaProximaAplicacion',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      fechaProximaAplicacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaProximaAplicacion',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      fechaProximaAplicacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaProximaAplicacion',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      fechaProximaAplicacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaProximaAplicacion',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      fechaProximaAplicacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaProximaAplicacion',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      fechaProximaAplicacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaProximaAplicacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'loteId',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'loteId',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdEqualTo(
    String? value, {
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdGreaterThan(
    String? value, {
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdLessThan(
    String? value, {
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdStartsWith(
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdEndsWith(
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'loteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'loteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loteId',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      loteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'loteId',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      nombreProductoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombreProducto',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      nombreProductoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombreProducto',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      nombreProductoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreProducto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      nombreProductoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreProducto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      nombreProductoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      nombreProductoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreProducto',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      notasContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      notasMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadEqualTo(
    Prioridad value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadGreaterThan(
    Prioridad value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadLessThan(
    Prioridad value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadBetween(
    Prioridad lower,
    Prioridad upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prioridad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prioridad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioridad',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      prioridadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prioridad',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      serverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      serverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      tipoEqualTo(
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      tipoGreaterThan(
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      tipoLessThan(
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      tipoBetween(
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      totalAnimalesLoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAnimalesLote',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      totalAnimalesLoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAnimalesLote',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      totalAnimalesLoteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAnimalesLote',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      totalAnimalesLoteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAnimalesLote',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      totalAnimalesLoteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAnimalesLote',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      totalAnimalesLoteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAnimalesLote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      ultimaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ultimaActualizacion',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      ultimaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ultimaActualizacion',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      ultimaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ultimaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
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

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unidadDosis',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unidadDosis',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidadDosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unidadDosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unidadDosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unidadDosis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unidadDosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unidadDosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unidadDosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unidadDosis',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidadDosis',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      unidadDosisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unidadDosis',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'veterinario',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'veterinario',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'veterinario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'veterinario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'veterinario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'veterinario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'veterinario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'veterinario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'veterinario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'veterinario',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'veterinario',
        value: '',
      ));
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      veterinarioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'veterinario',
        value: '',
      ));
    });
  }
}

extension EventoSanitarioQueryObject
    on QueryBuilder<EventoSanitario, EventoSanitario, QFilterCondition> {}

extension EventoSanitarioQueryLinks
    on QueryBuilder<EventoSanitario, EventoSanitario, QFilterCondition> {
  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition> animal(
      FilterQuery<Animal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'animal');
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterFilterCondition>
      animalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animal', 0, true, 0, true);
    });
  }
}

extension EventoSanitarioQuerySortBy
    on QueryBuilder<EventoSanitario, EventoSanitario, QSortBy> {
  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> sortByDosis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosis', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByDosisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosis', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByFechaProximaAplicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximaAplicacion', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByFechaProximaAplicacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximaAplicacion', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> sortByLoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByLoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByNombreProducto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByNombreProductoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByTotalAnimalesLote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAnimalesLote', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByTotalAnimalesLoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAnimalesLote', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByUnidadDosis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidadDosis', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByUnidadDosisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidadDosis', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByVeterinario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinario', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      sortByVeterinarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinario', Sort.desc);
    });
  }
}

extension EventoSanitarioQuerySortThenBy
    on QueryBuilder<EventoSanitario, EventoSanitario, QSortThenBy> {
  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> thenByDosis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosis', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByDosisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosis', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByFechaProximaAplicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximaAplicacion', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByFechaProximaAplicacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximaAplicacion', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> thenByLoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByLoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteId', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByNombreProducto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByNombreProductoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreProducto', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByTotalAnimalesLote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAnimalesLote', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByTotalAnimalesLoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAnimalesLote', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByUnidadDosis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidadDosis', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByUnidadDosisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidadDosis', Sort.desc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByVeterinario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinario', Sort.asc);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QAfterSortBy>
      thenByVeterinarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinario', Sort.desc);
    });
  }
}

extension EventoSanitarioQueryWhereDistinct
    on QueryBuilder<EventoSanitario, EventoSanitario, QDistinct> {
  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct> distinctByDosis() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosis');
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct> distinctByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha');
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct>
      distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct>
      distinctByFechaProximaAplicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaProximaAplicacion');
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct> distinctByLoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct>
      distinctByNombreProducto({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreProducto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct> distinctByNotas(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct> distinctByPrioridad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prioridad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct> distinctByServerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct>
      distinctByTotalAnimalesLote() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAnimalesLote');
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct>
      distinctByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ultimaActualizacion');
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct>
      distinctByUnidadDosis({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unidadDosis', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventoSanitario, EventoSanitario, QDistinct>
      distinctByVeterinario({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'veterinario', caseSensitive: caseSensitive);
    });
  }
}

extension EventoSanitarioQueryProperty
    on QueryBuilder<EventoSanitario, EventoSanitario, QQueryProperty> {
  QueryBuilder<EventoSanitario, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EventoSanitario, double?, QQueryOperations> dosisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosis');
    });
  }

  QueryBuilder<EventoSanitario, DateTime, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<EventoSanitario, DateTime, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<EventoSanitario, DateTime?, QQueryOperations>
      fechaProximaAplicacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaProximaAplicacion');
    });
  }

  QueryBuilder<EventoSanitario, String?, QQueryOperations> loteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loteId');
    });
  }

  QueryBuilder<EventoSanitario, String?, QQueryOperations>
      nombreProductoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreProducto');
    });
  }

  QueryBuilder<EventoSanitario, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<EventoSanitario, Prioridad, QQueryOperations>
      prioridadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prioridad');
    });
  }

  QueryBuilder<EventoSanitario, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<EventoSanitario, TipoEvento, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<EventoSanitario, int?, QQueryOperations>
      totalAnimalesLoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAnimalesLote');
    });
  }

  QueryBuilder<EventoSanitario, DateTime?, QQueryOperations>
      ultimaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ultimaActualizacion');
    });
  }

  QueryBuilder<EventoSanitario, String?, QQueryOperations>
      unidadDosisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unidadDosis');
    });
  }

  QueryBuilder<EventoSanitario, String?, QQueryOperations>
      veterinarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'veterinario');
    });
  }
}
