// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_queue.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncQueueCollection on Isar {
  IsarCollection<SyncQueue> get syncQueues => this.collection();
}

const SyncQueueSchema = CollectionSchema(
  name: r'SyncQueue',
  id: -1008958056975989282,
  properties: {
    r'datosJson': PropertySchema(
      id: 0,
      name: r'datosJson',
      type: IsarType.string,
    ),
    r'dispositivoOrigen': PropertySchema(
      id: 1,
      name: r'dispositivoOrigen',
      type: IsarType.string,
    ),
    r'entidad': PropertySchema(
      id: 2,
      name: r'entidad',
      type: IsarType.string,
      enumMap: _SyncQueueentidadEnumValueMap,
    ),
    r'entidadId': PropertySchema(
      id: 3,
      name: r'entidadId',
      type: IsarType.long,
    ),
    r'estado': PropertySchema(
      id: 4,
      name: r'estado',
      type: IsarType.string,
      enumMap: _SyncQueueestadoEnumValueMap,
    ),
    r'fechaCreacion': PropertySchema(
      id: 5,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaUltimoIntento': PropertySchema(
      id: 6,
      name: r'fechaUltimoIntento',
      type: IsarType.dateTime,
    ),
    r'hashOriginal': PropertySchema(
      id: 7,
      name: r'hashOriginal',
      type: IsarType.string,
    ),
    r'intentos': PropertySchema(
      id: 8,
      name: r'intentos',
      type: IsarType.long,
    ),
    r'maxIntentos': PropertySchema(
      id: 9,
      name: r'maxIntentos',
      type: IsarType.long,
    ),
    r'mensajeError': PropertySchema(
      id: 10,
      name: r'mensajeError',
      type: IsarType.string,
    ),
    r'operacion': PropertySchema(
      id: 11,
      name: r'operacion',
      type: IsarType.string,
      enumMap: _SyncQueueoperacionEnumValueMap,
    ),
    r'prioridad': PropertySchema(
      id: 12,
      name: r'prioridad',
      type: IsarType.long,
    ),
    r'stackTrace': PropertySchema(
      id: 13,
      name: r'stackTrace',
      type: IsarType.string,
    ),
    r'tiempoEsperaSegundos': PropertySchema(
      id: 14,
      name: r'tiempoEsperaSegundos',
      type: IsarType.long,
    ),
    r'usuarioId': PropertySchema(
      id: 15,
      name: r'usuarioId',
      type: IsarType.string,
    ),
    r'versionOriginal': PropertySchema(
      id: 16,
      name: r'versionOriginal',
      type: IsarType.long,
    )
  },
  estimateSize: _syncQueueEstimateSize,
  serialize: _syncQueueSerialize,
  deserialize: _syncQueueDeserialize,
  deserializeProp: _syncQueueDeserializeProp,
  idName: r'id',
  indexes: {
    r'prioridad': IndexSchema(
      id: 8505763141741948367,
      name: r'prioridad',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'prioridad',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncQueueGetId,
  getLinks: _syncQueueGetLinks,
  attach: _syncQueueAttach,
  version: '3.1.0+1',
);

int _syncQueueEstimateSize(
  SyncQueue object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.datosJson.length * 3;
  {
    final value = object.dispositivoOrigen;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.entidad.name.length * 3;
  bytesCount += 3 + object.estado.name.length * 3;
  {
    final value = object.hashOriginal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mensajeError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.operacion.name.length * 3;
  {
    final value = object.stackTrace;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.usuarioId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _syncQueueSerialize(
  SyncQueue object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.datosJson);
  writer.writeString(offsets[1], object.dispositivoOrigen);
  writer.writeString(offsets[2], object.entidad.name);
  writer.writeLong(offsets[3], object.entidadId);
  writer.writeString(offsets[4], object.estado.name);
  writer.writeDateTime(offsets[5], object.fechaCreacion);
  writer.writeDateTime(offsets[6], object.fechaUltimoIntento);
  writer.writeString(offsets[7], object.hashOriginal);
  writer.writeLong(offsets[8], object.intentos);
  writer.writeLong(offsets[9], object.maxIntentos);
  writer.writeString(offsets[10], object.mensajeError);
  writer.writeString(offsets[11], object.operacion.name);
  writer.writeLong(offsets[12], object.prioridad);
  writer.writeString(offsets[13], object.stackTrace);
  writer.writeLong(offsets[14], object.tiempoEsperaSegundos);
  writer.writeString(offsets[15], object.usuarioId);
  writer.writeLong(offsets[16], object.versionOriginal);
}

SyncQueue _syncQueueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncQueue();
  object.datosJson = reader.readString(offsets[0]);
  object.dispositivoOrigen = reader.readStringOrNull(offsets[1]);
  object.entidad =
      _SyncQueueentidadValueEnumMap[reader.readStringOrNull(offsets[2])] ??
          TipoEntidad.animal;
  object.entidadId = reader.readLong(offsets[3]);
  object.estado =
      _SyncQueueestadoValueEnumMap[reader.readStringOrNull(offsets[4])] ??
          EstadoSync.pendiente;
  object.fechaCreacion = reader.readDateTime(offsets[5]);
  object.fechaUltimoIntento = reader.readDateTimeOrNull(offsets[6]);
  object.hashOriginal = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.intentos = reader.readLong(offsets[8]);
  object.maxIntentos = reader.readLong(offsets[9]);
  object.mensajeError = reader.readStringOrNull(offsets[10]);
  object.operacion =
      _SyncQueueoperacionValueEnumMap[reader.readStringOrNull(offsets[11])] ??
          TipoOperacion.crear;
  object.prioridad = reader.readLong(offsets[12]);
  object.stackTrace = reader.readStringOrNull(offsets[13]);
  object.tiempoEsperaSegundos = reader.readLong(offsets[14]);
  object.usuarioId = reader.readStringOrNull(offsets[15]);
  object.versionOriginal = reader.readLongOrNull(offsets[16]);
  return object;
}

P _syncQueueDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (_SyncQueueentidadValueEnumMap[reader.readStringOrNull(offset)] ??
          TipoEntidad.animal) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (_SyncQueueestadoValueEnumMap[reader.readStringOrNull(offset)] ??
          EstadoSync.pendiente) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_SyncQueueoperacionValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TipoOperacion.crear) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SyncQueueentidadEnumValueMap = {
  r'animal': r'animal',
  r'evento': r'evento',
  r'produccion': r'produccion',
  r'herd': r'herd',
  r'alerta': r'alerta',
  r'configuracion': r'configuracion',
  r'usuario': r'usuario',
};
const _SyncQueueentidadValueEnumMap = {
  r'animal': TipoEntidad.animal,
  r'evento': TipoEntidad.evento,
  r'produccion': TipoEntidad.produccion,
  r'herd': TipoEntidad.herd,
  r'alerta': TipoEntidad.alerta,
  r'configuracion': TipoEntidad.configuracion,
  r'usuario': TipoEntidad.usuario,
};
const _SyncQueueestadoEnumValueMap = {
  r'pendiente': r'pendiente',
  r'enProceso': r'enProceso',
  r'completado': r'completado',
  r'error': r'error',
  r'conflicto': r'conflicto',
  r'cancelado': r'cancelado',
};
const _SyncQueueestadoValueEnumMap = {
  r'pendiente': EstadoSync.pendiente,
  r'enProceso': EstadoSync.enProceso,
  r'completado': EstadoSync.completado,
  r'error': EstadoSync.error,
  r'conflicto': EstadoSync.conflicto,
  r'cancelado': EstadoSync.cancelado,
};
const _SyncQueueoperacionEnumValueMap = {
  r'crear': r'crear',
  r'actualizar': r'actualizar',
  r'eliminar': r'eliminar',
  r'sincronizar': r'sincronizar',
};
const _SyncQueueoperacionValueEnumMap = {
  r'crear': TipoOperacion.crear,
  r'actualizar': TipoOperacion.actualizar,
  r'eliminar': TipoOperacion.eliminar,
  r'sincronizar': TipoOperacion.sincronizar,
};

Id _syncQueueGetId(SyncQueue object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncQueueGetLinks(SyncQueue object) {
  return [];
}

void _syncQueueAttach(IsarCollection<dynamic> col, Id id, SyncQueue object) {
  object.id = id;
}

extension SyncQueueQueryWhereSort
    on QueryBuilder<SyncQueue, SyncQueue, QWhere> {
  QueryBuilder<SyncQueue, SyncQueue, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhere> anyPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'prioridad'),
      );
    });
  }
}

extension SyncQueueQueryWhere
    on QueryBuilder<SyncQueue, SyncQueue, QWhereClause> {
  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> idBetween(
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> prioridadEqualTo(
      int prioridad) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'prioridad',
        value: [prioridad],
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> prioridadNotEqualTo(
      int prioridad) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prioridad',
              lower: [],
              upper: [prioridad],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prioridad',
              lower: [prioridad],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prioridad',
              lower: [prioridad],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prioridad',
              lower: [],
              upper: [prioridad],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> prioridadGreaterThan(
    int prioridad, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'prioridad',
        lower: [prioridad],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> prioridadLessThan(
    int prioridad, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'prioridad',
        lower: [],
        upper: [prioridad],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterWhereClause> prioridadBetween(
    int lowerPrioridad,
    int upperPrioridad, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'prioridad',
        lower: [lowerPrioridad],
        includeLower: includeLower,
        upper: [upperPrioridad],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SyncQueueQueryFilter
    on QueryBuilder<SyncQueue, SyncQueue, QFilterCondition> {
  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> datosJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      datosJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'datosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> datosJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'datosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> datosJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'datosJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> datosJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'datosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> datosJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'datosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> datosJsonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'datosJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> datosJsonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'datosJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> datosJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datosJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      datosJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'datosJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dispositivoOrigen',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dispositivoOrigen',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dispositivoOrigen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dispositivoOrigen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dispositivoOrigen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dispositivoOrigen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dispositivoOrigen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dispositivoOrigen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dispositivoOrigen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dispositivoOrigen',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dispositivoOrigen',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      dispositivoOrigenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dispositivoOrigen',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadEqualTo(
    TipoEntidad value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadGreaterThan(
    TipoEntidad value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadLessThan(
    TipoEntidad value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadBetween(
    TipoEntidad lower,
    TipoEntidad upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entidad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entidad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entidad',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      entidadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entidad',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entidadId',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      entidadIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entidadId',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entidadId',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> entidadIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entidadId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoEqualTo(
    EstadoSync value, {
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoGreaterThan(
    EstadoSync value, {
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoLessThan(
    EstadoSync value, {
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoBetween(
    EstadoSync lower,
    EstadoSync upper, {
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoStartsWith(
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoEndsWith(
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      fechaUltimoIntentoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaUltimoIntento',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      fechaUltimoIntentoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaUltimoIntento',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      fechaUltimoIntentoEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaUltimoIntento',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      fechaUltimoIntentoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaUltimoIntento',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      fechaUltimoIntentoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaUltimoIntento',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      fechaUltimoIntentoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaUltimoIntento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      hashOriginalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hashOriginal',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      hashOriginalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hashOriginal',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> hashOriginalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashOriginal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      hashOriginalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashOriginal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      hashOriginalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashOriginal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> hashOriginalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashOriginal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      hashOriginalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hashOriginal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      hashOriginalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hashOriginal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      hashOriginalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hashOriginal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> hashOriginalMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hashOriginal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      hashOriginalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashOriginal',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      hashOriginalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hashOriginal',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> intentosEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intentos',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> intentosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intentos',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> intentosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intentos',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> intentosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intentos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> maxIntentosEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxIntentos',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      maxIntentosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxIntentos',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> maxIntentosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxIntentos',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> maxIntentosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxIntentos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      mensajeErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mensajeError',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      mensajeErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mensajeError',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> mensajeErrorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mensajeError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      mensajeErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mensajeError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      mensajeErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mensajeError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> mensajeErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mensajeError',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      mensajeErrorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mensajeError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      mensajeErrorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mensajeError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      mensajeErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mensajeError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> mensajeErrorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mensajeError',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      mensajeErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mensajeError',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      mensajeErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mensajeError',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> operacionEqualTo(
    TipoOperacion value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      operacionGreaterThan(
    TipoOperacion value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'operacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> operacionLessThan(
    TipoOperacion value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'operacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> operacionBetween(
    TipoOperacion lower,
    TipoOperacion upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'operacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> operacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'operacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> operacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'operacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> operacionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'operacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> operacionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'operacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> operacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operacion',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      operacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operacion',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> prioridadEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioridad',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      prioridadGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prioridad',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> prioridadLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prioridad',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> prioridadBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prioridad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> stackTraceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stackTrace',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      stackTraceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stackTrace',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> stackTraceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stackTrace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      stackTraceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stackTrace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> stackTraceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stackTrace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> stackTraceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stackTrace',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      stackTraceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stackTrace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> stackTraceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stackTrace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> stackTraceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stackTrace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> stackTraceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stackTrace',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      stackTraceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stackTrace',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      stackTraceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stackTrace',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      tiempoEsperaSegundosEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tiempoEsperaSegundos',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      tiempoEsperaSegundosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tiempoEsperaSegundos',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      tiempoEsperaSegundosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tiempoEsperaSegundos',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      tiempoEsperaSegundosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tiempoEsperaSegundos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> usuarioIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usuarioId',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      usuarioIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usuarioId',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> usuarioIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      usuarioIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> usuarioIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> usuarioIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> usuarioIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> usuarioIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> usuarioIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usuarioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> usuarioIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usuarioId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition> usuarioIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioId',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      usuarioIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usuarioId',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      versionOriginalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionOriginal',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      versionOriginalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionOriginal',
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      versionOriginalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'versionOriginal',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      versionOriginalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'versionOriginal',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      versionOriginalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'versionOriginal',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterFilterCondition>
      versionOriginalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'versionOriginal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SyncQueueQueryObject
    on QueryBuilder<SyncQueue, SyncQueue, QFilterCondition> {}

extension SyncQueueQueryLinks
    on QueryBuilder<SyncQueue, SyncQueue, QFilterCondition> {}

extension SyncQueueQuerySortBy on QueryBuilder<SyncQueue, SyncQueue, QSortBy> {
  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByDatosJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datosJson', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByDatosJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datosJson', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByDispositivoOrigen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dispositivoOrigen', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy>
      sortByDispositivoOrigenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dispositivoOrigen', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByEntidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entidad', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByEntidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entidad', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByEntidadId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entidadId', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByEntidadIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entidadId', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByFechaUltimoIntento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoIntento', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy>
      sortByFechaUltimoIntentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoIntento', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByHashOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashOriginal', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByHashOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashOriginal', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByIntentos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intentos', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByIntentosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intentos', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByMaxIntentos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxIntentos', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByMaxIntentosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxIntentos', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByMensajeError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeError', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByMensajeErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeError', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByOperacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operacion', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByOperacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operacion', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByStackTrace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stackTrace', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByStackTraceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stackTrace', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy>
      sortByTiempoEsperaSegundos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tiempoEsperaSegundos', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy>
      sortByTiempoEsperaSegundosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tiempoEsperaSegundos', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByVersionOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionOriginal', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> sortByVersionOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionOriginal', Sort.desc);
    });
  }
}

extension SyncQueueQuerySortThenBy
    on QueryBuilder<SyncQueue, SyncQueue, QSortThenBy> {
  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByDatosJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datosJson', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByDatosJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datosJson', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByDispositivoOrigen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dispositivoOrigen', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy>
      thenByDispositivoOrigenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dispositivoOrigen', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByEntidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entidad', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByEntidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entidad', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByEntidadId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entidadId', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByEntidadIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entidadId', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByFechaUltimoIntento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoIntento', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy>
      thenByFechaUltimoIntentoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoIntento', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByHashOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashOriginal', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByHashOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashOriginal', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByIntentos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intentos', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByIntentosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intentos', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByMaxIntentos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxIntentos', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByMaxIntentosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxIntentos', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByMensajeError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeError', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByMensajeErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeError', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByOperacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operacion', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByOperacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operacion', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByStackTrace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stackTrace', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByStackTraceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stackTrace', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy>
      thenByTiempoEsperaSegundos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tiempoEsperaSegundos', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy>
      thenByTiempoEsperaSegundosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tiempoEsperaSegundos', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByUsuarioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByUsuarioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioId', Sort.desc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByVersionOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionOriginal', Sort.asc);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QAfterSortBy> thenByVersionOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionOriginal', Sort.desc);
    });
  }
}

extension SyncQueueQueryWhereDistinct
    on QueryBuilder<SyncQueue, SyncQueue, QDistinct> {
  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByDatosJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datosJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByDispositivoOrigen(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dispositivoOrigen',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByEntidad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entidad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByEntidadId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entidadId');
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByFechaUltimoIntento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaUltimoIntento');
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByHashOriginal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashOriginal', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByIntentos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intentos');
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByMaxIntentos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxIntentos');
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByMensajeError(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mensajeError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByOperacion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operacion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prioridad');
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByStackTrace(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stackTrace', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct>
      distinctByTiempoEsperaSegundos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tiempoEsperaSegundos');
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByUsuarioId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueue, SyncQueue, QDistinct> distinctByVersionOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'versionOriginal');
    });
  }
}

extension SyncQueueQueryProperty
    on QueryBuilder<SyncQueue, SyncQueue, QQueryProperty> {
  QueryBuilder<SyncQueue, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncQueue, String, QQueryOperations> datosJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datosJson');
    });
  }

  QueryBuilder<SyncQueue, String?, QQueryOperations>
      dispositivoOrigenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dispositivoOrigen');
    });
  }

  QueryBuilder<SyncQueue, TipoEntidad, QQueryOperations> entidadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entidad');
    });
  }

  QueryBuilder<SyncQueue, int, QQueryOperations> entidadIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entidadId');
    });
  }

  QueryBuilder<SyncQueue, EstadoSync, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<SyncQueue, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<SyncQueue, DateTime?, QQueryOperations>
      fechaUltimoIntentoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaUltimoIntento');
    });
  }

  QueryBuilder<SyncQueue, String?, QQueryOperations> hashOriginalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashOriginal');
    });
  }

  QueryBuilder<SyncQueue, int, QQueryOperations> intentosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intentos');
    });
  }

  QueryBuilder<SyncQueue, int, QQueryOperations> maxIntentosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxIntentos');
    });
  }

  QueryBuilder<SyncQueue, String?, QQueryOperations> mensajeErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mensajeError');
    });
  }

  QueryBuilder<SyncQueue, TipoOperacion, QQueryOperations> operacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operacion');
    });
  }

  QueryBuilder<SyncQueue, int, QQueryOperations> prioridadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prioridad');
    });
  }

  QueryBuilder<SyncQueue, String?, QQueryOperations> stackTraceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stackTrace');
    });
  }

  QueryBuilder<SyncQueue, int, QQueryOperations>
      tiempoEsperaSegundosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tiempoEsperaSegundos');
    });
  }

  QueryBuilder<SyncQueue, String?, QQueryOperations> usuarioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioId');
    });
  }

  QueryBuilder<SyncQueue, int?, QQueryOperations> versionOriginalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionOriginal');
    });
  }
}
