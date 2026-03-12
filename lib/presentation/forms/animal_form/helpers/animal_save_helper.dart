import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/catalogo_vacunas.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/presentation/forms/animal_form/controllers/animal_form_controller.dart';

class AnimalSaveHelper {
  final IsarService isarService;
  final AnimalFormController formController;

  const AnimalSaveHelper({
    required this.isarService,
    required this.formController,
  });

  Future<void> saveRelatedRecords(Animal animal) async {
    await saveVaccines(animal);
    await saveMedicalEvents(animal);
    await saveBirthHistory(animal);
    await saveWeights(animal);
    await saveMilkProduction(animal);
    await updateCalculatedFields(animal);
  }

  Future<void> saveVaccines(Animal animal) async {
    if (formController.isEditMode) {
      await _saveVaccinesEdit(animal);
    } else {
      await _saveVaccinesNew(animal);
    }
  }

  Future<void> _saveVaccinesNew(Animal animal) async {
    for (final nombreVacuna in formController.vacunasAplicadas) {
      final vacunaInfo = CatalogoVacunas.buscarPorNombre(nombreVacuna);
      final fechaAplicacion = formController.fechasVacunas[nombreVacuna] ?? DateTime.now();

      final evento = EventoSanitario()
        ..tipo = TipoEvento.vacuna
        ..fecha = fechaAplicacion
        ..nombreProducto = nombreVacuna
        ..esAplicacionUnica = vacunaInfo?.esAplicacionUnica ?? false
        ..intervaloDiasRecomendado = vacunaInfo?.intervaloDias
        ..fechaProximaAplicacion = vacunaInfo?.proximaAplicacion(fechaAplicacion)
        ..notas = null
        ..prioridad = Prioridad.media;

      await isarService.saveEvent(evento, animal);
    }
  }

  Future<void> _saveVaccinesEdit(Animal animal) async {
    final originales = formController.vacunasOriginales;
    final actuales = formController.vacunasAplicadas.toSet();

    // New vaccines
    final nuevas = actuales.difference(originales);
    for (final nombreVacuna in nuevas) {
      final vacunaInfo = CatalogoVacunas.buscarPorNombre(nombreVacuna);
      final fechaAplicacion = formController.fechasVacunas[nombreVacuna] ?? DateTime.now();

      final evento = EventoSanitario()
        ..tipo = TipoEvento.vacuna
        ..fecha = fechaAplicacion
        ..nombreProducto = nombreVacuna
        ..esAplicacionUnica = vacunaInfo?.esAplicacionUnica ?? false
        ..intervaloDiasRecomendado = vacunaInfo?.intervaloDias
        ..fechaProximaAplicacion = vacunaInfo?.proximaAplicacion(fechaAplicacion)
        ..notas = null
        ..prioridad = Prioridad.media;

      await isarService.saveEvent(evento, animal);
    }

    // Removed vaccines
    final eliminadas = originales.difference(actuales);
    if (eliminadas.isNotEmpty) {
      final eventos = await isarService.getEventsByAnimal(animal.id);
      for (final evento in eventos) {
        if (evento.tipo == TipoEvento.vacuna && eliminadas.contains(evento.nombreProducto)) {
          await isarService.deleteHealthEvent(evento.id);
        }
      }
    }
  }

  Future<void> saveMedicalEvents(Animal animal) async {
    if (formController.isEditMode) {
      final currentIds = formController.medicalEvents
          .where((e) => e.isarId != null)
          .map((e) => e.isarId!)
          .toSet();
      final deletedIds = formController.originalMedicalEventIds
          .difference(currentIds)
          .toList();
      if (deletedIds.isNotEmpty) {
        await isarService.deleteHealthEvents(deletedIds);
      }
    }

    for (final record in formController.medicalEvents) {
      if (record.isarId != null) continue; // Already exists in DB

      final evento = EventoSanitario()
        ..tipo = record.eventType
        ..fecha = record.date
        ..nombreProducto = record.product
        ..notas = record.notes
        ..prioridad = Prioridad.media;

      await isarService.saveEvent(evento, animal);
    }
  }

  Future<void> saveBirthHistory(Animal animal) async {
    if (formController.isEditMode) {
      final currentIds = formController.birthRecords
          .where((e) => e.isarId != null)
          .map((e) => e.isarId!)
          .toSet();
      final deletedIds = formController.originalBirthIds
          .difference(currentIds)
          .toList();
      if (deletedIds.isNotEmpty) {
        await isarService.deleteProductionRecords(deletedIds);
      }
    }

    for (final record in formController.birthRecords) {
      if (record.isarId != null) continue;

      final registro = RegistroProduccion()
        ..tipo = ProductionType.birth
        ..fecha = record.date
        ..idCria = record.offspringId
        ..pesoKg = record.weightKg
        ..sexoCria = record.offspringSex
        ..notas = record.notes;

      await isarService.saveProductionRecord(registro, animal);
    }
  }

  Future<void> saveWeights(Animal animal) async {
    if (formController.isEditMode) {
      final currentIds = formController.weightRecords
          .where((e) => e.isarId != null)
          .map((e) => e.isarId!)
          .toSet();
      final deletedIds = formController.originalWeightIds
          .difference(currentIds)
          .toList();
      if (deletedIds.isNotEmpty) {
        await isarService.deleteProductionRecords(deletedIds);
      }
    }

    for (final record in formController.weightRecords) {
      if (record.isarId != null) continue;

      final registro = RegistroProduccion()
        ..tipo = ProductionType.weight
        ..fecha = record.date
        ..pesoKg = record.weightKg
        ..notas = record.notes;

      await isarService.saveProductionRecord(registro, animal);
    }
  }

  Future<void> saveMilkProduction(Animal animal) async {
    if (formController.isEditMode) {
      final currentIds = formController.milkRecords
          .where((e) => e.isarId != null)
          .map((e) => e.isarId!)
          .toSet();
      final deletedIds = formController.originalMilkIds
          .difference(currentIds)
          .toList();
      if (deletedIds.isNotEmpty) {
        await isarService.deleteProductionRecords(deletedIds);
      }
    }

    for (final record in formController.milkRecords) {
      if (record.isarId != null) continue;

      final registro = RegistroProduccion()
        ..tipo = ProductionType.milk
        ..fecha = record.date
        ..litrosPorDia = record.litersPerDay
        ..notas = record.notes;

      await isarService.saveProductionRecord(registro, animal);
    }
  }

  Future<void> updateCalculatedFields(Animal animal) async {
    final registros = await isarService.getProductionByAnimal(animal.id);

    final pesajes = registros.where((r) => r.tipo == ProductionType.weight).toList();
    final produccionLeche = registros.where((r) => r.tipo == ProductionType.milk).toList();

    if (pesajes.isNotEmpty) {
      pesajes.sort((a, b) => b.fecha.compareTo(a.fecha));
      final ultimoPesaje = pesajes.first;
      animal.pesoActual = ultimoPesaje.pesoKg;
      animal.fechaUltimoPesaje = ultimoPesaje.fecha;
    }

    if (produccionLeche.isNotEmpty) {
      double totalLeche = 0;
      for (final registro in produccionLeche) {
        totalLeche += registro.litrosPorDia ?? 0;
      }
      animal.produccionLecheTotal = totalLeche;
      animal.promedioLecheDiario = totalLeche / produccionLeche.length;
    }

    final partos = registros.where((r) => r.tipo == ProductionType.birth).toList();
    if (partos.isNotEmpty) {
      animal.numeroPartos = partos.length;
      partos.sort((a, b) => b.fecha.compareTo(a.fecha));
      animal.fechaUltimoParto = partos.first.fecha;
    }

    await isarService.saveAnimal(animal);
  }
}
