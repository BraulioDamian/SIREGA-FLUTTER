import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
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
    for (final nombreVacuna in formController.vacunasAplicadas) {
      final evento = EventoSanitario()
        ..tipo = TipoEvento.vacuna
        ..fecha = formController.fechasVacunas[nombreVacuna] ?? DateTime.now()
        ..nombreProducto = nombreVacuna
        ..notas = null
        ..prioridad = Prioridad.media;

      await isarService.guardarEvento(evento, animal);
    }
  }

  Future<void> guardarEventosMedicos(Animal animal) async {
    for (final eventoData in formController.eventosMedicos) {
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
    for (final partoData in formController.registrosPartos) {
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
    for (final pesajeData in formController.registrosPesajes) {
      final registro = RegistroProduccion()
        ..tipo = 'Pesaje'
        ..fecha = pesajeData['fecha'] as DateTime
        ..pesoKg = pesajeData['peso'] as double
        ..notas = pesajeData['notas'] as String?;

      await isarService.guardarRegistroProduccion(registro, animal);
    }
  }

  Future<void> guardarProduccionLeche(Animal animal) async {
    for (final produccionData in formController.registrosProduccionLeche) {
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
