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
  if (t.startsWith('c')) return Sexo.castrado;
  return Sexo.hembra;
}

String sexoToRemote(Sexo s) {
  switch (s) {
    case Sexo.macho:
      return 'Macho';
    case Sexo.hembra:
      return 'Hembra';
    case Sexo.castrado:
      return 'Castrado';
  }
}

EstadoAnimal estadoFromRemote(String s) {
  switch (s.toLowerCase()) {
    case 'vendido':
      return EstadoAnimal.vendido;
    case 'muerto':
      return EstadoAnimal.muerto;
    case 'perdido':
      return EstadoAnimal.perdido;
    case 'enfermo':
      return EstadoAnimal.enfermo;
    case 'cuarentena':
      return EstadoAnimal.cuarentena;
    case 'prestado':
      return EstadoAnimal.prestado;
    case 'en transito':
      return EstadoAnimal.enTransito;
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
    case EstadoAnimal.perdido:
      return 'Perdido';
    case EstadoAnimal.enfermo:
      return 'Enfermo';
    case EstadoAnimal.cuarentena:
      return 'Cuarentena';
    case EstadoAnimal.prestado:
      return 'Prestado';
    case EstadoAnimal.enTransito:
      return 'En Transito';
  }
}

TipoEvento? tipoEventoFromRemote(String s) {
  final t = s.toLowerCase();
  if (t.startsWith('vac')) return TipoEvento.vacuna;
  if (t.startsWith('desp')) return TipoEvento.desparasitante;
  if (t.startsWith('trat')) return TipoEvento.tratamiento;
  if (t.startsWith('part')) return TipoEvento.parto;
  if (t.startsWith('pesa')) return TipoEvento.pesaje;
  if (t.startsWith('insem')) return TipoEvento.inseminacion;
  if (t.startsWith('diag')) return TipoEvento.diagnosticoGestacion;
  if (t.startsWith('cast')) return TipoEvento.castracion;
  if (t.startsWith('desc')) return TipoEvento.descorne;
  if (t.startsWith('herr')) return TipoEvento.herraje;
  if (t.startsWith('revis')) return TipoEvento.revisionVeterinaria;
  if (t.startsWith('mues')) return TipoEvento.muestraLaboratorio;
  if (t.startsWith('camb')) return TipoEvento.cambioAlimentacion;
  if (t.startsWith('mov')) return TipoEvento.movimiento;
  if (t.startsWith('vent')) return TipoEvento.venta;
  if (t.startsWith('comp')) return TipoEvento.compra;
  if (t.startsWith('muer')) return TipoEvento.muerte;
  if (t.startsWith('otr')) return TipoEvento.otro;
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
    case TipoEvento.inseminacion:
      return 'Inseminación';
    case TipoEvento.diagnosticoGestacion:
      return 'Diagnóstico de Gestación';
    case TipoEvento.castracion:
      return 'Castración';
    case TipoEvento.descorne:
      return 'Descorne';
    case TipoEvento.herraje:
      return 'Herraje';
    case TipoEvento.revisionVeterinaria:
      return 'Revisión Veterinaria';
    case TipoEvento.muestraLaboratorio:
      return 'Muestra de Laboratorio';
    case TipoEvento.cambioAlimentacion:
      return 'Cambio de Alimentación';
    case TipoEvento.movimiento:
      return 'Movimiento';
    case TipoEvento.venta:
      return 'Venta';
    case TipoEvento.compra:
      return 'Compra';
    case TipoEvento.muerte:
      return 'Muerte';
    case TipoEvento.otro:
      return 'Otro';
  }
}

CattleDto animalToDto(Animal a) => CattleDto(
  visualId: a.idAreteVisual ?? '',
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
  a.idAreteVisual = d.visualId.isEmpty ? null : d.visualId;
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
  productName: e.nombreProducto ?? '',
  dose: e.dosis ?? '',
  vetInCharge: e.veterinario ?? '',
  notes: e.notas,
  eventDate: e.fecha,
);

void applyDtoToEvento(EventoSanitario e, HealthRecordDto d) {
  e.tipo = tipoEventoFromRemote(d.eventType) ?? TipoEvento.tratamiento;
  e.nombreProducto = d.productName;
  e.dosis = d.dose;
  e.veterinario = d.vetInCharge;
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
