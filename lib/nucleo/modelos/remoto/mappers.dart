import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/herd_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/modelos/remoto/dtos.dart';

// Utilidades de mapeo Remoto (Firestore DTOs) <-> Local (Isar)

Sexo sexoFromRemote(String s) {
  final t = s.toLowerCase();
  if (t.startsWith('m')) return Sexo.macho;
  return Sexo.hembra;
}

String sexoToRemote(Sexo s) => s == Sexo.macho ? 'Macho' : 'Hembra';

EstadoAnimal estadoFromRemote(String s) {
  switch (s.toLowerCase()) {
    case 'vendido':
      return EstadoAnimal.vendido;
    case 'muerto':
      return EstadoAnimal.muerto;
    default:
      return EstadoAnimal.activo;
  }
}

String estadoToRemote(EstadoAnimal e) {
  switch (e) {
    case EstadoAnimal.vendido:
      return 'Vendido';
    case EstadoAnimal.muerto:
      return 'Muerto';
    case EstadoAnimal.activo:
      return 'Activo';
  }
}

TipoEvento? tipoEventoFromRemote(String s) {
  final t = s.toLowerCase();
  if (t.startsWith('vac')) return TipoEvento.vacuna;
  if (t.startsWith('desp')) return TipoEvento.desparasitante;
  if (t.startsWith('trat')) return TipoEvento.tratamiento;
  if (t.startsWith('part')) return TipoEvento.parto;
  if (t.startsWith('pesa')) return TipoEvento.pesaje;
  return null; // chequeos u otros no modelados localmente
}

String tipoEventoToRemote(TipoEvento t) {
  switch (t) {
    case TipoEvento.vacuna:
      return 'Vacunación';
    case TipoEvento.desparasitante:
      return 'Desparasitación';
    case TipoEvento.tratamiento:
      return 'Tratamiento';
    case TipoEvento.parto:
      return 'Parto';
    case TipoEvento.pesaje:
      return 'Pesaje';
  }
}

CattleDto animalToDto(Animal a) => CattleDto(
  visualId: a.idAreteSINIIGA ?? '',
  name: a.nombre,
  breed: a.raza,
  birthDate: a.fechaNacimiento,
  gender: sexoToRemote(a.sexo),
  status: estadoToRemote(a.estado),
  photoUrl: a.fotoUrl,
  notes: a.notas,
  lastUpdated: a.ultimaActualizacion ?? DateTime.now().toUtc(),
);

void applyDtoToAnimal(Animal a, CattleDto d) {
  a.idAreteSINIIGA = d.visualId.isEmpty ? null : d.visualId;
  a.nombre = d.name;
  a.raza = d.breed;
  a.fechaNacimiento = d.birthDate.toLocal();
  a.sexo = sexoFromRemote(d.gender);
  a.estado = estadoFromRemote(d.status);
  a.fotoUrl = d.photoUrl;
  a.notas = d.notes;
  a.ultimaActualizacion = d.lastUpdated.toLocal();
}

HerdDto herdToDto(Herd h) => HerdDto(
  name: h.nombre,
  ownerUid: h.ownerUid,
  state: h.estado,
  municipality: h.municipio,
  totalCattleCount: h.totalCattleCount,
);

void applyDtoToHerd(Herd h, HerdDto d) {
  h.nombre = d.name;
  h.ownerUid = d.ownerUid;
  h.estado = d.state;
  h.municipio = d.municipality;
  h.totalCattleCount = d.totalCattleCount;
  h.ultimaActualizacion = DateTime.now();
}

HealthRecordDto eventoToDto(EventoSanitario e) => HealthRecordDto(
  eventType: tipoEventoToRemote(e.tipo),
  productName: e.nombreProducto,
  dose: e.dosis ?? '',
  vetInCharge: '',
  notes: e.notas,
  eventDate: e.fecha,
);

void applyDtoToEvento(EventoSanitario e, HealthRecordDto d) {
  e.tipo = tipoEventoFromRemote(d.eventType) ?? TipoEvento.tratamiento;
  e.nombreProducto = d.productName;
  e.dosis = d.dose.isEmpty ? null : d.dose;
  e.notas = d.notes;
  e.fecha = d.eventDate.toLocal();
  e.ultimaActualizacion = DateTime.now();
}

ProductionRecordDto produccionToDto(RegistroProduccion r) => ProductionRecordDto(
  eventType: r.tipo,
  eventDate: r.fecha,
  offspringId: r.idCria,
  weightKg: r.pesoKg,
  litersPerDay: r.litrosPorDia,
  notes: r.notas,
);

void applyDtoToProduccion(RegistroProduccion r, ProductionRecordDto d) {
  r.tipo = d.eventType;
  r.fecha = d.eventDate.toLocal();
  r.idCria = d.offspringId;
  r.pesoKg = d.weightKg?.toDouble();
  r.litrosPorDia = d.litersPerDay?.toDouble();
  r.notas = d.notes;
  r.ultimaActualizacion = DateTime.now();
}
