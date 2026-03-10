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

  Future<void> guardarRegistrosRelacionados(Animal animal) async {
    await guardarVacunas(animal);
    await guardarEventosMedicos(animal);
    await guardarHistorialPartos(animal);
    await guardarPesajes(animal);
    await guardarProduccionLeche(animal);
    await actualizarCamposCalculados(animal);
  }

  Future<void> guardarVacunas(Animal animal) async {
    final esEdicion = formController.isEditMode;

    if (esEdicion) {
      await _guardarVacunasEdicion(animal);
    } else {
      await _guardarVacunasNuevo(animal);
    }
  }

  /// Crea eventos de vacuna para un animal nuevo (todos son nuevos)
  Future<void> _guardarVacunasNuevo(Animal animal) async {
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

      await isarService.guardarEvento(evento, animal);
    }
  }

  /// En edición: solo crea vacunas nuevas y elimina las que se desmarcaron
  Future<void> _guardarVacunasEdicion(Animal animal) async {
    final originales = formController.vacunasOriginales;
    final actuales = formController.vacunasAplicadas.toSet();

    // 1. Vacunas NUEVAS (marcadas ahora pero no existían antes)
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

      await isarService.guardarEvento(evento, animal);
    }

    // 2. Vacunas ELIMINADAS (existían antes pero se desmarcaron)
    final eliminadas = originales.difference(actuales);
    if (eliminadas.isNotEmpty) {
      final eventos = await isarService.obtenerEventosPorAnimal(animal.id);
      for (final evento in eventos) {
        if (evento.tipo == TipoEvento.vacuna && eliminadas.contains(evento.nombreProducto)) {
          await isarService.eliminarEventoSanitario(evento.id);
        }
      }
    }
  }

  Future<void> guardarEventosMedicos(Animal animal) async {
    if (formController.isEditMode) {
      // Eliminar originales que fueron removidos de la lista
      final idsActuales = formController.eventosMedicos
          .where((e) => e['isarId'] != null)
          .map((e) => e['isarId'] as int)
          .toSet();
      final idsEliminados = formController.idsOriginalesEventosMedicos
          .difference(idsActuales)
          .toList();
      if (idsEliminados.isNotEmpty) {
        await isarService.eliminarEventosSanitarios(idsEliminados);
      }
    }

    // Solo crear registros nuevos (sin isarId)
    for (final eventoData in formController.eventosMedicos) {
      if (eventoData['isarId'] != null) continue; // Original, ya existe en DB

      final tipoStr = eventoData['tipo'] as String;

      TipoEvento tipo;
      switch (tipoStr) {
        case 'desparasitacion':
          tipo = TipoEvento.desparasitante;
          break;
        case 'tratamiento':
          tipo = TipoEvento.tratamiento;
          break;
        case 'diagnostico':
          tipo = TipoEvento.revisionVeterinaria;
          break;
        case 'cirugia':
          tipo = TipoEvento.castracion;
          break;
        default:
          tipo = TipoEvento.tratamiento;
      }

      final evento = EventoSanitario()
        ..tipo = tipo
        ..fecha = eventoData['fecha'] as DateTime
        ..nombreProducto = eventoData['producto'] as String
        ..notas = eventoData['notas'] as String?
        ..prioridad = Prioridad.media;

      await isarService.guardarEvento(evento, animal);
    }
  }

  Future<void> guardarHistorialPartos(Animal animal) async {
    if (formController.isEditMode) {
      final idsActuales = formController.registrosPartos
          .where((e) => e['isarId'] != null)
          .map((e) => e['isarId'] as int)
          .toSet();
      final idsEliminados = formController.idsOriginalesPartos
          .difference(idsActuales)
          .toList();
      if (idsEliminados.isNotEmpty) {
        await isarService.eliminarRegistrosProduccion(idsEliminados);
      }
    }

    for (final partoData in formController.registrosPartos) {
      if (partoData['isarId'] != null) continue;

      final sexoCria = partoData['sexoCria'] as Sexo?;
      final notasOriginales = partoData['notas'] as String?;

      String? notasCompletas = notasOriginales;
      if (sexoCria != null) {
        final sexoStr = sexoCria == Sexo.macho ? 'Macho' : 'Hembra';
        notasCompletas = notasOriginales != null
            ? 'Sexo: $sexoStr. $notasOriginales'
            : 'Sexo: $sexoStr';
      }

      final registro = RegistroProduccion()
        ..tipo = 'Parto'
        ..fecha = partoData['fecha'] as DateTime
        ..idCria = partoData['idCria'] as String?
        ..pesoKg = partoData['pesoKg'] as double?
        ..notas = notasCompletas;

      await isarService.guardarRegistroProduccion(registro, animal);
    }
  }

  Future<void> guardarPesajes(Animal animal) async {
    if (formController.isEditMode) {
      final idsActuales = formController.registrosPesajes
          .where((e) => e['isarId'] != null)
          .map((e) => e['isarId'] as int)
          .toSet();
      final idsEliminados = formController.idsOriginalesPesajes
          .difference(idsActuales)
          .toList();
      if (idsEliminados.isNotEmpty) {
        await isarService.eliminarRegistrosProduccion(idsEliminados);
      }
    }

    for (final pesajeData in formController.registrosPesajes) {
      if (pesajeData['isarId'] != null) continue;

      final registro = RegistroProduccion()
        ..tipo = 'Pesaje'
        ..fecha = pesajeData['fecha'] as DateTime
        ..pesoKg = pesajeData['peso'] as double
        ..notas = pesajeData['notas'] as String?;

      await isarService.guardarRegistroProduccion(registro, animal);
    }
  }

  Future<void> guardarProduccionLeche(Animal animal) async {
    if (formController.isEditMode) {
      final idsActuales = formController.registrosProduccionLeche
          .where((e) => e['isarId'] != null)
          .map((e) => e['isarId'] as int)
          .toSet();
      final idsEliminados = formController.idsOriginalesProduccionLeche
          .difference(idsActuales)
          .toList();
      if (idsEliminados.isNotEmpty) {
        await isarService.eliminarRegistrosProduccion(idsEliminados);
      }
    }

    for (final produccionData in formController.registrosProduccionLeche) {
      if (produccionData['isarId'] != null) continue;

      final registro = RegistroProduccion()
        ..tipo = 'Producción de Leche'
        ..fecha = produccionData['fecha'] as DateTime
        ..litrosPorDia = produccionData['litros'] as double
        ..notas = produccionData['notas'] as String?;

      await isarService.guardarRegistroProduccion(registro, animal);
    }
  }

  Future<void> actualizarCamposCalculados(Animal animal) async {
    final registros = await isarService.obtenerProduccionPorAnimal(animal.id);

    final pesajes = registros.where((r) => r.tipo == 'Pesaje').toList();
    final produccionLeche = registros.where((r) => r.tipo == 'Producción de Leche').toList();

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

    final partos = registros.where((r) => r.tipo == 'Parto').toList();
    if (partos.isNotEmpty) {
      animal.numeroPartos = partos.length;
      partos.sort((a, b) => b.fecha.compareTo(a.fecha));
      animal.fechaUltimoParto = partos.first.fecha;
    }

    await isarService.guardarAnimal(animal);
  }
}
