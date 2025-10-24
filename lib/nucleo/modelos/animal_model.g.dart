// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnimalCollection on Isar {
  IsarCollection<Animal> get animals => this.collection();
}

const AnimalSchema = CollectionSchema(
  name: r'Animal',
  id: 5509621733869852096,
  properties: {
    r'codigoBarras': PropertySchema(
      id: 0,
      name: r'codigoBarras',
      type: IsarType.string,
    ),
    r'colorPelaje': PropertySchema(
      id: 1,
      name: r'colorPelaje',
      type: IsarType.string,
    ),
    r'compradorPotencial': PropertySchema(
      id: 2,
      name: r'compradorPotencial',
      type: IsarType.string,
    ),
    r'consanguinidad': PropertySchema(
      id: 3,
      name: r'consanguinidad',
      type: IsarType.double,
    ),
    r'consumoDiarioKg': PropertySchema(
      id: 4,
      name: r'consumoDiarioKg',
      type: IsarType.double,
    ),
    r'costoMantenimientoMensual': PropertySchema(
      id: 5,
      name: r'costoMantenimientoMensual',
      type: IsarType.double,
    ),
    r'descripcionSalud': PropertySchema(
      id: 6,
      name: r'descripcionSalud',
      type: IsarType.string,
    ),
    r'diasGestacion': PropertySchema(
      id: 7,
      name: r'diasGestacion',
      type: IsarType.long,
    ),
    r'documentosUrls': PropertySchema(
      id: 8,
      name: r'documentosUrls',
      type: IsarType.stringList,
    ),
    r'estado': PropertySchema(
      id: 9,
      name: r'estado',
      type: IsarType.string,
      enumMap: _AnimalestadoEnumValueMap,
    ),
    r'estadoReproductivo': PropertySchema(
      id: 10,
      name: r'estadoReproductivo',
      type: IsarType.string,
      enumMap: _AnimalestadoReproductivoEnumValueMap,
    ),
    r'estadoSalud': PropertySchema(
      id: 11,
      name: r'estadoSalud',
      type: IsarType.string,
      enumMap: _AnimalestadoSaludEnumValueMap,
    ),
    r'estadoSync': PropertySchema(
      id: 12,
      name: r'estadoSync',
      type: IsarType.string,
      enumMap: _AnimalestadoSyncEnumValueMap,
    ),
    r'etiquetas': PropertySchema(
      id: 13,
      name: r'etiquetas',
      type: IsarType.stringList,
    ),
    r'fechaCompra': PropertySchema(
      id: 14,
      name: r'fechaCompra',
      type: IsarType.dateTime,
    ),
    r'fechaCreacion': PropertySchema(
      id: 15,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaNacimiento': PropertySchema(
      id: 16,
      name: r'fechaNacimiento',
      type: IsarType.dateTime,
    ),
    r'fechaProximoCelo': PropertySchema(
      id: 17,
      name: r'fechaProximoCelo',
      type: IsarType.dateTime,
    ),
    r'fechaProximoParto': PropertySchema(
      id: 18,
      name: r'fechaProximoParto',
      type: IsarType.dateTime,
    ),
    r'fechaUbicacion': PropertySchema(
      id: 19,
      name: r'fechaUbicacion',
      type: IsarType.dateTime,
    ),
    r'fechaUltimaRevision': PropertySchema(
      id: 20,
      name: r'fechaUltimaRevision',
      type: IsarType.dateTime,
    ),
    r'fechaUltimoParto': PropertySchema(
      id: 21,
      name: r'fechaUltimoParto',
      type: IsarType.dateTime,
    ),
    r'fechaUltimoPesaje': PropertySchema(
      id: 22,
      name: r'fechaUltimoPesaje',
      type: IsarType.dateTime,
    ),
    r'fechaUltimoServicio': PropertySchema(
      id: 23,
      name: r'fechaUltimoServicio',
      type: IsarType.dateTime,
    ),
    r'fotoPerfilUrl': PropertySchema(
      id: 24,
      name: r'fotoPerfilUrl',
      type: IsarType.string,
    ),
    r'fotoUrl': PropertySchema(
      id: 25,
      name: r'fotoUrl',
      type: IsarType.string,
    ),
    r'fotosUrls': PropertySchema(
      id: 26,
      name: r'fotosUrls',
      type: IsarType.stringList,
    ),
    r'frecuenciaCardiaca': PropertySchema(
      id: 27,
      name: r'frecuenciaCardiaca',
      type: IsarType.long,
    ),
    r'frecuenciaRespiratoria': PropertySchema(
      id: 28,
      name: r'frecuenciaRespiratoria',
      type: IsarType.long,
    ),
    r'gananciaPromedioDiaria': PropertySchema(
      id: 29,
      name: r'gananciaPromedioDiaria',
      type: IsarType.double,
    ),
    r'generacion': PropertySchema(
      id: 30,
      name: r'generacion',
      type: IsarType.long,
    ),
    r'gestante': PropertySchema(
      id: 31,
      name: r'gestante',
      type: IsarType.bool,
    ),
    r'hashDatos': PropertySchema(
      id: 32,
      name: r'hashDatos',
      type: IsarType.string,
    ),
    r'historialModificaciones': PropertySchema(
      id: 33,
      name: r'historialModificaciones',
      type: IsarType.stringList,
    ),
    r'idAreteNFC': PropertySchema(
      id: 34,
      name: r'idAreteNFC',
      type: IsarType.string,
    ),
    r'idAreteVisual': PropertySchema(
      id: 35,
      name: r'idAreteVisual',
      type: IsarType.string,
    ),
    r'ingresoGeneradoTotal': PropertySchema(
      id: 36,
      name: r'ingresoGeneradoTotal',
      type: IsarType.double,
    ),
    r'latitud': PropertySchema(
      id: 37,
      name: r'latitud',
      type: IsarType.double,
    ),
    r'longitud': PropertySchema(
      id: 38,
      name: r'longitud',
      type: IsarType.double,
    ),
    r'nfcChipId': PropertySchema(
      id: 39,
      name: r'nfcChipId',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 40,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'notas': PropertySchema(
      id: 41,
      name: r'notas',
      type: IsarType.string,
    ),
    r'numeroCrias': PropertySchema(
      id: 42,
      name: r'numeroCrias',
      type: IsarType.long,
    ),
    r'numeroHerrado': PropertySchema(
      id: 43,
      name: r'numeroHerrado',
      type: IsarType.string,
    ),
    r'numeroPartos': PropertySchema(
      id: 44,
      name: r'numeroPartos',
      type: IsarType.long,
    ),
    r'pesoActual': PropertySchema(
      id: 45,
      name: r'pesoActual',
      type: IsarType.double,
    ),
    r'pesoNacimiento': PropertySchema(
      id: 46,
      name: r'pesoNacimiento',
      type: IsarType.double,
    ),
    r'produccionLecheTotal': PropertySchema(
      id: 47,
      name: r'produccionLecheTotal',
      type: IsarType.double,
    ),
    r'programaNutricional': PropertySchema(
      id: 48,
      name: r'programaNutricional',
      type: IsarType.string,
    ),
    r'promedioLecheDiario': PropertySchema(
      id: 49,
      name: r'promedioLecheDiario',
      type: IsarType.double,
    ),
    r'raza': PropertySchema(
      id: 50,
      name: r'raza',
      type: IsarType.string,
    ),
    r'razaMadre': PropertySchema(
      id: 51,
      name: r'razaMadre',
      type: IsarType.string,
    ),
    r'razaPadre': PropertySchema(
      id: 52,
      name: r'razaPadre',
      type: IsarType.string,
    ),
    r'registroGenealogico': PropertySchema(
      id: 53,
      name: r'registroGenealogico',
      type: IsarType.string,
    ),
    r'senasParticulares': PropertySchema(
      id: 54,
      name: r'senasParticulares',
      type: IsarType.string,
    ),
    r'serverId': PropertySchema(
      id: 55,
      name: r'serverId',
      type: IsarType.string,
    ),
    r'sexo': PropertySchema(
      id: 56,
      name: r'sexo',
      type: IsarType.string,
      enumMap: _AnimalsexoEnumValueMap,
    ),
    r'siniigaId': PropertySchema(
      id: 57,
      name: r'siniigaId',
      type: IsarType.object,
      target: r'SinigaId',
    ),
    r'suplementos': PropertySchema(
      id: 58,
      name: r'suplementos',
      type: IsarType.stringList,
    ),
    r'temperaturaActual': PropertySchema(
      id: 59,
      name: r'temperaturaActual',
      type: IsarType.double,
    ),
    r'tipoAlimentacion': PropertySchema(
      id: 60,
      name: r'tipoAlimentacion',
      type: IsarType.string,
    ),
    r'toroUltimoServicio': PropertySchema(
      id: 61,
      name: r'toroUltimoServicio',
      type: IsarType.string,
    ),
    r'ultimaActualizacion': PropertySchema(
      id: 62,
      name: r'ultimaActualizacion',
      type: IsarType.dateTime,
    ),
    r'usuarioCreacion': PropertySchema(
      id: 63,
      name: r'usuarioCreacion',
      type: IsarType.string,
    ),
    r'usuarioModificacion': PropertySchema(
      id: 64,
      name: r'usuarioModificacion',
      type: IsarType.string,
    ),
    r'valorCompra': PropertySchema(
      id: 65,
      name: r'valorCompra',
      type: IsarType.double,
    ),
    r'valorEstimado': PropertySchema(
      id: 66,
      name: r'valorEstimado',
      type: IsarType.double,
    ),
    r'vendedor': PropertySchema(
      id: 67,
      name: r'vendedor',
      type: IsarType.string,
    ),
    r'versionLocal': PropertySchema(
      id: 68,
      name: r'versionLocal',
      type: IsarType.long,
    ),
    r'veterinarioUltimaRevision': PropertySchema(
      id: 69,
      name: r'veterinarioUltimaRevision',
      type: IsarType.string,
    ),
    r'videosUrls': PropertySchema(
      id: 70,
      name: r'videosUrls',
      type: IsarType.stringList,
    ),
    r'zonaActual': PropertySchema(
      id: 71,
      name: r'zonaActual',
      type: IsarType.string,
    )
  },
  estimateSize: _animalEstimateSize,
  serialize: _animalSerialize,
  deserialize: _animalDeserialize,
  deserializeProp: _animalDeserializeProp,
  idName: r'id',
  indexes: {
    r'idAreteNFC': IndexSchema(
      id: 1681045968069995886,
      name: r'idAreteNFC',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idAreteNFC',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'nfcChipId': IndexSchema(
      id: -2017615473009466056,
      name: r'nfcChipId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nfcChipId',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
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
    r'padre': LinkSchema(
      id: -1689275313447489994,
      name: r'padre',
      target: r'Animal',
      single: true,
    ),
    r'madre': LinkSchema(
      id: -4433223482604263161,
      name: r'madre',
      target: r'Animal',
      single: true,
    ),
    r'herd': LinkSchema(
      id: -2593496057963308978,
      name: r'herd',
      target: r'Herd',
      single: true,
    ),
    r'eventos': LinkSchema(
      id: 769045642133859352,
      name: r'eventos',
      target: r'EventoSanitario',
      single: false,
      linkName: r'animal',
    ),
    r'producciones': LinkSchema(
      id: -4831535886546605294,
      name: r'producciones',
      target: r'RegistroProduccion',
      single: false,
      linkName: r'animal',
    ),
    r'crias': LinkSchema(
      id: -4501725590736157526,
      name: r'crias',
      target: r'Animal',
      single: false,
      linkName: r'madre',
    )
  },
  embeddedSchemas: {r'SinigaId': SinigaIdSchema},
  getId: _animalGetId,
  getLinks: _animalGetLinks,
  attach: _animalAttach,
  version: '3.1.0+1',
);

int _animalEstimateSize(
  Animal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.codigoBarras;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.colorPelaje;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.compradorPotencial;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.descripcionSalud;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.documentosUrls.length * 3;
  {
    for (var i = 0; i < object.documentosUrls.length; i++) {
      final value = object.documentosUrls[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.estado.name.length * 3;
  {
    final value = object.estadoReproductivo;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.estadoSalud.name.length * 3;
  bytesCount += 3 + object.estadoSync.name.length * 3;
  bytesCount += 3 + object.etiquetas.length * 3;
  {
    for (var i = 0; i < object.etiquetas.length; i++) {
      final value = object.etiquetas[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.fotoPerfilUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fotoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.fotosUrls.length * 3;
  {
    for (var i = 0; i < object.fotosUrls.length; i++) {
      final value = object.fotosUrls[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.hashDatos;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.historialModificaciones.length * 3;
  {
    for (var i = 0; i < object.historialModificaciones.length; i++) {
      final value = object.historialModificaciones[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.idAreteNFC;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idAreteVisual;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nfcChipId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  {
    final value = object.notas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.numeroHerrado;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.programaNutricional;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.raza.length * 3;
  {
    final value = object.razaMadre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.razaPadre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.registroGenealogico;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.senasParticulares;
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
  bytesCount += 3 + object.sexo.name.length * 3;
  {
    final value = object.siniigaId;
    if (value != null) {
      bytesCount += 3 +
          SinigaIdSchema.estimateSize(value, allOffsets[SinigaId]!, allOffsets);
    }
  }
  bytesCount += 3 + object.suplementos.length * 3;
  {
    for (var i = 0; i < object.suplementos.length; i++) {
      final value = object.suplementos[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.tipoAlimentacion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.toroUltimoServicio;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.usuarioCreacion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.usuarioModificacion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vendedor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.veterinarioUltimaRevision;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.videosUrls.length * 3;
  {
    for (var i = 0; i < object.videosUrls.length; i++) {
      final value = object.videosUrls[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.zonaActual;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _animalSerialize(
  Animal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.codigoBarras);
  writer.writeString(offsets[1], object.colorPelaje);
  writer.writeString(offsets[2], object.compradorPotencial);
  writer.writeDouble(offsets[3], object.consanguinidad);
  writer.writeDouble(offsets[4], object.consumoDiarioKg);
  writer.writeDouble(offsets[5], object.costoMantenimientoMensual);
  writer.writeString(offsets[6], object.descripcionSalud);
  writer.writeLong(offsets[7], object.diasGestacion);
  writer.writeStringList(offsets[8], object.documentosUrls);
  writer.writeString(offsets[9], object.estado.name);
  writer.writeString(offsets[10], object.estadoReproductivo?.name);
  writer.writeString(offsets[11], object.estadoSalud.name);
  writer.writeString(offsets[12], object.estadoSync.name);
  writer.writeStringList(offsets[13], object.etiquetas);
  writer.writeDateTime(offsets[14], object.fechaCompra);
  writer.writeDateTime(offsets[15], object.fechaCreacion);
  writer.writeDateTime(offsets[16], object.fechaNacimiento);
  writer.writeDateTime(offsets[17], object.fechaProximoCelo);
  writer.writeDateTime(offsets[18], object.fechaProximoParto);
  writer.writeDateTime(offsets[19], object.fechaUbicacion);
  writer.writeDateTime(offsets[20], object.fechaUltimaRevision);
  writer.writeDateTime(offsets[21], object.fechaUltimoParto);
  writer.writeDateTime(offsets[22], object.fechaUltimoPesaje);
  writer.writeDateTime(offsets[23], object.fechaUltimoServicio);
  writer.writeString(offsets[24], object.fotoPerfilUrl);
  writer.writeString(offsets[25], object.fotoUrl);
  writer.writeStringList(offsets[26], object.fotosUrls);
  writer.writeLong(offsets[27], object.frecuenciaCardiaca);
  writer.writeLong(offsets[28], object.frecuenciaRespiratoria);
  writer.writeDouble(offsets[29], object.gananciaPromedioDiaria);
  writer.writeLong(offsets[30], object.generacion);
  writer.writeBool(offsets[31], object.gestante);
  writer.writeString(offsets[32], object.hashDatos);
  writer.writeStringList(offsets[33], object.historialModificaciones);
  writer.writeString(offsets[34], object.idAreteNFC);
  writer.writeString(offsets[35], object.idAreteVisual);
  writer.writeDouble(offsets[36], object.ingresoGeneradoTotal);
  writer.writeDouble(offsets[37], object.latitud);
  writer.writeDouble(offsets[38], object.longitud);
  writer.writeString(offsets[39], object.nfcChipId);
  writer.writeString(offsets[40], object.nombre);
  writer.writeString(offsets[41], object.notas);
  writer.writeLong(offsets[42], object.numeroCrias);
  writer.writeString(offsets[43], object.numeroHerrado);
  writer.writeLong(offsets[44], object.numeroPartos);
  writer.writeDouble(offsets[45], object.pesoActual);
  writer.writeDouble(offsets[46], object.pesoNacimiento);
  writer.writeDouble(offsets[47], object.produccionLecheTotal);
  writer.writeString(offsets[48], object.programaNutricional);
  writer.writeDouble(offsets[49], object.promedioLecheDiario);
  writer.writeString(offsets[50], object.raza);
  writer.writeString(offsets[51], object.razaMadre);
  writer.writeString(offsets[52], object.razaPadre);
  writer.writeString(offsets[53], object.registroGenealogico);
  writer.writeString(offsets[54], object.senasParticulares);
  writer.writeString(offsets[55], object.serverId);
  writer.writeString(offsets[56], object.sexo.name);
  writer.writeObject<SinigaId>(
    offsets[57],
    allOffsets,
    SinigaIdSchema.serialize,
    object.siniigaId,
  );
  writer.writeStringList(offsets[58], object.suplementos);
  writer.writeDouble(offsets[59], object.temperaturaActual);
  writer.writeString(offsets[60], object.tipoAlimentacion);
  writer.writeString(offsets[61], object.toroUltimoServicio);
  writer.writeDateTime(offsets[62], object.ultimaActualizacion);
  writer.writeString(offsets[63], object.usuarioCreacion);
  writer.writeString(offsets[64], object.usuarioModificacion);
  writer.writeDouble(offsets[65], object.valorCompra);
  writer.writeDouble(offsets[66], object.valorEstimado);
  writer.writeString(offsets[67], object.vendedor);
  writer.writeLong(offsets[68], object.versionLocal);
  writer.writeString(offsets[69], object.veterinarioUltimaRevision);
  writer.writeStringList(offsets[70], object.videosUrls);
  writer.writeString(offsets[71], object.zonaActual);
}

Animal _animalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Animal();
  object.codigoBarras = reader.readStringOrNull(offsets[0]);
  object.colorPelaje = reader.readStringOrNull(offsets[1]);
  object.compradorPotencial = reader.readStringOrNull(offsets[2]);
  object.consanguinidad = reader.readDoubleOrNull(offsets[3]);
  object.consumoDiarioKg = reader.readDoubleOrNull(offsets[4]);
  object.costoMantenimientoMensual = reader.readDoubleOrNull(offsets[5]);
  object.descripcionSalud = reader.readStringOrNull(offsets[6]);
  object.diasGestacion = reader.readLongOrNull(offsets[7]);
  object.documentosUrls = reader.readStringList(offsets[8]) ?? [];
  object.estado =
      _AnimalestadoValueEnumMap[reader.readStringOrNull(offsets[9])] ??
          EstadoAnimal.activo;
  object.estadoReproductivo = _AnimalestadoReproductivoValueEnumMap[
      reader.readStringOrNull(offsets[10])];
  object.estadoSalud =
      _AnimalestadoSaludValueEnumMap[reader.readStringOrNull(offsets[11])] ??
          EstadoSalud.sano;
  object.estadoSync =
      _AnimalestadoSyncValueEnumMap[reader.readStringOrNull(offsets[12])] ??
          EstadoSync.pendiente;
  object.etiquetas = reader.readStringList(offsets[13]) ?? [];
  object.fechaCompra = reader.readDateTimeOrNull(offsets[14]);
  object.fechaCreacion = reader.readDateTime(offsets[15]);
  object.fechaNacimiento = reader.readDateTime(offsets[16]);
  object.fechaProximoCelo = reader.readDateTimeOrNull(offsets[17]);
  object.fechaProximoParto = reader.readDateTimeOrNull(offsets[18]);
  object.fechaUbicacion = reader.readDateTimeOrNull(offsets[19]);
  object.fechaUltimaRevision = reader.readDateTimeOrNull(offsets[20]);
  object.fechaUltimoParto = reader.readDateTimeOrNull(offsets[21]);
  object.fechaUltimoPesaje = reader.readDateTimeOrNull(offsets[22]);
  object.fechaUltimoServicio = reader.readDateTimeOrNull(offsets[23]);
  object.fotoPerfilUrl = reader.readStringOrNull(offsets[24]);
  object.fotoUrl = reader.readStringOrNull(offsets[25]);
  object.fotosUrls = reader.readStringList(offsets[26]) ?? [];
  object.frecuenciaCardiaca = reader.readLongOrNull(offsets[27]);
  object.frecuenciaRespiratoria = reader.readLongOrNull(offsets[28]);
  object.gananciaPromedioDiaria = reader.readDoubleOrNull(offsets[29]);
  object.generacion = reader.readLongOrNull(offsets[30]);
  object.gestante = reader.readBool(offsets[31]);
  object.hashDatos = reader.readStringOrNull(offsets[32]);
  object.historialModificaciones = reader.readStringList(offsets[33]) ?? [];
  object.id = id;
  object.idAreteNFC = reader.readStringOrNull(offsets[34]);
  object.idAreteVisual = reader.readStringOrNull(offsets[35]);
  object.ingresoGeneradoTotal = reader.readDoubleOrNull(offsets[36]);
  object.latitud = reader.readDoubleOrNull(offsets[37]);
  object.longitud = reader.readDoubleOrNull(offsets[38]);
  object.nfcChipId = reader.readStringOrNull(offsets[39]);
  object.nombre = reader.readString(offsets[40]);
  object.notas = reader.readStringOrNull(offsets[41]);
  object.numeroCrias = reader.readLong(offsets[42]);
  object.numeroHerrado = reader.readStringOrNull(offsets[43]);
  object.numeroPartos = reader.readLong(offsets[44]);
  object.pesoActual = reader.readDoubleOrNull(offsets[45]);
  object.pesoNacimiento = reader.readDoubleOrNull(offsets[46]);
  object.produccionLecheTotal = reader.readDoubleOrNull(offsets[47]);
  object.programaNutricional = reader.readStringOrNull(offsets[48]);
  object.promedioLecheDiario = reader.readDoubleOrNull(offsets[49]);
  object.raza = reader.readString(offsets[50]);
  object.razaMadre = reader.readStringOrNull(offsets[51]);
  object.razaPadre = reader.readStringOrNull(offsets[52]);
  object.registroGenealogico = reader.readStringOrNull(offsets[53]);
  object.senasParticulares = reader.readStringOrNull(offsets[54]);
  object.serverId = reader.readStringOrNull(offsets[55]);
  object.sexo = _AnimalsexoValueEnumMap[reader.readStringOrNull(offsets[56])] ??
      Sexo.macho;
  object.siniigaId = reader.readObjectOrNull<SinigaId>(
    offsets[57],
    SinigaIdSchema.deserialize,
    allOffsets,
  );
  object.suplementos = reader.readStringList(offsets[58]) ?? [];
  object.temperaturaActual = reader.readDoubleOrNull(offsets[59]);
  object.tipoAlimentacion = reader.readStringOrNull(offsets[60]);
  object.toroUltimoServicio = reader.readStringOrNull(offsets[61]);
  object.ultimaActualizacion = reader.readDateTimeOrNull(offsets[62]);
  object.usuarioCreacion = reader.readStringOrNull(offsets[63]);
  object.usuarioModificacion = reader.readStringOrNull(offsets[64]);
  object.valorCompra = reader.readDoubleOrNull(offsets[65]);
  object.valorEstimado = reader.readDoubleOrNull(offsets[66]);
  object.vendedor = reader.readStringOrNull(offsets[67]);
  object.versionLocal = reader.readLong(offsets[68]);
  object.veterinarioUltimaRevision = reader.readStringOrNull(offsets[69]);
  object.videosUrls = reader.readStringList(offsets[70]) ?? [];
  object.zonaActual = reader.readStringOrNull(offsets[71]);
  return object;
}

P _animalDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (_AnimalestadoValueEnumMap[reader.readStringOrNull(offset)] ??
          EstadoAnimal.activo) as P;
    case 10:
      return (_AnimalestadoReproductivoValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 11:
      return (_AnimalestadoSaludValueEnumMap[reader.readStringOrNull(offset)] ??
          EstadoSalud.sano) as P;
    case 12:
      return (_AnimalestadoSyncValueEnumMap[reader.readStringOrNull(offset)] ??
          EstadoSync.pendiente) as P;
    case 13:
      return (reader.readStringList(offset) ?? []) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readDateTime(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 21:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 22:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 23:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringList(offset) ?? []) as P;
    case 27:
      return (reader.readLongOrNull(offset)) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    case 29:
      return (reader.readDoubleOrNull(offset)) as P;
    case 30:
      return (reader.readLongOrNull(offset)) as P;
    case 31:
      return (reader.readBool(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringList(offset) ?? []) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    case 36:
      return (reader.readDoubleOrNull(offset)) as P;
    case 37:
      return (reader.readDoubleOrNull(offset)) as P;
    case 38:
      return (reader.readDoubleOrNull(offset)) as P;
    case 39:
      return (reader.readStringOrNull(offset)) as P;
    case 40:
      return (reader.readString(offset)) as P;
    case 41:
      return (reader.readStringOrNull(offset)) as P;
    case 42:
      return (reader.readLong(offset)) as P;
    case 43:
      return (reader.readStringOrNull(offset)) as P;
    case 44:
      return (reader.readLong(offset)) as P;
    case 45:
      return (reader.readDoubleOrNull(offset)) as P;
    case 46:
      return (reader.readDoubleOrNull(offset)) as P;
    case 47:
      return (reader.readDoubleOrNull(offset)) as P;
    case 48:
      return (reader.readStringOrNull(offset)) as P;
    case 49:
      return (reader.readDoubleOrNull(offset)) as P;
    case 50:
      return (reader.readString(offset)) as P;
    case 51:
      return (reader.readStringOrNull(offset)) as P;
    case 52:
      return (reader.readStringOrNull(offset)) as P;
    case 53:
      return (reader.readStringOrNull(offset)) as P;
    case 54:
      return (reader.readStringOrNull(offset)) as P;
    case 55:
      return (reader.readStringOrNull(offset)) as P;
    case 56:
      return (_AnimalsexoValueEnumMap[reader.readStringOrNull(offset)] ??
          Sexo.macho) as P;
    case 57:
      return (reader.readObjectOrNull<SinigaId>(
        offset,
        SinigaIdSchema.deserialize,
        allOffsets,
      )) as P;
    case 58:
      return (reader.readStringList(offset) ?? []) as P;
    case 59:
      return (reader.readDoubleOrNull(offset)) as P;
    case 60:
      return (reader.readStringOrNull(offset)) as P;
    case 61:
      return (reader.readStringOrNull(offset)) as P;
    case 62:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 63:
      return (reader.readStringOrNull(offset)) as P;
    case 64:
      return (reader.readStringOrNull(offset)) as P;
    case 65:
      return (reader.readDoubleOrNull(offset)) as P;
    case 66:
      return (reader.readDoubleOrNull(offset)) as P;
    case 67:
      return (reader.readStringOrNull(offset)) as P;
    case 68:
      return (reader.readLong(offset)) as P;
    case 69:
      return (reader.readStringOrNull(offset)) as P;
    case 70:
      return (reader.readStringList(offset) ?? []) as P;
    case 71:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AnimalestadoEnumValueMap = {
  r'activo': r'activo',
  r'vendido': r'vendido',
  r'muerto': r'muerto',
  r'perdido': r'perdido',
  r'enfermo': r'enfermo',
  r'cuarentena': r'cuarentena',
  r'prestado': r'prestado',
  r'enTransito': r'enTransito',
};
const _AnimalestadoValueEnumMap = {
  r'activo': EstadoAnimal.activo,
  r'vendido': EstadoAnimal.vendido,
  r'muerto': EstadoAnimal.muerto,
  r'perdido': EstadoAnimal.perdido,
  r'enfermo': EstadoAnimal.enfermo,
  r'cuarentena': EstadoAnimal.cuarentena,
  r'prestado': EstadoAnimal.prestado,
  r'enTransito': EstadoAnimal.enTransito,
};
const _AnimalestadoReproductivoEnumValueMap = {
  r'virgen': r'virgen',
  r'servida': r'servida',
  r'gestante': r'gestante',
  r'lactante': r'lactante',
  r'seca': r'seca',
  r'descarte': r'descarte',
  r'reproductorActivo': r'reproductorActivo',
  r'reproductorInactivo': r'reproductorInactivo',
};
const _AnimalestadoReproductivoValueEnumMap = {
  r'virgen': EstadoReproductivo.virgen,
  r'servida': EstadoReproductivo.servida,
  r'gestante': EstadoReproductivo.gestante,
  r'lactante': EstadoReproductivo.lactante,
  r'seca': EstadoReproductivo.seca,
  r'descarte': EstadoReproductivo.descarte,
  r'reproductorActivo': EstadoReproductivo.reproductorActivo,
  r'reproductorInactivo': EstadoReproductivo.reproductorInactivo,
};
const _AnimalestadoSaludEnumValueMap = {
  r'sano': r'sano',
  r'enfermo': r'enfermo',
  r'convaleciente': r'convaleciente',
  r'critico': r'critico',
  r'enTratamiento': r'enTratamiento',
  r'enObservacion': r'enObservacion',
};
const _AnimalestadoSaludValueEnumMap = {
  r'sano': EstadoSalud.sano,
  r'enfermo': EstadoSalud.enfermo,
  r'convaleciente': EstadoSalud.convaleciente,
  r'critico': EstadoSalud.critico,
  r'enTratamiento': EstadoSalud.enTratamiento,
  r'enObservacion': EstadoSalud.enObservacion,
};
const _AnimalestadoSyncEnumValueMap = {
  r'pendiente': r'pendiente',
  r'enProceso': r'enProceso',
  r'completado': r'completado',
  r'error': r'error',
  r'conflicto': r'conflicto',
  r'cancelado': r'cancelado',
};
const _AnimalestadoSyncValueEnumMap = {
  r'pendiente': EstadoSync.pendiente,
  r'enProceso': EstadoSync.enProceso,
  r'completado': EstadoSync.completado,
  r'error': EstadoSync.error,
  r'conflicto': EstadoSync.conflicto,
  r'cancelado': EstadoSync.cancelado,
};
const _AnimalsexoEnumValueMap = {
  r'macho': r'macho',
  r'hembra': r'hembra',
  r'castrado': r'castrado',
};
const _AnimalsexoValueEnumMap = {
  r'macho': Sexo.macho,
  r'hembra': Sexo.hembra,
  r'castrado': Sexo.castrado,
};

Id _animalGetId(Animal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _animalGetLinks(Animal object) {
  return [
    object.padre,
    object.madre,
    object.herd,
    object.eventos,
    object.producciones,
    object.crias
  ];
}

void _animalAttach(IsarCollection<dynamic> col, Id id, Animal object) {
  object.id = id;
  object.padre.attach(col, col.isar.collection<Animal>(), r'padre', id);
  object.madre.attach(col, col.isar.collection<Animal>(), r'madre', id);
  object.herd.attach(col, col.isar.collection<Herd>(), r'herd', id);
  object.eventos
      .attach(col, col.isar.collection<EventoSanitario>(), r'eventos', id);
  object.producciones.attach(
      col, col.isar.collection<RegistroProduccion>(), r'producciones', id);
  object.crias.attach(col, col.isar.collection<Animal>(), r'crias', id);
}

extension AnimalByIndex on IsarCollection<Animal> {
  Future<Animal?> getByIdAreteNFC(String? idAreteNFC) {
    return getByIndex(r'idAreteNFC', [idAreteNFC]);
  }

  Animal? getByIdAreteNFCSync(String? idAreteNFC) {
    return getByIndexSync(r'idAreteNFC', [idAreteNFC]);
  }

  Future<bool> deleteByIdAreteNFC(String? idAreteNFC) {
    return deleteByIndex(r'idAreteNFC', [idAreteNFC]);
  }

  bool deleteByIdAreteNFCSync(String? idAreteNFC) {
    return deleteByIndexSync(r'idAreteNFC', [idAreteNFC]);
  }

  Future<List<Animal?>> getAllByIdAreteNFC(List<String?> idAreteNFCValues) {
    final values = idAreteNFCValues.map((e) => [e]).toList();
    return getAllByIndex(r'idAreteNFC', values);
  }

  List<Animal?> getAllByIdAreteNFCSync(List<String?> idAreteNFCValues) {
    final values = idAreteNFCValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idAreteNFC', values);
  }

  Future<int> deleteAllByIdAreteNFC(List<String?> idAreteNFCValues) {
    final values = idAreteNFCValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idAreteNFC', values);
  }

  int deleteAllByIdAreteNFCSync(List<String?> idAreteNFCValues) {
    final values = idAreteNFCValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idAreteNFC', values);
  }

  Future<Id> putByIdAreteNFC(Animal object) {
    return putByIndex(r'idAreteNFC', object);
  }

  Id putByIdAreteNFCSync(Animal object, {bool saveLinks = true}) {
    return putByIndexSync(r'idAreteNFC', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdAreteNFC(List<Animal> objects) {
    return putAllByIndex(r'idAreteNFC', objects);
  }

  List<Id> putAllByIdAreteNFCSync(List<Animal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idAreteNFC', objects, saveLinks: saveLinks);
  }

  Future<Animal?> getByNfcChipId(String? nfcChipId) {
    return getByIndex(r'nfcChipId', [nfcChipId]);
  }

  Animal? getByNfcChipIdSync(String? nfcChipId) {
    return getByIndexSync(r'nfcChipId', [nfcChipId]);
  }

  Future<bool> deleteByNfcChipId(String? nfcChipId) {
    return deleteByIndex(r'nfcChipId', [nfcChipId]);
  }

  bool deleteByNfcChipIdSync(String? nfcChipId) {
    return deleteByIndexSync(r'nfcChipId', [nfcChipId]);
  }

  Future<List<Animal?>> getAllByNfcChipId(List<String?> nfcChipIdValues) {
    final values = nfcChipIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'nfcChipId', values);
  }

  List<Animal?> getAllByNfcChipIdSync(List<String?> nfcChipIdValues) {
    final values = nfcChipIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'nfcChipId', values);
  }

  Future<int> deleteAllByNfcChipId(List<String?> nfcChipIdValues) {
    final values = nfcChipIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'nfcChipId', values);
  }

  int deleteAllByNfcChipIdSync(List<String?> nfcChipIdValues) {
    final values = nfcChipIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'nfcChipId', values);
  }

  Future<Id> putByNfcChipId(Animal object) {
    return putByIndex(r'nfcChipId', object);
  }

  Id putByNfcChipIdSync(Animal object, {bool saveLinks = true}) {
    return putByIndexSync(r'nfcChipId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNfcChipId(List<Animal> objects) {
    return putAllByIndex(r'nfcChipId', objects);
  }

  List<Id> putAllByNfcChipIdSync(List<Animal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'nfcChipId', objects, saveLinks: saveLinks);
  }
}

extension AnimalQueryWhereSort on QueryBuilder<Animal, Animal, QWhere> {
  QueryBuilder<Animal, Animal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimalQueryWhere on QueryBuilder<Animal, Animal, QWhereClause> {
  QueryBuilder<Animal, Animal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Animal, Animal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idBetween(
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

  QueryBuilder<Animal, Animal, QAfterWhereClause> idAreteNFCIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idAreteNFC',
        value: [null],
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idAreteNFCIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idAreteNFC',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idAreteNFCEqualTo(
      String? idAreteNFC) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idAreteNFC',
        value: [idAreteNFC],
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idAreteNFCNotEqualTo(
      String? idAreteNFC) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idAreteNFC',
              lower: [],
              upper: [idAreteNFC],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idAreteNFC',
              lower: [idAreteNFC],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idAreteNFC',
              lower: [idAreteNFC],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idAreteNFC',
              lower: [],
              upper: [idAreteNFC],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> nfcChipIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nfcChipId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> nfcChipIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nfcChipId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> nfcChipIdEqualTo(
      String? nfcChipId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nfcChipId',
        value: [nfcChipId],
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> nfcChipIdNotEqualTo(
      String? nfcChipId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nfcChipId',
              lower: [],
              upper: [nfcChipId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nfcChipId',
              lower: [nfcChipId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nfcChipId',
              lower: [nfcChipId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nfcChipId',
              lower: [],
              upper: [nfcChipId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'serverId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> serverIdEqualTo(
      String? serverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serverId',
        value: [serverId],
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> serverIdNotEqualTo(
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

extension AnimalQueryFilter on QueryBuilder<Animal, Animal, QFilterCondition> {
  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codigoBarras',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codigoBarras',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoBarras',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codigoBarras',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codigoBarras',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codigoBarras',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codigoBarras',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codigoBarras',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codigoBarras',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codigoBarras',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigoBarras',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> codigoBarrasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codigoBarras',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'colorPelaje',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'colorPelaje',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorPelaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorPelaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorPelaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorPelaje',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorPelaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorPelaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorPelaje',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorPelaje',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorPelaje',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> colorPelajeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorPelaje',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      compradorPotencialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compradorPotencial',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      compradorPotencialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compradorPotencial',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> compradorPotencialEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compradorPotencial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      compradorPotencialGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compradorPotencial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      compradorPotencialLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compradorPotencial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> compradorPotencialBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compradorPotencial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      compradorPotencialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'compradorPotencial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      compradorPotencialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'compradorPotencial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      compradorPotencialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'compradorPotencial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> compradorPotencialMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'compradorPotencial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      compradorPotencialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compradorPotencial',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      compradorPotencialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'compradorPotencial',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consanguinidadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'consanguinidad',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      consanguinidadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'consanguinidad',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consanguinidadEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consanguinidad',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consanguinidadGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'consanguinidad',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consanguinidadLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'consanguinidad',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consanguinidadBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'consanguinidad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consumoDiarioKgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'consumoDiarioKg',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      consumoDiarioKgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'consumoDiarioKg',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consumoDiarioKgEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'consumoDiarioKg',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      consumoDiarioKgGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'consumoDiarioKg',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consumoDiarioKgLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'consumoDiarioKg',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> consumoDiarioKgBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'consumoDiarioKg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      costoMantenimientoMensualIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'costoMantenimientoMensual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      costoMantenimientoMensualIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'costoMantenimientoMensual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      costoMantenimientoMensualEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costoMantenimientoMensual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      costoMantenimientoMensualGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costoMantenimientoMensual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      costoMantenimientoMensualLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costoMantenimientoMensual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      costoMantenimientoMensualBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costoMantenimientoMensual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> descripcionSaludIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcionSalud',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      descripcionSaludIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcionSalud',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> descripcionSaludEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcionSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      descripcionSaludGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcionSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> descripcionSaludLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcionSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> descripcionSaludBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcionSalud',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      descripcionSaludStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcionSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> descripcionSaludEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcionSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> descripcionSaludContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcionSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> descripcionSaludMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcionSalud',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      descripcionSaludIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcionSalud',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      descripcionSaludIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcionSalud',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> diasGestacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'diasGestacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> diasGestacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'diasGestacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> diasGestacionEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasGestacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> diasGestacionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasGestacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> diasGestacionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasGestacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> diasGestacionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasGestacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentosUrls',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentosUrls',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentosUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentosUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentosUrls',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> documentosUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentosUrls',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentosUrls',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentosUrls',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentosUrls',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      documentosUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'documentosUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoEqualTo(
    EstadoAnimal value, {
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoGreaterThan(
    EstadoAnimal value, {
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoLessThan(
    EstadoAnimal value, {
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoBetween(
    EstadoAnimal lower,
    EstadoAnimal upper, {
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoStartsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoContains(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoMatches(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      estadoReproductivoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estadoReproductivo',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      estadoReproductivoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estadoReproductivo',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoReproductivoEqualTo(
    EstadoReproductivo? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoReproductivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      estadoReproductivoGreaterThan(
    EstadoReproductivo? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoReproductivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      estadoReproductivoLessThan(
    EstadoReproductivo? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoReproductivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoReproductivoBetween(
    EstadoReproductivo? lower,
    EstadoReproductivo? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoReproductivo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      estadoReproductivoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoReproductivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      estadoReproductivoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoReproductivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      estadoReproductivoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoReproductivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoReproductivoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoReproductivo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      estadoReproductivoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoReproductivo',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      estadoReproductivoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoReproductivo',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludEqualTo(
    EstadoSalud value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludGreaterThan(
    EstadoSalud value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludLessThan(
    EstadoSalud value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludBetween(
    EstadoSalud lower,
    EstadoSalud upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoSalud',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estadoSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estadoSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estadoSalud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estadoSalud',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoSalud',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSaludIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoSalud',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncStartsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncContains(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncMatches(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoSync',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> estadoSyncIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estadoSync',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasElementEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasElementLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasElementBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasElementEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasElementContains(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasElementMatches(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      etiquetasElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etiquetas',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      etiquetasElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'etiquetas',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasLengthEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasIsEmpty() {
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasIsNotEmpty() {
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasLengthLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> etiquetasLengthBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCompraIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaCompra',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCompraIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaCompra',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCompraEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCompra',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCompraGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCompra',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCompraLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCompra',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCompraBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCompra',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCreacionEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCreacionGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCreacionLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaCreacionBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaNacimientoEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaNacimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaNacimientoGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaNacimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaNacimientoLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaNacimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaNacimientoBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaNacimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaProximoCeloIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaProximoCelo',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaProximoCeloIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaProximoCelo',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaProximoCeloEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaProximoCelo',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaProximoCeloGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaProximoCelo',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaProximoCeloLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaProximoCelo',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaProximoCeloBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaProximoCelo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaProximoPartoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaProximoParto',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaProximoPartoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaProximoParto',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaProximoPartoEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaProximoParto',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaProximoPartoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaProximoParto',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaProximoPartoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaProximoParto',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaProximoPartoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaProximoParto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUbicacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaUbicacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUbicacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaUbicacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUbicacionEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaUbicacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUbicacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaUbicacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUbicacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaUbicacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUbicacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaUbicacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimaRevisionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaUltimaRevision',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimaRevisionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaUltimaRevision',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimaRevisionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaUltimaRevision',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimaRevisionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaUltimaRevision',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimaRevisionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaUltimaRevision',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimaRevisionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaUltimaRevision',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUltimoPartoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaUltimoParto',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoPartoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaUltimoParto',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUltimoPartoEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaUltimoParto',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoPartoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaUltimoParto',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUltimoPartoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaUltimoParto',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUltimoPartoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaUltimoParto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoPesajeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaUltimoPesaje',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoPesajeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaUltimoPesaje',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUltimoPesajeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaUltimoPesaje',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoPesajeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaUltimoPesaje',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUltimoPesajeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaUltimoPesaje',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fechaUltimoPesajeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaUltimoPesaje',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoServicioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaUltimoServicio',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoServicioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaUltimoServicio',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoServicioEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaUltimoServicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoServicioGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaUltimoServicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoServicioLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaUltimoServicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fechaUltimoServicioBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaUltimoServicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fotoPerfilUrl',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fotoPerfilUrl',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotoPerfilUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fotoPerfilUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fotoPerfilUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fotoPerfilUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fotoPerfilUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fotoPerfilUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fotoPerfilUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fotoPerfilUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoPerfilUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotoPerfilUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fotoPerfilUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fotoPerfilUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fotoUrl',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fotoUrl',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fotoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fotoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fotoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fotosUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fotosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fotosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fotosUrls',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fotosUrlsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fotosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fotosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fotosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fotosUrls',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fotosUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fotosUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fotosUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fotosUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotosUrls',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotosUrls',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotosUrls',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotosUrls',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      fotosUrlsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotosUrls',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fotosUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fotosUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaCardiacaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frecuenciaCardiaca',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaCardiacaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frecuenciaCardiaca',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> frecuenciaCardiacaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaCardiaca',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaCardiacaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frecuenciaCardiaca',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaCardiacaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frecuenciaCardiaca',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> frecuenciaCardiacaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frecuenciaCardiaca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaRespiratoriaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frecuenciaRespiratoria',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaRespiratoriaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frecuenciaRespiratoria',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaRespiratoriaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaRespiratoria',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaRespiratoriaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frecuenciaRespiratoria',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaRespiratoriaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frecuenciaRespiratoria',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      frecuenciaRespiratoriaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frecuenciaRespiratoria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      gananciaPromedioDiariaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gananciaPromedioDiaria',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      gananciaPromedioDiariaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gananciaPromedioDiaria',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      gananciaPromedioDiariaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gananciaPromedioDiaria',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      gananciaPromedioDiariaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gananciaPromedioDiaria',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      gananciaPromedioDiariaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gananciaPromedioDiaria',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      gananciaPromedioDiariaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gananciaPromedioDiaria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generacionEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generacionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generacionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generacionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> gestanteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gestante',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hashDatos',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hashDatos',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashDatos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashDatos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashDatos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashDatos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hashDatos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hashDatos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hashDatos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hashDatos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashDatos',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hashDatosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hashDatos',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historialModificaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historialModificaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historialModificaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historialModificaciones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'historialModificaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'historialModificaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'historialModificaciones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'historialModificaciones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historialModificaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'historialModificaciones',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialModificaciones',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialModificaciones',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialModificaciones',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialModificaciones',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialModificaciones',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      historialModificacionesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historialModificaciones',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idAreteNFC',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idAreteNFC',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAreteNFC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idAreteNFC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idAreteNFC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idAreteNFC',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idAreteNFC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idAreteNFC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idAreteNFC',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idAreteNFC',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAreteNFC',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteNFCIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idAreteNFC',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idAreteVisual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idAreteVisual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAreteVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idAreteVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idAreteVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idAreteVisual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idAreteVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idAreteVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idAreteVisual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idAreteVisual',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idAreteVisualIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAreteVisual',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      idAreteVisualIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idAreteVisual',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      ingresoGeneradoTotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ingresoGeneradoTotal',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      ingresoGeneradoTotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ingresoGeneradoTotal',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      ingresoGeneradoTotalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingresoGeneradoTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      ingresoGeneradoTotalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ingresoGeneradoTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      ingresoGeneradoTotalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ingresoGeneradoTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      ingresoGeneradoTotalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ingresoGeneradoTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitud',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitud',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> latitudBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitud',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitud',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitud',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitud',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> longitudBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitud',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nfcChipId',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nfcChipId',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nfcChipId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nfcChipId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nfcChipId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nfcChipId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nfcChipId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nfcChipId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nfcChipId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nfcChipId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nfcChipId',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nfcChipIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nfcChipId',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreStartsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notas',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasStartsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> notasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notas',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroCriasEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroCrias',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroCriasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroCrias',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroCriasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroCrias',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroCriasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroCrias',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numeroHerrado',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numeroHerrado',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroHerrado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroHerrado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroHerrado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroHerrado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numeroHerrado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numeroHerrado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numeroHerrado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numeroHerrado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroHerradoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroHerrado',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      numeroHerradoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numeroHerrado',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroPartosEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroPartos',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroPartosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroPartos',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroPartosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroPartos',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> numeroPartosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroPartos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoActualIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pesoActual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoActualIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pesoActual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoActualEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pesoActual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoActualGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pesoActual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoActualLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pesoActual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoActualBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pesoActual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoNacimientoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pesoNacimiento',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      pesoNacimientoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pesoNacimiento',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoNacimientoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pesoNacimiento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoNacimientoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pesoNacimiento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoNacimientoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pesoNacimiento',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> pesoNacimientoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pesoNacimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      produccionLecheTotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'produccionLecheTotal',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      produccionLecheTotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'produccionLecheTotal',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      produccionLecheTotalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'produccionLecheTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      produccionLecheTotalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'produccionLecheTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      produccionLecheTotalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'produccionLecheTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      produccionLecheTotalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'produccionLecheTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'programaNutricional',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'programaNutricional',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'programaNutricional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'programaNutricional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'programaNutricional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'programaNutricional',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'programaNutricional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'programaNutricional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'programaNutricional',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'programaNutricional',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'programaNutricional',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      programaNutricionalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'programaNutricional',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      promedioLecheDiarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promedioLecheDiario',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      promedioLecheDiarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promedioLecheDiario',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      promedioLecheDiarioEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promedioLecheDiario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      promedioLecheDiarioGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promedioLecheDiario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      promedioLecheDiarioLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promedioLecheDiario',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      promedioLecheDiarioBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promedioLecheDiario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'raza',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'raza',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'raza',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'raza',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'raza',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'raza',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'raza',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'raza',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'raza',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'raza',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'razaMadre',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'razaMadre',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'razaMadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'razaMadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'razaMadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'razaMadre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'razaMadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'razaMadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'razaMadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'razaMadre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'razaMadre',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaMadreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'razaMadre',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'razaPadre',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'razaPadre',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'razaPadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'razaPadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'razaPadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'razaPadre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'razaPadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'razaPadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'razaPadre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'razaPadre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'razaPadre',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> razaPadreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'razaPadre',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'registroGenealogico',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'registroGenealogico',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registroGenealogico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registroGenealogico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registroGenealogico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registroGenealogico',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'registroGenealogico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'registroGenealogico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'registroGenealogico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'registroGenealogico',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registroGenealogico',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      registroGenealogicoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'registroGenealogico',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      senasParticularesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'senasParticulares',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      senasParticularesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'senasParticulares',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> senasParticularesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senasParticulares',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      senasParticularesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senasParticulares',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> senasParticularesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senasParticulares',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> senasParticularesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senasParticulares',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      senasParticularesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senasParticulares',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> senasParticularesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senasParticulares',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> senasParticularesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senasParticulares',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> senasParticularesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senasParticulares',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      senasParticularesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senasParticulares',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      senasParticularesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senasParticulares',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serverId',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdStartsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdMatches(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> serverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverId',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoEqualTo(
    Sexo value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sexo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoGreaterThan(
    Sexo value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sexo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoLessThan(
    Sexo value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sexo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoBetween(
    Sexo lower,
    Sexo upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sexo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sexo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sexo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sexo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sexo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sexo',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> sexoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sexo',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> siniigaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siniigaId',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> siniigaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siniigaId',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> suplementosElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suplementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      suplementosElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suplementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      suplementosElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suplementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> suplementosElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suplementos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      suplementosElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'suplementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      suplementosElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'suplementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      suplementosElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'suplementos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> suplementosElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'suplementos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      suplementosElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suplementos',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      suplementosElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'suplementos',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> suplementosLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suplementos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> suplementosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suplementos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> suplementosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suplementos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> suplementosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suplementos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      suplementosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suplementos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> suplementosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suplementos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      temperaturaActualIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperaturaActual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      temperaturaActualIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperaturaActual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> temperaturaActualEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperaturaActual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      temperaturaActualGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperaturaActual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> temperaturaActualLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperaturaActual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> temperaturaActualBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperaturaActual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tipoAlimentacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipoAlimentacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      tipoAlimentacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipoAlimentacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tipoAlimentacionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoAlimentacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      tipoAlimentacionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoAlimentacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tipoAlimentacionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoAlimentacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tipoAlimentacionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoAlimentacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      tipoAlimentacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoAlimentacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tipoAlimentacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoAlimentacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tipoAlimentacionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoAlimentacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> tipoAlimentacionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoAlimentacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      tipoAlimentacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoAlimentacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      tipoAlimentacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoAlimentacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      toroUltimoServicioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'toroUltimoServicio',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      toroUltimoServicioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'toroUltimoServicio',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> toroUltimoServicioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toroUltimoServicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      toroUltimoServicioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toroUltimoServicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      toroUltimoServicioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toroUltimoServicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> toroUltimoServicioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toroUltimoServicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      toroUltimoServicioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toroUltimoServicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      toroUltimoServicioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toroUltimoServicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      toroUltimoServicioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toroUltimoServicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> toroUltimoServicioMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toroUltimoServicio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      toroUltimoServicioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toroUltimoServicio',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      toroUltimoServicioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toroUltimoServicio',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      ultimaActualizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ultimaActualizacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      ultimaActualizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ultimaActualizacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      ultimaActualizacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ultimaActualizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> usuarioCreacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usuarioCreacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioCreacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usuarioCreacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> usuarioCreacionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioCreacionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> usuarioCreacionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> usuarioCreacionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> usuarioCreacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usuarioCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> usuarioCreacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usuarioCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> usuarioCreacionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usuarioCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> usuarioCreacionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usuarioCreacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> usuarioCreacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioCreacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioCreacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usuarioCreacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usuarioModificacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usuarioModificacion',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioModificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuarioModificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuarioModificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuarioModificacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usuarioModificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usuarioModificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usuarioModificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usuarioModificacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuarioModificacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      usuarioModificacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usuarioModificacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorCompraIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valorCompra',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorCompraIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valorCompra',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorCompraEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorCompra',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorCompraGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorCompra',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorCompraLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorCompra',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorCompraBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorCompra',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorEstimadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valorEstimado',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorEstimadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valorEstimado',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorEstimadoEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorEstimadoGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorEstimadoLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorEstimado',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> valorEstimadoBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorEstimado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vendedor',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vendedor',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendedor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vendedor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vendedor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> vendedorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vendedor',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> versionLocalEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'versionLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> versionLocalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'versionLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> versionLocalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'versionLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> versionLocalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'versionLocal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'veterinarioUltimaRevision',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'veterinarioUltimaRevision',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'veterinarioUltimaRevision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'veterinarioUltimaRevision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'veterinarioUltimaRevision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'veterinarioUltimaRevision',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'veterinarioUltimaRevision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'veterinarioUltimaRevision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'veterinarioUltimaRevision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'veterinarioUltimaRevision',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'veterinarioUltimaRevision',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      veterinarioUltimaRevisionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'veterinarioUltimaRevision',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      videosUrlsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'videosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'videosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'videosUrls',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      videosUrlsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'videosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'videosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'videosUrls',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'videosUrls',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      videosUrlsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videosUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      videosUrlsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'videosUrls',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videosUrls',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videosUrls',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videosUrls',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videosUrls',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      videosUrlsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videosUrls',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> videosUrlsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'videosUrls',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'zonaActual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'zonaActual',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zonaActual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'zonaActual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'zonaActual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'zonaActual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'zonaActual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'zonaActual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'zonaActual',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'zonaActual',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zonaActual',
        value: '',
      ));
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> zonaActualIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'zonaActual',
        value: '',
      ));
    });
  }
}

extension AnimalQueryObject on QueryBuilder<Animal, Animal, QFilterCondition> {
  QueryBuilder<Animal, Animal, QAfterFilterCondition> siniigaId(
      FilterQuery<SinigaId> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'siniigaId');
    });
  }
}

extension AnimalQueryLinks on QueryBuilder<Animal, Animal, QFilterCondition> {
  QueryBuilder<Animal, Animal, QAfterFilterCondition> padre(
      FilterQuery<Animal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'padre');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> padreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'padre', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> madre(
      FilterQuery<Animal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'madre');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> madreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'madre', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> herd(
      FilterQuery<Herd> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'herd');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> herdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'herd', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventos(
      FilterQuery<EventoSanitario> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'eventos');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventosLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'eventos', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'eventos', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'eventos', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'eventos', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'eventos', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> eventosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'eventos', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> producciones(
      FilterQuery<RegistroProduccion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'producciones');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> produccionesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'producciones', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> produccionesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'producciones', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> produccionesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'producciones', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      produccionesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'producciones', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
      produccionesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'producciones', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> produccionesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'producciones', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> crias(
      FilterQuery<Animal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'crias');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> criasLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'crias', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> criasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'crias', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> criasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'crias', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> criasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'crias', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> criasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'crias', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> criasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'crias', lower, includeLower, upper, includeUpper);
    });
  }
}

extension AnimalQuerySortBy on QueryBuilder<Animal, Animal, QSortBy> {
  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCodigoBarras() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoBarras', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCodigoBarrasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoBarras', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByColorPelaje() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPelaje', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByColorPelajeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPelaje', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCompradorPotencial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compradorPotencial', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCompradorPotencialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compradorPotencial', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByConsanguinidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consanguinidad', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByConsanguinidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consanguinidad', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByConsumoDiarioKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumoDiarioKg', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByConsumoDiarioKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumoDiarioKg', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCostoMantenimientoMensual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costoMantenimientoMensual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
      sortByCostoMantenimientoMensualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costoMantenimientoMensual', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDescripcionSalud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionSalud', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDescripcionSaludDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionSalud', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDiasGestacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasGestacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByDiasGestacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasGestacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstadoReproductivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoReproductivo', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstadoReproductivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoReproductivo', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstadoSalud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSalud', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstadoSaludDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSalud', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstadoSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByEstadoSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCompra', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCompra', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaNacimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaNacimiento', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaNacimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaNacimiento', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaProximoCelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximoCelo', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaProximoCeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximoCelo', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaProximoParto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximoParto', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaProximoPartoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximoParto', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUbicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUbicacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUbicacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUbicacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUltimaRevision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimaRevision', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUltimaRevisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimaRevision', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUltimoParto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoParto', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUltimoPartoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoParto', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUltimoPesaje() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoPesaje', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUltimoPesajeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoPesaje', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUltimoServicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoServicio', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFechaUltimoServicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoServicio', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFotoPerfilUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPerfilUrl', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFotoPerfilUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPerfilUrl', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoUrl', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoUrl', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFrecuenciaCardiaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaCardiaca', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFrecuenciaCardiacaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaCardiaca', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByFrecuenciaRespiratoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRespiratoria', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
      sortByFrecuenciaRespiratoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRespiratoria', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGananciaPromedioDiaria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gananciaPromedioDiaria', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
      sortByGananciaPromedioDiariaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gananciaPromedioDiaria', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGeneracion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGeneracionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGestante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gestante', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGestanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gestante', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHashDatos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashDatos', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHashDatosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashDatos', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByIdAreteNFC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreteNFC', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByIdAreteNFCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreteNFC', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByIdAreteVisual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreteVisual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByIdAreteVisualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreteVisual', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByIngresoGeneradoTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingresoGeneradoTotal', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByIngresoGeneradoTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingresoGeneradoTotal', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLatitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLatitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLongitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByLongitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNfcChipId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nfcChipId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNfcChipIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nfcChipId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNumeroCrias() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCrias', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNumeroCriasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCrias', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNumeroHerrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroHerrado', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNumeroHerradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroHerrado', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNumeroPartos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroPartos', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByNumeroPartosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroPartos', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPesoActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoActual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPesoActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoActual', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPesoNacimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoNacimiento', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPesoNacimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoNacimiento', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByProduccionLecheTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produccionLecheTotal', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByProduccionLecheTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produccionLecheTotal', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByProgramaNutricional() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programaNutricional', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByProgramaNutricionalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programaNutricional', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPromedioLecheDiario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioLecheDiario', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPromedioLecheDiarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioLecheDiario', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRaza() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raza', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRazaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raza', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRazaMadre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razaMadre', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRazaMadreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razaMadre', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRazaPadre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razaPadre', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRazaPadreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razaPadre', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRegistroGenealogico() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registroGenealogico', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByRegistroGenealogicoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registroGenealogico', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySenasParticulares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senasParticulares', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySenasParticularesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senasParticulares', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySexo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexo', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortBySexoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexo', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByTemperaturaActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperaturaActual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByTemperaturaActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperaturaActual', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByTipoAlimentacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoAlimentacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByTipoAlimentacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoAlimentacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByToroUltimoServicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toroUltimoServicio', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByToroUltimoServicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toroUltimoServicio', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByUsuarioCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioCreacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByUsuarioCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioCreacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByUsuarioModificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioModificacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByUsuarioModificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioModificacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByValorCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorCompra', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByValorCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorCompra', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByValorEstimado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorEstimado', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByValorEstimadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorEstimado', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByVendedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByVendedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByVersionLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionLocal', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByVersionLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionLocal', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByVeterinarioUltimaRevision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinarioUltimaRevision', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
      sortByVeterinarioUltimaRevisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinarioUltimaRevision', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByZonaActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zonaActual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByZonaActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zonaActual', Sort.desc);
    });
  }
}

extension AnimalQuerySortThenBy on QueryBuilder<Animal, Animal, QSortThenBy> {
  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCodigoBarras() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoBarras', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCodigoBarrasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigoBarras', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByColorPelaje() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPelaje', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByColorPelajeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorPelaje', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCompradorPotencial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compradorPotencial', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCompradorPotencialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compradorPotencial', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByConsanguinidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consanguinidad', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByConsanguinidadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consanguinidad', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByConsumoDiarioKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumoDiarioKg', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByConsumoDiarioKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'consumoDiarioKg', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCostoMantenimientoMensual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costoMantenimientoMensual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
      thenByCostoMantenimientoMensualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costoMantenimientoMensual', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDescripcionSalud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionSalud', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDescripcionSaludDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcionSalud', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDiasGestacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasGestacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByDiasGestacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diasGestacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstadoReproductivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoReproductivo', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstadoReproductivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoReproductivo', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstadoSalud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSalud', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstadoSaludDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSalud', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstadoSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByEstadoSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSync', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCompra', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCompra', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaNacimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaNacimiento', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaNacimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaNacimiento', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaProximoCelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximoCelo', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaProximoCeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximoCelo', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaProximoParto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximoParto', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaProximoPartoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaProximoParto', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUbicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUbicacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUbicacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUbicacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUltimaRevision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimaRevision', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUltimaRevisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimaRevision', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUltimoParto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoParto', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUltimoPartoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoParto', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUltimoPesaje() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoPesaje', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUltimoPesajeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoPesaje', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUltimoServicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoServicio', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFechaUltimoServicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaUltimoServicio', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFotoPerfilUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPerfilUrl', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFotoPerfilUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoPerfilUrl', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoUrl', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fotoUrl', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFrecuenciaCardiaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaCardiaca', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFrecuenciaCardiacaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaCardiaca', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByFrecuenciaRespiratoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRespiratoria', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
      thenByFrecuenciaRespiratoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaRespiratoria', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGananciaPromedioDiaria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gananciaPromedioDiaria', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
      thenByGananciaPromedioDiariaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gananciaPromedioDiaria', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGeneracion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGeneracionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGestante() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gestante', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGestanteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gestante', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHashDatos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashDatos', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHashDatosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashDatos', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIdAreteNFC() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreteNFC', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIdAreteNFCDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreteNFC', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIdAreteVisual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreteVisual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIdAreteVisualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAreteVisual', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIngresoGeneradoTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingresoGeneradoTotal', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIngresoGeneradoTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingresoGeneradoTotal', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLatitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLatitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLongitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByLongitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNfcChipId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nfcChipId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNfcChipIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nfcChipId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNotas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNotasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notas', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNumeroCrias() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCrias', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNumeroCriasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroCrias', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNumeroHerrado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroHerrado', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNumeroHerradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroHerrado', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNumeroPartos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroPartos', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByNumeroPartosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroPartos', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPesoActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoActual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPesoActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoActual', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPesoNacimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoNacimiento', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPesoNacimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pesoNacimiento', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByProduccionLecheTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produccionLecheTotal', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByProduccionLecheTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produccionLecheTotal', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByProgramaNutricional() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programaNutricional', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByProgramaNutricionalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'programaNutricional', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPromedioLecheDiario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioLecheDiario', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPromedioLecheDiarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promedioLecheDiario', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRaza() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raza', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRazaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raza', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRazaMadre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razaMadre', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRazaMadreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razaMadre', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRazaPadre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razaPadre', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRazaPadreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'razaPadre', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRegistroGenealogico() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registroGenealogico', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByRegistroGenealogicoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registroGenealogico', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySenasParticulares() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senasParticulares', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySenasParticularesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senasParticulares', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByServerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByServerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySexo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexo', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenBySexoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sexo', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByTemperaturaActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperaturaActual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByTemperaturaActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperaturaActual', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByTipoAlimentacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoAlimentacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByTipoAlimentacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoAlimentacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByToroUltimoServicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toroUltimoServicio', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByToroUltimoServicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toroUltimoServicio', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByUltimaActualizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaActualizacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByUsuarioCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioCreacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByUsuarioCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioCreacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByUsuarioModificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioModificacion', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByUsuarioModificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuarioModificacion', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByValorCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorCompra', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByValorCompraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorCompra', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByValorEstimado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorEstimado', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByValorEstimadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorEstimado', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByVendedor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByVendedorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendedor', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByVersionLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionLocal', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByVersionLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionLocal', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByVeterinarioUltimaRevision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinarioUltimaRevision', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy>
      thenByVeterinarioUltimaRevisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'veterinarioUltimaRevision', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByZonaActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zonaActual', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByZonaActualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zonaActual', Sort.desc);
    });
  }
}

extension AnimalQueryWhereDistinct on QueryBuilder<Animal, Animal, QDistinct> {
  QueryBuilder<Animal, Animal, QDistinct> distinctByCodigoBarras(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codigoBarras', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByColorPelaje(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorPelaje', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByCompradorPotencial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compradorPotencial',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByConsanguinidad() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consanguinidad');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByConsumoDiarioKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'consumoDiarioKg');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct>
      distinctByCostoMantenimientoMensual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costoMantenimientoMensual');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDescripcionSalud(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcionSalud',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDiasGestacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasGestacion');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByDocumentosUrls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentosUrls');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByEstadoReproductivo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoReproductivo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByEstadoSalud(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoSalud', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByEstadoSync(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoSync', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByEtiquetas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etiquetas');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCompra');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaNacimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaNacimiento');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaProximoCelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaProximoCelo');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaProximoParto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaProximoParto');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaUbicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaUbicacion');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaUltimaRevision() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaUltimaRevision');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaUltimoParto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaUltimoParto');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaUltimoPesaje() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaUltimoPesaje');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFechaUltimoServicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaUltimoServicio');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFotoPerfilUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fotoPerfilUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFotoUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fotoUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFotosUrls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fotosUrls');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFrecuenciaCardiaca() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frecuenciaCardiaca');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByFrecuenciaRespiratoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frecuenciaRespiratoria');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByGananciaPromedioDiaria() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gananciaPromedioDiaria');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByGeneracion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generacion');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByGestante() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gestante');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByHashDatos(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashDatos', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByHistorialModificaciones() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'historialModificaciones');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByIdAreteNFC(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAreteNFC', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByIdAreteVisual(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAreteVisual',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByIngresoGeneradoTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingresoGeneradoTotal');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLatitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitud');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByLongitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitud');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNfcChipId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nfcChipId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNotas(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNumeroCrias() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroCrias');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNumeroHerrado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroHerrado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByNumeroPartos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroPartos');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByPesoActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pesoActual');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByPesoNacimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pesoNacimiento');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByProduccionLecheTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'produccionLecheTotal');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByProgramaNutricional(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'programaNutricional',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByPromedioLecheDiario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promedioLecheDiario');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByRaza(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'raza', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByRazaMadre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'razaMadre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByRazaPadre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'razaPadre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByRegistroGenealogico(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registroGenealogico',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctBySenasParticulares(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senasParticulares',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByServerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctBySexo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sexo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctBySuplementos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suplementos');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByTemperaturaActual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperaturaActual');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByTipoAlimentacion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoAlimentacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByToroUltimoServicio(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toroUltimoServicio',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByUltimaActualizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ultimaActualizacion');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByUsuarioCreacion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioCreacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByUsuarioModificacion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuarioModificacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByValorCompra() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorCompra');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByValorEstimado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorEstimado');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByVendedor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendedor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByVersionLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'versionLocal');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByVeterinarioUltimaRevision(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'veterinarioUltimaRevision',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByVideosUrls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'videosUrls');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByZonaActual(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zonaActual', caseSensitive: caseSensitive);
    });
  }
}

extension AnimalQueryProperty on QueryBuilder<Animal, Animal, QQueryProperty> {
  QueryBuilder<Animal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> codigoBarrasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codigoBarras');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> colorPelajeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorPelaje');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> compradorPotencialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compradorPotencial');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> consanguinidadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consanguinidad');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> consumoDiarioKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'consumoDiarioKg');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations>
      costoMantenimientoMensualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costoMantenimientoMensual');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> descripcionSaludProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcionSalud');
    });
  }

  QueryBuilder<Animal, int?, QQueryOperations> diasGestacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasGestacion');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations>
      documentosUrlsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentosUrls');
    });
  }

  QueryBuilder<Animal, EstadoAnimal, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Animal, EstadoReproductivo?, QQueryOperations>
      estadoReproductivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoReproductivo');
    });
  }

  QueryBuilder<Animal, EstadoSalud, QQueryOperations> estadoSaludProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoSalud');
    });
  }

  QueryBuilder<Animal, EstadoSync, QQueryOperations> estadoSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoSync');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> etiquetasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etiquetas');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> fechaCompraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCompra');
    });
  }

  QueryBuilder<Animal, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Animal, DateTime, QQueryOperations> fechaNacimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaNacimiento');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> fechaProximoCeloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaProximoCelo');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations>
      fechaProximoPartoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaProximoParto');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> fechaUbicacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaUbicacion');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations>
      fechaUltimaRevisionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaUltimaRevision');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations> fechaUltimoPartoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaUltimoParto');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations>
      fechaUltimoPesajeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaUltimoPesaje');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations>
      fechaUltimoServicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaUltimoServicio');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> fotoPerfilUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fotoPerfilUrl');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> fotoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fotoUrl');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> fotosUrlsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fotosUrls');
    });
  }

  QueryBuilder<Animal, int?, QQueryOperations> frecuenciaCardiacaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frecuenciaCardiaca');
    });
  }

  QueryBuilder<Animal, int?, QQueryOperations>
      frecuenciaRespiratoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frecuenciaRespiratoria');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations>
      gananciaPromedioDiariaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gananciaPromedioDiaria');
    });
  }

  QueryBuilder<Animal, int?, QQueryOperations> generacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generacion');
    });
  }

  QueryBuilder<Animal, bool, QQueryOperations> gestanteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gestante');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> hashDatosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashDatos');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations>
      historialModificacionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'historialModificaciones');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> idAreteNFCProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAreteNFC');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> idAreteVisualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAreteVisual');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations>
      ingresoGeneradoTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingresoGeneradoTotal');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> latitudProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitud');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> longitudProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitud');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> nfcChipIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nfcChipId');
    });
  }

  QueryBuilder<Animal, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> notasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notas');
    });
  }

  QueryBuilder<Animal, int, QQueryOperations> numeroCriasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroCrias');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> numeroHerradoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroHerrado');
    });
  }

  QueryBuilder<Animal, int, QQueryOperations> numeroPartosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroPartos');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> pesoActualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pesoActual');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> pesoNacimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pesoNacimiento');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations>
      produccionLecheTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'produccionLecheTotal');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations>
      programaNutricionalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'programaNutricional');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations>
      promedioLecheDiarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promedioLecheDiario');
    });
  }

  QueryBuilder<Animal, String, QQueryOperations> razaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'raza');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> razaMadreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'razaMadre');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> razaPadreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'razaPadre');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations>
      registroGenealogicoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registroGenealogico');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> senasParticularesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senasParticulares');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> serverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverId');
    });
  }

  QueryBuilder<Animal, Sexo, QQueryOperations> sexoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sexo');
    });
  }

  QueryBuilder<Animal, SinigaId?, QQueryOperations> siniigaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siniigaId');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> suplementosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suplementos');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> temperaturaActualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperaturaActual');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> tipoAlimentacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoAlimentacion');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> toroUltimoServicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toroUltimoServicio');
    });
  }

  QueryBuilder<Animal, DateTime?, QQueryOperations>
      ultimaActualizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ultimaActualizacion');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> usuarioCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioCreacion');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations>
      usuarioModificacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuarioModificacion');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> valorCompraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorCompra');
    });
  }

  QueryBuilder<Animal, double?, QQueryOperations> valorEstimadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorEstimado');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> vendedorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendedor');
    });
  }

  QueryBuilder<Animal, int, QQueryOperations> versionLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionLocal');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations>
      veterinarioUltimaRevisionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'veterinarioUltimaRevision');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> videosUrlsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videosUrls');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> zonaActualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zonaActual');
    });
  }
}
