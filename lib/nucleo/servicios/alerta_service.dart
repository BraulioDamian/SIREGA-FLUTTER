// lib/nucleo/servicios/alerta_service.dart
import 'dart:async';
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/alerta.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/configuracion_local.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

class AlertaService {
  static final AlertaService _instance = AlertaService._internal();
  factory AlertaService() => _instance;
  AlertaService._internal();

  Timer? _checkTimer;
  final _alertasController = StreamController<List<Alerta>>.broadcast();

  Stream<List<Alerta>> get alertasStream => _alertasController.stream;

  // Inicializar servicio de alertas
  Future<void> initialize() async {
    // Verificar alertas cada hora
    _checkTimer = Timer.periodic(
      const Duration(hours: 1),
      (_) => verificarAlertas(),
    );

    // Verificación inicial
    await verificarAlertas();
  }

  // Verificar y generar alertas
  Future<void> verificarAlertas() async {
    final config = await _getConfiguration();

    // Verificar vacunaciones pendientes
    if (config.notificacionesVacunas) {
      await _verificarVacunaciones(config.diasAnticipacionVacunas);
    }

    // Verificar desparasitaciones pendientes
    await _verificarDesparasitaciones(config.diasAnticipacionDesparasitante);

    // Verificar partos próximos
    if (config.notificacionesPartos) {
      await _verificarPartosProximos(config.diasAnticipacionParto);
    }

    // Verificar animales enfermos
    await _verificarAnimalesEnfermos();

    // Verificar stock de medicamentos
    if (config.alertasStockMedicamentos) {
      await _verificarStockMedicamentos(config.umbralMinimoMedicamentos);
    }

    // Emitir alertas activas
    await _emitirAlertasActivas();
  }

  // Verificar vacunaciones pendientes
  Future<void> _verificarVacunaciones(int diasAnticipacion) async {
    final animales = await IsarService.isar.animals
        .filter()
        .estadoEqualTo(EstadoAnimal.activo)
        .findAll();

    for (final animal in animales) {
      // Cargar eventos del animal
      await animal.eventos.load();

      // Buscar última vacunación
      final ultimaVacuna = animal.eventos
          .where((e) => e.tipo == TipoEvento.vacuna)
          .fold<EventoSanitario?>(
            null,
            (prev, curr) =>
                prev == null || curr.fecha.isAfter(prev.fecha) ? curr : prev,
          );

      // Determinar si necesita vacunación
      bool necesitaVacuna = false;
      String tipoVacuna = '';
      DateTime? fechaProgramada;

      if (ultimaVacuna == null) {
        // Nunca ha sido vacunado
        necesitaVacuna = true;
        tipoVacuna = 'Vacunación inicial';
        fechaProgramada = DateTime.now();
      } else {
        // Calcular próxima vacunación según el tipo
        final diasDesdeUltima = DateTime.now()
            .difference(ultimaVacuna.fecha)
            .inDays;

        // Lógica simplificada: revacunar cada 6 meses
        if (diasDesdeUltima >= 180 - diasAnticipacion) {
          necesitaVacuna = true;
          tipoVacuna = 'Revacunación';
          fechaProgramada = ultimaVacuna.fecha.add(const Duration(days: 180));
        }
      }

      if (necesitaVacuna) {
        await _crearAlerta(
          tipo: TipoAlerta.vacunacion,
          titulo: 'Vacunación pendiente',
          mensaje: '${animal.nombre} - $tipoVacuna',
          animal: animal,
          fechaProgramada: fechaProgramada,
          prioridad: Prioridad.alta,
        );
      }
    }
  }

  // Verificar desparasitaciones pendientes
  Future<void> _verificarDesparasitaciones(int diasAnticipacion) async {
    final animales = await IsarService.isar.animals
        .filter()
        .estadoEqualTo(EstadoAnimal.activo)
        .findAll();

    for (final animal in animales) {
      await animal.eventos.load();

      final ultimaDesparasitacion = animal.eventos
          .where((e) => e.tipo == TipoEvento.desparasitante)
          .fold<EventoSanitario?>(
            null,
            (prev, curr) =>
                prev == null || curr.fecha.isAfter(prev.fecha) ? curr : prev,
          );

      bool necesitaDesparasitacion = false;
      DateTime? fechaProgramada;

      if (ultimaDesparasitacion == null) {
        necesitaDesparasitacion = true;
        fechaProgramada = DateTime.now();
      } else {
        // Desparasitar cada 3 meses
        final diasDesdeUltima = DateTime.now()
            .difference(ultimaDesparasitacion.fecha)
            .inDays;
        if (diasDesdeUltima >= 90 - diasAnticipacion) {
          necesitaDesparasitacion = true;
          fechaProgramada = ultimaDesparasitacion.fecha.add(
            const Duration(days: 90),
          );
        }
      }

      if (necesitaDesparasitacion) {
        await _crearAlerta(
          tipo: TipoAlerta.desparasitacion,
          titulo: 'Desparasitación pendiente',
          mensaje: '${animal.nombre} requiere desparasitación',
          animal: animal,
          fechaProgramada: fechaProgramada,
          prioridad: Prioridad.media,
        );
      }
    }
  }

  // Verificar partos próximos
  Future<void> _verificarPartosProximos(int diasAnticipacion) async {
    final animales = await IsarService.isar.animals
        .filter()
        .sexoEqualTo(Sexo.hembra)
        .gestanteEqualTo(true)
        .findAll();

    for (final animal in animales) {
      if (animal.fechaProximoParto != null) {
        final diasParaParto = animal.fechaProximoParto!
            .difference(DateTime.now())
            .inDays;

        if (diasParaParto <= diasAnticipacion && diasParaParto >= 0) {
          await _crearAlerta(
            tipo: TipoAlerta.parto,
            titulo: 'Parto próximo',
            mensaje: '${animal.nombre} - $diasParaParto días para parto',
            animal: animal,
            fechaProgramada: animal.fechaProximoParto,
            prioridad: diasParaParto <= 2 ? Prioridad.critica : Prioridad.alta,
          );
        }
      }
    }
  }

  // Verificar animales enfermos
  Future<void> _verificarAnimalesEnfermos() async {
    final animalesEnfermos = await IsarService.isar.animals
        .filter()
        .estadoSaludEqualTo(EstadoSalud.enfermo)
        .or()
        .estadoSaludEqualTo(EstadoSalud.critico)
        .findAll();

    for (final animal in animalesEnfermos) {
      await _crearAlerta(
        tipo: TipoAlerta.tratamiento,
        titulo: 'Animal enfermo',
        mensaje: '${animal.nombre} - Estado: ${animal.estadoSalud.name}',
        animal: animal,
        prioridad: animal.estadoSalud == EstadoSalud.critico
            ? Prioridad.urgente
            : Prioridad.alta,
        requiereAccion: true,
      );
    }
  }

  // Verificar stock de medicamentos (simulado)
  Future<void> _verificarStockMedicamentos(int umbralMinimo) async {
    // Esta función sería más compleja con un inventario real
    // Por ahora creamos una alerta de ejemplo

    // Simulamos que hay poco stock de un medicamento
    final hayPocoStock = DateTime.now().day % 3 == 0; // Simular aleatoriamente

    if (hayPocoStock) {
      final alerta = Alerta()
        ..tipo = TipoAlerta.stockBajo
        ..titulo = 'Stock bajo de medicamentos'
        ..mensaje = 'IVERMECTINA 3.15% - Quedan solo 3 unidades'
        ..prioridad = Prioridad.media
        ..fechaProgramada = DateTime.now()
        ..requiereAccion = true
        ..accionRequerida = 'Realizar pedido de medicamentos';

      await IsarService.isar.writeTxn(() async {
        await IsarService.isar.alertas.put(alerta);
      });
    }
  }

  // Crear alerta
  Future<void> _crearAlerta({
    required TipoAlerta tipo,
    required String titulo,
    required String mensaje,
    Animal? animal,
    DateTime? fechaProgramada,
    Prioridad prioridad = Prioridad.media,
    bool requiereAccion = true,
  }) async {
    // Verificar si ya existe una alerta similar activa
    final alertaExistente = await IsarService.isar.alertas
        .filter()
        .tipoEqualTo(tipo)
        .tituloEqualTo(titulo)
        .estadoEqualTo(EstadoAlerta.activa)
        .findFirst();

    if (alertaExistente != null) {
      // Actualizar alerta existente si es necesario
      return;
    }

    final alerta = Alerta()
      ..tipo = tipo
      ..titulo = titulo
      ..mensaje = mensaje
      ..fechaProgramada = fechaProgramada
      ..prioridad = prioridad
      ..requiereAccion = requiereAccion
      ..estado = EstadoAlerta.activa;

    if (animal != null) {
      alerta.idAnimalReferencia = animal.idAreteNFC ?? animal.nombre;
    }

    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.alertas.put(alerta);
      if (animal != null) {
        alerta.animal.value = animal;
        await alerta.animal.save();
      }
    });
  }

  // Obtener configuración
  Future<ConfiguracionLocal> _getConfiguration() async {
    final config = await IsarService.isar.configuracionLocals.get(1);
    if (config == null) {
      final newConfig = ConfiguracionLocal();
      await IsarService.isar.writeTxn(() async {
        await IsarService.isar.configuracionLocals.put(newConfig);
      });
      return newConfig;
    }
    return config;
  }

  // Emitir alertas activas
  Future<void> _emitirAlertasActivas() async {
    final alertasActivas = await IsarService.isar.alertas
        .filter()
        .estadoEqualTo(EstadoAlerta.activa)
        .sortByPrioridadDesc()
        .thenByFechaProgramada()
        .findAll();

    _alertasController.add(alertasActivas);
  }

  // Marcar alerta como leída
  Future<void> marcarComoLeida(int alertaId) async {
    final alerta = await IsarService.isar.alertas.get(alertaId);
    if (alerta != null) {
      alerta.leida = true;
      alerta.fechaLectura = DateTime.now();

      await IsarService.isar.writeTxn(() async {
        await IsarService.isar.alertas.put(alerta);
      });

      await _emitirAlertasActivas();
    }
  }

  // Procesar alerta
  Future<void> procesarAlerta(int alertaId, String? resolucion) async {
    final alerta = await IsarService.isar.alertas.get(alertaId);
    if (alerta != null) {
      alerta.procesada = true;
      alerta.estado = EstadoAlerta.procesada;
      alerta.fechaResolucion = DateTime.now();
      alerta.resolucion = resolucion;

      await IsarService.isar.writeTxn(() async {
        await IsarService.isar.alertas.put(alerta);
      });

      await _emitirAlertasActivas();
    }
  }

  // Posponer alerta
  Future<void> posponerAlerta(int alertaId, Duration duracion) async {
    final alerta = await IsarService.isar.alertas.get(alertaId);
    if (alerta != null) {
      alerta.estado = EstadoAlerta.pospuesta;
      alerta.fechaProgramada = DateTime.now().add(duracion);

      await IsarService.isar.writeTxn(() async {
        await IsarService.isar.alertas.put(alerta);
      });

      // Programar reactivación
      Timer(duracion, () async {
        final alertaPospuesta = await IsarService.isar.alertas.get(alertaId);
        if (alertaPospuesta != null &&
            alertaPospuesta.estado == EstadoAlerta.pospuesta) {
          alertaPospuesta.estado = EstadoAlerta.activa;
          await IsarService.isar.writeTxn(() async {
            await IsarService.isar.alertas.put(alertaPospuesta);
          });
          await _emitirAlertasActivas();
        }
      });

      await _emitirAlertasActivas();
    }
  }

  // Obtener estadísticas de alertas
  Future<AlertaStatistics> getStatistics() async {
    final total = await IsarService.isar.alertas.count();
    final activas = await IsarService.isar.alertas
        .filter()
        .estadoEqualTo(EstadoAlerta.activa)
        .count();
    final leidas = await IsarService.isar.alertas
        .filter()
        .leidaEqualTo(true)
        .count();
    final procesadas = await IsarService.isar.alertas
        .filter()
        .estadoEqualTo(EstadoAlerta.procesada)
        .count();

    return AlertaStatistics(
      total: total,
      activas: activas,
      leidas: leidas,
      procesadas: procesadas,
    );
  }

  // Limpiar alertas antiguas
  Future<void> limpiarAlertasAntiguas() async {
    final fechaLimite = DateTime.now().subtract(const Duration(days: 30));

    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.alertas
          .filter()
          .estadoEqualTo(EstadoAlerta.procesada)
          .fechaCreacionLessThan(fechaLimite)
          .deleteAll();
    });
  }

  // Dispose
  void dispose() {
    _checkTimer?.cancel();
    _alertasController.close();
  }
}

// Clase auxiliar para estadísticas
class AlertaStatistics {
  final int total;
  final int activas;
  final int leidas;
  final int procesadas;

  AlertaStatistics({
    required this.total,
    required this.activas,
    required this.leidas,
    required this.procesadas,
  });

  double get tasaProcesamiento => total > 0 ? procesadas / total : 0.0;
  bool get hayPendientes => activas > 0;
}
