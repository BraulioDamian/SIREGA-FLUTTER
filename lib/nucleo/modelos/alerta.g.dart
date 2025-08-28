// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerta.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlertaCollection on Isar {
  IsarCollection<Alerta> get alertas => this.collection();
}

const AlertaSchema = CollectionSchema(
  name: r'Alerta',
  id: -3003225405610766644,
  properties: {
    r'accionRequerida': PropertySchema(
      id: 0,
      name: r'accionRequerida',
      type: IsarType.string,
    ),
    r'categoriaId': PropertySchema(
      id: 1,
      name: r'categoriaId',
      type: IsarType.string,
    ),
    r'creadoPor': PropertySchema(
      id: 2,
      name: r'creadoPor',
      type: IsarType.string,
    ),
    r'descripcionDetallada': PropertySchema(
      id: 3,
      name: r'descripcionDetallada',
      type: IsarType.string,
    ),
    r'dismissPermanente': PropertySchema(
      id: 4,
      name: r'dismissPermanente',
      type: IsarType.bool,
    ),
    r'esRecurrente': PropertySchema(
      id: 5,
      name: r'esRecurrente',
      type: IsarType.bool,
    ),
    r'estado': PropertySchema(
      id: 6,
      name: r'estado',
      type: IsarType.string,
      enumMap: _AlertaestadoEnumValueMap,
    ),
    r'etiquetas': PropertySchema(
      id: 7,
      name: r'etiquetas',
      type: IsarType.stringList,
    ),
    r'fechaCreacion': PropertySchema(
      id: 8,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaDismiss': PropertySchema(
      id: 9,
      name: r'fechaDismiss',
      type: IsarType.dateTime,
    ),
    r'fechaLectura': PropertySchema(
      id: 10,
      name: r'fechaLectura',
      type: IsarType.dateTime,
    ),
    r'fechaProgramada': PropertySchema(
      id: 11,
      name: r'fechaProgramada',
      type: IsarType.dateTime,
    ),
    r'fechaResolucion': PropertySchema(
      id: 12,
      name: r'fechaResolucion',
      type: IsarType.dateTime,
    ),
    r'fechaVencimiento': PropertySchema(
      id: 13,
      name: r'fechaVencimiento',
      type: IsarType.dateTime,
    ),
    r'grupoId': PropertySchema(
      id: 14,
      name: r'grupoId',
      type: IsarType.string,
    ),
    r'historialAcciones': PropertySchema(
      id: 15,
      name: r'historialAcciones',
      type: IsarType.stringList,
    ),
    r'idAnimalReferencia': PropertySchema(
      id: 16,
      name: r'idAnimalReferencia',
      type: IsarType.string,
    ),
    r'intervaloRecurrencia': PropertySchema(
      id: 17,
      name: r'intervaloRecurrencia',
      type: IsarType.long,
    ),
    r'leida': PropertySchema(
      id: 18,
      name: r'leida',
      type: IsarType.bool,
    ),
    r'mensaje': PropertySchema(
      id: 19,
      name: r'mensaje',
      type: IsarType.string,
    ),
    r'patronRecurrencia': PropertySchema(
      id: 20,
      name: r'patronRecurrencia',
      type: IsarType.string,
    ),
    r'prioridad': PropertySchema(
      id: 21,
      name: r'prioridad',
      type: IsarType.string,
      enumMap: _AlertaprioridadEnumValueMap,
    ),
    r'procesada': PropertySchema(
      id: 22,
      name: r'procesada',
      type: IsarType.bool,
    ),
    r'proximaOcurrencia': PropertySchema(
      id: 23,
      name: r'proximaOcurrencia',
      type: IsarType.dateTime,
    ),
    r'requiereAccion': PropertySchema(
      id: 24,
      name: r'requiereAccion',
      type: IsarType.bool,
    ),
    r'resolucion': PropertySchema(
      id: 25,
      name: r'resolucion',
      type: IsarType.string,
    ),
    r'resueltoPor': PropertySchema(
      id: 26,
      name: r'resueltoPor',
      type: IsarType.string,
    ),
    r'tipo': PropertySchema(
      id: 27,
      name: r'tipo',
      type: IsarType.string,
      enumMap: _AlertatipoEnumValueMap,
    ),
    r'titulo': PropertySchema(
      id: 28,
      name: r'titulo',
      type: IsarType.string,
    ),
    r'urlAccion': PropertySchema(
      id: 29,
      name: r'urlAccion',
      type: IsarType.string,
    ),
    r'usuarioAsignado': PropertySchema(
      id: 30,
      name: r'usuarioAsignado',
      type: IsarType.string,
    )
  },
  estimateSize: _alertaEstimateSize,
  serialize: _alertaSerialize,
  deserialize: _alertaDeserialize,
  deserializeProp: _alertaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'animal': LinkSchema(
      id: -8923168092741826476,
      name: r'animal',
      target: r'Animal',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _alertaGetId,
  getLinks: _alertaGetLinks,
  attach: _alertaAttach,
  version: '3.1.0+1',
);

int _alertaEstimateSize(
  Alerta object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accionRequerida;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.categoriaId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.creadoPor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.descripcionDetallada;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.estado.name.length * 3;
  bytesCount += 3 + object.etiquetas.length * 3;
  {
    for (var i = 0; i < object.etiquetas.length; i++) {
      final value = object.etiquetas[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.grupoId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.historialAcciones.length * 3;
  {
    for (var i = 0; i < object.historialAcciones.length; i++) {
      final value = object.historialAcciones[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.idAnimalReferencia;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.mensaje.length * 3;
  {
    final value = object.patronRecurrencia;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.prioridad.name.length * 3;
  {
    final value = object.resolucion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.resueltoPor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tipo.name.length * 3;
  bytesCount += 3 + object.titulo.length * 3;
  {
    final value = object.urlAccion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.usuarioAsignado;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _alertaSerialize(
  Alerta object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accionRequerida);
  writer.writeString(offsets[1], object.categoriaId);
  writer.writeString(offsets[2], object.creadoPor);
  writer.writeString(offsets[3], object.descripcionDetallada);
  writer.writeBool(offsets[4], object.dismissPermanente);
  writer.writeBool(offsets[5], object.esRecurrente);
  writer.writeString(offsets[6], object.estado.name);
  writer.writeStringList(offsets[7], object.etiquetas);
  writer.writeDateTime(offsets[8], object.fechaCreacion);
  writer.writeDateTime(offsets[9], object.fechaDismiss);
  writer.writeDateTime(offsets[10], object.fechaLectura);
  writer.writeDateTime(offsets[11], object.fechaProgramada);
  writer.writeDateTime(offsets[12], object.fechaResolucion);
  writer.writeDateTime(offsets[13], object.fechaVencimiento);
  writer.writeString(offsets[14], object.grupoId);
  writer.writeStringList(offsets[15], object.historialAcciones);
  writer.writeString(offsets[16], object.idAnimalReferencia);
  writer.writeLong(offsets[17], object.intervaloRecurrencia);
  writer.writeBool(offsets[18], object.leida);
  writer.writeString(offsets[19], object.mensaje);
  writer.writeString(offsets[20], object.patronRecurrencia);
  writer.writeString(offsets[21], object.prioridad.name);
  writer.writeBool(offsets[22], object.procesada);
  writer.writeDateTime(offsets[23], object.proximaOcurrencia);
  writer.writeBool(offsets[24], object.requiereAccion);
  writer.writeString(offsets[25], object.resolucion);
  writer.writeString(offsets[26], object.resueltoPor);
  writer.writeString(offsets[27], object.tipo.name);
  writer.writeString(offsets[28], object.titulo);
  writer.writeString(offsets[29], object.urlAccion);
  writer.writeString(offsets[30], object.usuarioAsignado);
}

Alerta _alertaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Alerta();
  object.accionRequerida = reader.readStringOrNull(offsets[0]);
  object.categoriaId = reader.readStringOrNull(offsets[1]);
  object.creadoPor = reader.readStringOrNull(offsets[2]);
  object.descripcionDetallada = reader.readStringOrNull(offsets[3]);
  object.dismissPermanente = reader.readBool(offsets[4]);
  object.esRecurrente = reader.readBool(offsets[5]);
  object.estado =
      _AlertaestadoValueEnumMap[reader.readStringOrNull(offsets[6])] ??
          EstadoAlerta.activa;
  object.etiquetas = reader.readStringList(offsets[7]) ?? [];
  object.fechaCreacion = reader.readDateTime(offsets[8]);
  object.fechaDismiss = reader.readDateTimeOrNull(offsets[9]);
  object.fechaLectura = reader.readDateTimeOrNull(offsets[10]);
  object.fechaProgramada = reader.readDateTimeOrNull(offsets[11]);
  object.fechaResolucion = reader.readDateTimeOrNull(offsets[12]);
  object.fechaVencimiento = reader.readDateTimeOrNull(offsets[13]);
  object.grupoId = reader.readStringOrNull(offsets[14]);
  object.historialAcciones = reader.readStringList(offsets[15]) ?? [];
  object.id = id;
  object.idAnimalReferencia = reader.readStringOrNull(offsets[16]);
  object.intervaloRecurrencia = reader.readLongOrNull(offsets[17]);
  object.leida = reader.readBool(offsets[18]);
  object.mensaje = reader.readString(offsets[19]);
  object.patronRecurrencia = reader.readStringOrNull(offsets[20]);
  object.prioridad =
      _AlertaprioridadValueEnumMap[reader.readStringOrNull(offsets[21])] ??
          Prioridad.baja;
  object.procesada = reader.readBool(offsets[22]);
  object.proximaOcurrencia = reader.readDateTimeOrNull(offsets[23]);
  object.requiereAccion = reader.readBool(offsets[24]);
  object.resolucion = reader.readStringOrNull(offsets[25]);
  object.resueltoPor = reader.readStringOrNull(offsets[26]);
  object.tipo = _AlertatipoValueEnumMap[reader.readStringOrNull(offsets[27])] ??
      TipoAlerta.vacunacion;
  object.titulo = reader.readString(offsets[28]);
  object.urlAccion = reader.readStringOrNull(offsets[29]);
  object.usuarioAsignado = reader.readStringOrNull(offsets[30]);
  return object;
}

P _alertaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (_AlertaestadoValueEnumMap[reader.readStringOrNull(offset)] ??
          EstadoAlerta.activa) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringList(offset) ?? []) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (_AlertaprioridadValueEnumMap[reader.readStringOrNull(offset)] ??
          Prioridad.baja) as P;
    case 22:
      return (reader.readBool(offset)) as P;
    case 23:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 24:
      return (reader.readBool(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (_AlertatipoValueEnumMap[reader.readStringOrNull(offset)] ??
          TipoAlerta.vacunacion) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AlertaestadoEnumValueMap = {
  r'activa': r'activa',
  r'leida': r'leida',
  r'procesada': r'procesada',
  r'pospuesta': r'pospuesta',
  r'cancelada': r'cancelada',
  r'expirada': r'expirada',
};
const _AlertaestadoValueEnumMap = {
  r'activa': EstadoAlerta.activa,
  r'leida': EstadoAlerta.leida,
  r'procesada': EstadoAlerta.procesada,
  r'pospuesta': EstadoAlerta.pospuesta,
  r'cancelada': EstadoAlerta.cancelada,
  r'expirada': EstadoAlerta.expirada,
};
const _AlertaprioridadEnumValueMap = {
  r'baja': r'baja',
  r'media': r'media',
  r'alta': r'alta',
  r'critica': r'critica',
  r'urgente': r'urgente',
};
const _AlertaprioridadValueEnumMap = {
  r'baja': Prioridad.baja,
  r'media': Prioridad.media,
  r'alta': Prioridad.alta,
  r'critica': Prioridad.critica,
  r'urgente': Prioridad.urgente,
};
const _AlertatipoEnumValueMap = {
  r'vacunacion': r'vacunacion',
  r'desparasitacion': r'desparasitacion',
  r'parto': r'parto',
  r'tratamiento': r'tratamiento',
  r'pesaje': r'pesaje',
  r'revision': r'revision',
  r'stockBajo': r'stockBajo',
  r'documentoVencido': r'documentoVencido',
  r'sincronizacion': r'sincronizacion',
  r'sistema': r'sistema',
  r'personalizada': r'personalizada',
};
const _AlertatipoValueEnumMap = {
  r'vacunacion': TipoAlerta.vacunacion,
  r'desparasitacion': TipoAlerta.desparasitacion,
  r'parto': TipoAlerta.parto,
  r'tratamiento': TipoAlerta.tratamiento,
  r'pesaje': TipoAlerta.pesaje,
  r'revision': TipoAlerta.revision,
  r'stockBajo': TipoAlerta.stockBajo,
  r'documentoVencido': TipoAlerta.documentoVencido,
  r'sincronizacion': TipoAlerta.sincronizacion,
  r'sistema': TipoAlerta.sistema,
  r'personalizada': TipoAlerta.personalizada,
};

Id _alertaGetId(Alerta object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _alertaGetLinks(Alerta object) {
  return [object.animal];
}

void _alertaAttach(IsarCollection<dynamic> col, Id id, Alerta object) {
  object.id = id;
  object.animal.attach(col, col.isar.collection<Animal>(), r'animal', id);
}

extension AlertaQueryWhereSort on QueryBuilder<Alerta, Alerta, QWhere> {
  QueryBuilder<Alerta, Alerta, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AlertaQueryWhere on QueryBuilder<Alerta, Alerta, QWhereClause> {
  QueryBuilder<Alerta, Alerta, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Alerta, Alerta, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterWhereClause> idBetween(
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

extension AlertaQueryFilter on QueryBuilder<Alerta, Alerta, QFilterCondition> {
  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> accionRequeridaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accionRequerida',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      accionRequeridaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accionRequerida',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> accionRequeridaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accionRequerida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      accionRequeridaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accionRequerida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> accionRequeridaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accionRequerida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> accionRequeridaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accionRequerida',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> accionRequeridaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accionRequerida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> accionRequeridaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accionRequerida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> accionRequeridaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accionRequerida',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> accionRequeridaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accionRequerida',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> accionRequeridaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accionRequerida',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      accionRequeridaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accionRequerida',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoriaId',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoriaId',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoriaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoriaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoriaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoriaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoriaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoriaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoriaId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoriaId',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> categoriaIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoriaId',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creadoPor',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creadoPor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'creadoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'creadoPor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> creadoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'creadoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcionDetallada',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcionDetallada',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcionDetallada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcionDetallada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcionDetallada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcionDetallada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcionDetallada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcionDetallada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcionDetallada',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcionDetallada',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcionDetallada',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      descripcionDetalladaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcionDetallada',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> dismissPermanenteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dismissPermanente',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> esRecurrenteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esRecurrente',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoEqualTo(
    EstadoAlerta value, {
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoGreaterThan(
    EstadoAlerta value, {
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoLessThan(
    EstadoAlerta value, {
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoBetween(
    EstadoAlerta lower,
    EstadoAlerta upper, {
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoStartsWith(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoEndsWith(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoContains(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoMatches(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      etiquetasElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'etiquetas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      etiquetasElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'etiquetas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'etiquetas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      etiquetasElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etiquetas',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      etiquetasElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'etiquetas',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      etiquetasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> etiquetasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'etiquetas',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaCreacionEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaCreacionGreaterThan(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaCreacionLessThan(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaCreacionBetween(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaDismissIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaDismiss',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaDismissIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaDismiss',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaDismissEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaDismiss',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaDismissGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaDismiss',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaDismissLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaDismiss',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaDismissBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaDismiss',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaLecturaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaLectura',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaLecturaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaLectura',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaLecturaEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaLectura',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaLecturaGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaLectura',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaLecturaLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaLectura',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaLecturaBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaLectura',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaProgramadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaProgramada',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      fechaProgramadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaProgramada',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaProgramadaEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaProgramada',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      fechaProgramadaGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaProgramada',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaProgramadaLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaProgramada',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaProgramadaBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaProgramada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaResolucionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaResolucion',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      fechaResolucionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaResolucion',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaResolucionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaResolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      fechaResolucionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaResolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaResolucionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaResolucion',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaResolucionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaResolucion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaVencimientoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaVencimiento',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      fechaVencimientoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaVencimiento',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaVencimientoEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      fechaVencimientoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaVencimientoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaVencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> fechaVencimientoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaVencimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grupoId',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grupoId',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grupoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grupoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grupoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grupoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grupoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grupoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grupoId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupoId',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> grupoIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grupoId',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historialAcciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historialAcciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historialAcciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historialAcciones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'historialAcciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'historialAcciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'historialAcciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'historialAcciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historialAcciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'historialAcciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialAcciones',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialAcciones',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialAcciones',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialAcciones',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialAcciones',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      historialAccionesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialAcciones',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      idAnimalReferenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idAnimalReferencia',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      idAnimalReferenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idAnimalReferencia',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> idAnimalReferenciaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAnimalReferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      idAnimalReferenciaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idAnimalReferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      idAnimalReferenciaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idAnimalReferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> idAnimalReferenciaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idAnimalReferencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      idAnimalReferenciaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idAnimalReferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      idAnimalReferenciaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idAnimalReferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      idAnimalReferenciaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idAnimalReferencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> idAnimalReferenciaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idAnimalReferencia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      idAnimalReferenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAnimalReferencia',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      idAnimalReferenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idAnimalReferencia',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      intervaloRecurrenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intervaloRecurrencia',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      intervaloRecurrenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intervaloRecurrencia',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      intervaloRecurrenciaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intervaloRecurrencia',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      intervaloRecurrenciaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intervaloRecurrencia',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      intervaloRecurrenciaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intervaloRecurrencia',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      intervaloRecurrenciaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intervaloRecurrencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> leidaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'leida',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mensaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mensaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mensaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mensaje',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mensaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mensaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mensaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mensaje',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mensaje',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> mensajeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mensaje',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      patronRecurrenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'patronRecurrencia',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      patronRecurrenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'patronRecurrencia',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> patronRecurrenciaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patronRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      patronRecurrenciaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'patronRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> patronRecurrenciaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'patronRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> patronRecurrenciaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'patronRecurrencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      patronRecurrenciaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'patronRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> patronRecurrenciaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'patronRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> patronRecurrenciaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'patronRecurrencia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> patronRecurrenciaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'patronRecurrencia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      patronRecurrenciaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patronRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      patronRecurrenciaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'patronRecurrencia',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadEqualTo(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadGreaterThan(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadLessThan(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadBetween(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadStartsWith(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadEndsWith(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prioridad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prioridad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prioridad',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> prioridadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prioridad',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> procesadaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'procesada',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      proximaOcurrenciaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'proximaOcurrencia',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      proximaOcurrenciaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'proximaOcurrencia',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> proximaOcurrenciaEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proximaOcurrencia',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      proximaOcurrenciaGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proximaOcurrencia',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> proximaOcurrenciaLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proximaOcurrencia',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> proximaOcurrenciaBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proximaOcurrencia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> requiereAccionEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'requiereAccion',
        value: value,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resolucion',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resolucion',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolucion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'resolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'resolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resolucion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resolucion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolucion',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resolucionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resolucion',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resueltoPor',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resueltoPor',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resueltoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resueltoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resueltoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resueltoPor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'resueltoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'resueltoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resueltoPor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resueltoPor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resueltoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> resueltoPorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resueltoPor',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoEqualTo(
    TipoAlerta value, {
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoGreaterThan(
    TipoAlerta value, {
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoLessThan(
    TipoAlerta value, {
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoBetween(
    TipoAlerta lower,
    TipoAlerta upper, {
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoStartsWith(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoEndsWith(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoMatches(
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

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titulo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titulo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> tituloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'urlAccion',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'urlAccion',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlAccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'urlAccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'urlAccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'urlAccion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'urlAccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'urlAccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'urlAccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'urlAccion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlAccion',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> urlAccionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'urlAccion',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> usuarioAsignadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usuarioAsignado',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      usuarioAsignadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usuarioAsignado',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> usuarioAsignadoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      usuarioAsignadoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> usuarioAsignadoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> usuarioAsignadoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioAsignado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> usuarioAsignadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usuarioAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> usuarioAsignadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usuarioAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> usuarioAsignadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usuarioAsignado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> usuarioAsignadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usuarioAsignado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> usuarioAsignadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioAsignado',
        value: '',
      ));
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition>
      usuarioAsignadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usuarioAsignado',
        value: '',
      ));
    });
  }
}

extension AlertaQueryObject on QueryBuilder<Alerta, Alerta, QFilterCondition> {}

extension AlertaQueryLinks on QueryBuilder<Alerta, Alerta, QFilterCondition> {
  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> animal(
      FilterQuery<Animal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'animal');
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterFilterCondition> animalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'animal', 0, true, 0, true);
    });
  }
}

extension AlertaQuerySortBy on QueryBuilder<Alerta, Alerta, QSortBy> {
  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByAccionRequerida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accionRequerida', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByAccionRequeridaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accionRequerida', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByCategoriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByCategoriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByDescripcionDetallada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionDetallada', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByDescripcionDetalladaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionDetallada', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByDismissPermanente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissPermanente', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByDismissPermanenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissPermanente', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaDismiss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDismiss', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaDismissDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDismiss', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaLectura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaLectura', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaLecturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaLectura', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaProgramada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProgramada', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaProgramadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProgramada', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaResolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaResolucion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaResolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaResolucion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByFechaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByGrupoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoId', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByGrupoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoId', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByIdAnimalReferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAnimalReferencia', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByIdAnimalReferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAnimalReferencia', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByIntervaloRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByIntervaloRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByLeida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leida', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByLeidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leida', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByMensaje() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensaje', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByMensajeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensaje', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByPatronRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patronRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByPatronRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patronRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByProcesada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'procesada', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByProcesadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'procesada', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByProximaOcurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximaOcurrencia', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByProximaOcurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximaOcurrencia', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByRequiereAccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereAccion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByRequiereAccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereAccion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByResolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolucion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByResolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolucion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByResueltoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resueltoPor', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByResueltoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resueltoPor', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByUrlAccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlAccion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByUrlAccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlAccion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByUsuarioAsignado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioAsignado', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> sortByUsuarioAsignadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioAsignado', Sort.desc);
    });
  }
}

extension AlertaQuerySortThenBy on QueryBuilder<Alerta, Alerta, QSortThenBy> {
  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByAccionRequerida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accionRequerida', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByAccionRequeridaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accionRequerida', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByCategoriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByCategoriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoriaId', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByCreadoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByCreadoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creadoPor', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByDescripcionDetallada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionDetallada', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByDescripcionDetalladaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionDetallada', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByDismissPermanente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissPermanente', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByDismissPermanenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dismissPermanente', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByEsRecurrenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esRecurrente', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaDismiss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDismiss', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaDismissDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaDismiss', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaLectura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaLectura', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaLecturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaLectura', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaProgramada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProgramada', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaProgramadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProgramada', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaResolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaResolucion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaResolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaResolucion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByFechaVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaVencimiento', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByGrupoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoId', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByGrupoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupoId', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByIdAnimalReferencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAnimalReferencia', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByIdAnimalReferenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAnimalReferencia', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByIntervaloRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByIntervaloRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByLeida() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leida', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByLeidaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'leida', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByMensaje() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensaje', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByMensajeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensaje', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByPatronRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patronRecurrencia', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByPatronRecurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patronRecurrencia', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByPrioridad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByPrioridadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prioridad', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByProcesada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'procesada', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByProcesadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'procesada', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByProximaOcurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximaOcurrencia', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByProximaOcurrenciaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proximaOcurrencia', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByRequiereAccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereAccion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByRequiereAccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requiereAccion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByResolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolucion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByResolucionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolucion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByResueltoPor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resueltoPor', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByResueltoPorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resueltoPor', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByUrlAccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlAccion', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByUrlAccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlAccion', Sort.desc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByUsuarioAsignado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioAsignado', Sort.asc);
    });
  }

  QueryBuilder<Alerta, Alerta, QAfterSortBy> thenByUsuarioAsignadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioAsignado', Sort.desc);
    });
  }
}

extension AlertaQueryWhereDistinct on QueryBuilder<Alerta, Alerta, QDistinct> {
  QueryBuilder<Alerta, Alerta, QDistinct> distinctByAccionRequerida(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accionRequerida',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByCategoriaId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoriaId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByCreadoPor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creadoPor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByDescripcionDetallada(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcionDetallada',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByDismissPermanente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dismissPermanente');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByEsRecurrente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esRecurrente');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByEtiquetas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etiquetas');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByFechaDismiss() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaDismiss');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByFechaLectura() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaLectura');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByFechaProgramada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaProgramada');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByFechaResolucion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaResolucion');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByFechaVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaVencimiento');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByGrupoId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grupoId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByHistorialAcciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'historialAcciones');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByIdAnimalReferencia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAnimalReferencia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByIntervaloRecurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intervaloRecurrencia');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByLeida() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'leida');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByMensaje(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mensaje', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByPatronRecurrencia(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'patronRecurrencia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByPrioridad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prioridad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByProcesada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'procesada');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByProximaOcurrencia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proximaOcurrencia');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByRequiereAccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requiereAccion');
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByResolucion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resolucion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByResueltoPor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resueltoPor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByTitulo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titulo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByUrlAccion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'urlAccion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Alerta, Alerta, QDistinct> distinctByUsuarioAsignado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioAsignado',
          caseSensitive: caseSensitive);
    });
  }
}

extension AlertaQueryProperty on QueryBuilder<Alerta, Alerta, QQueryProperty> {
  QueryBuilder<Alerta, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> accionRequeridaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accionRequerida');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> categoriaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoriaId');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> creadoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creadoPor');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations>
      descripcionDetalladaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcionDetallada');
    });
  }

  QueryBuilder<Alerta, bool, QQueryOperations> dismissPermanenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dismissPermanente');
    });
  }

  QueryBuilder<Alerta, bool, QQueryOperations> esRecurrenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esRecurrente');
    });
  }

  QueryBuilder<Alerta, EstadoAlerta, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Alerta, List<String>, QQueryOperations> etiquetasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etiquetas');
    });
  }

  QueryBuilder<Alerta, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Alerta, DateTime?, QQueryOperations> fechaDismissProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaDismiss');
    });
  }

  QueryBuilder<Alerta, DateTime?, QQueryOperations> fechaLecturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaLectura');
    });
  }

  QueryBuilder<Alerta, DateTime?, QQueryOperations> fechaProgramadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaProgramada');
    });
  }

  QueryBuilder<Alerta, DateTime?, QQueryOperations> fechaResolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaResolucion');
    });
  }

  QueryBuilder<Alerta, DateTime?, QQueryOperations> fechaVencimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaVencimiento');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> grupoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grupoId');
    });
  }

  QueryBuilder<Alerta, List<String>, QQueryOperations>
      historialAccionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'historialAcciones');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> idAnimalReferenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAnimalReferencia');
    });
  }

  QueryBuilder<Alerta, int?, QQueryOperations> intervaloRecurrenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intervaloRecurrencia');
    });
  }

  QueryBuilder<Alerta, bool, QQueryOperations> leidaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'leida');
    });
  }

  QueryBuilder<Alerta, String, QQueryOperations> mensajeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mensaje');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> patronRecurrenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patronRecurrencia');
    });
  }

  QueryBuilder<Alerta, Prioridad, QQueryOperations> prioridadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prioridad');
    });
  }

  QueryBuilder<Alerta, bool, QQueryOperations> procesadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'procesada');
    });
  }

  QueryBuilder<Alerta, DateTime?, QQueryOperations>
      proximaOcurrenciaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proximaOcurrencia');
    });
  }

  QueryBuilder<Alerta, bool, QQueryOperations> requiereAccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiereAccion');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> resolucionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resolucion');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> resueltoPorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resueltoPor');
    });
  }

  QueryBuilder<Alerta, TipoAlerta, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }

  QueryBuilder<Alerta, String, QQueryOperations> tituloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titulo');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> urlAccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'urlAccion');
    });
  }

  QueryBuilder<Alerta, String?, QQueryOperations> usuarioAsignadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioAsignado');
    });
  }
}
