import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/medical_event_model.dart';
import 'package:sirega_app/core/models/vaccines_catalog.dart';
import 'package:sirega_app/core/services/isar_service.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/animated_info_card.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/animal_detail_helpers.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/health_status_widget.dart';
import 'package:sirega_app/features/animal_detail/presentation/widgets/medical_event_card.dart';
import 'package:sirega_app/features/animal_detail/presentation/screens/sanitary_history_screen.dart';

import 'package:sirega_app/core/models/enums.dart';

class HealthTab extends StatefulWidget {
  final Animal animal;
  final EdgeInsets padding;

  const HealthTab({super.key, required this.animal, required this.padding});

  @override
  State<HealthTab> createState() => _HealthTabState();

  static List<Widget> buildChildrenStatic(BuildContext context, Animal animal) {
    return _HealthTabState._buildChildrenFrom(context, animal, null);
  }
}

class _HealthTabState extends State<HealthTab> {
  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: widget.padding,
      physics: const BouncingScrollPhysics(),
      children: _buildChildrenFrom(context, widget.animal, _refresh),
    );
  }

  static List<Widget> _buildChildrenFrom(
    BuildContext context,
    Animal animal,
    VoidCallback? onRefresh,
  ) {
    return [
      AnimatedInfoCard(
        title: 'Estado de Salud',
        icon: Icons.favorite,
        color: Colors.red,
        delay: 0,
        child: Column(
          children: [
            HealthStatusWidget(status: animal.healthStatus),
            const SizedBox(height: 20),
            AnimalDetailHelpers.buildDetailRow(
              context,
              'Última Revisión',
              animal.lastCheckupDate != null
                  ? AnimalDetailHelpers.formatDate(animal.lastCheckupDate!)
                  : 'Sin registros',
              Icons.medical_services,
              valueColor: Colors.teal,
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      // Próximas vacunas / alertas
      _buildProximasVacunasCard(context, animal),
      const SizedBox(height: 16),
      AnimatedInfoCard(
        title: 'Historial Médico',
        icon: Icons.history,
        color: Colors.teal,
        delay: 100,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SanitaryHistoryScreen(
                animalId: animal.id,
                animalName: animal.name,
                initialFilter: 'Todos',
              ),
            ),
          );
        },
        child: _buildMedicalHistory(context, animal, onRefresh),
      ),
      const SizedBox(height: 16),
      AnimatedInfoCard(
        title: 'Vacunas con Refuerzo Periódico',
        icon: Icons.vaccines,
        color: Colors.blue,
        delay: 200,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SanitaryHistoryScreen(
                animalId: animal.id,
                animalName: animal.name,
                initialFilter: 'Vacunas',
              ),
            ),
          );
        },
        child: _buildVacunasPeriodicasList(context, animal),
      ),
      const SizedBox(height: 16),
      AnimatedInfoCard(
        title: 'Vacunas de Aplicación Única',
        icon: Icons.verified,
        color: Colors.orange,
        delay: 300,
        child: _buildVacunasUnicasList(context, animal),
      ),
    ];
  }

  static Widget _buildMedicalHistory(
    BuildContext context,
    Animal animal,
    VoidCallback? onRefresh,
  ) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<MedicalEventRecord>>(
      future: isarService.getEventsByAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return AnimalDetailHelpers.buildEmptyState(
            'Error al cargar historial médico',
          );
        }

        final events = snapshot.data ?? [];

        // Excluir vacunas (tienen su propia sección)
        final historial = events
            .where((e) => e.tipo != TipoEvento.vacuna)
            .toList();

        if (historial.isEmpty) {
          return AnimalDetailHelpers.buildEmptyState('Sin historial médico');
        }

        // Ordenar por date descendente (más reciente primero)
        historial.sort((a, b) => b.date.compareTo(a.date));
        final previewList = historial.take(3).toList();

        return Column(
          children: previewList.asMap().entries.map((entry) {
            final index = entry.key;
            final evento = entry.value;
            final isLast = index == previewList.length - 1;

            return MedicalEventCard(
              evento: evento,
              index: index,
              isLast: isLast,
              onDeleted: onRefresh,
            );
          }).toList(),
        );
      },
    );
  }

  static Widget _buildVacunasPeriodicasList(
    BuildContext context,
    Animal animal,
  ) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<MedicalEventRecord>>(
      future: isarService.getEventsByAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return AnimalDetailHelpers.buildEmptyState('Error al cargar vacunas');
        }

        final events = snapshot.data ?? [];
        final vacunas = events
            .where((e) => e.tipo == TipoEvento.vacuna && !e.esAplicacionUnica)
            .toList();

        if (vacunas.isEmpty) {
          return AnimalDetailHelpers.buildEmptyState(
            'Sin vacunas periódicas registradas',
          );
        }

        // Agrupar por name y mostrar la más reciente de cada una
        final porNombre = <String, List<MedicalEventRecord>>{};
        for (final v in vacunas) {
          final name = v.productName ?? 'Sin name';
          porNombre.putIfAbsent(name, () => []).add(v);
        }

        final items = <Widget>[];
        porNombre.forEach((name, lista) {
          lista.sort((a, b) => b.date.compareTo(a.date));
          final ultima = lista.first;
          final vacunaInfo = CatalogoVacunas.buscarPorNombre(name);
          final color = vacunaInfo?.color ?? Colors.blue;

          items.add(
            _buildVacunaPeriodicaItem(
              name: name,
              ultimaAplicacion: ultima.date,
              proximaAplicacion: ultima.nextApplicationDate,
              totalAplicaciones: lista.length,
              intervaloTexto: vacunaInfo?.intervaloTexto ?? 'Periódica',
              color: color,
            ),
          );
        });

        return Column(children: items);
      },
    );
  }

  static Widget _buildVacunaPeriodicaItem({
    required String name,
    required DateTime ultimaAplicacion,
    DateTime? proximaAplicacion,
    required int totalAplicaciones,
    required String intervaloTexto,
    required Color color,
  }) {
    final ahora = DateTime.now();
    final estaVencida =
        proximaAplicacion != null && proximaAplicacion.isBefore(ahora);
    final diasRestantes = proximaAplicacion?.difference(ahora).inDays;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: estaVencida ? Colors.red.shade50 : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: estaVencida ? Colors.red.shade300 : color.withAlpha(77),
          width: estaVencida ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.vaccines, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$totalAplicaciones aplicación${totalAplicaciones > 1 ? 'es' : ''}',
                  style: TextStyle(
                    fontSize: 11,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.event, size: 14, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text(
                'Última: ${AnimalDetailHelpers.formatDate(ultimaAplicacion)}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              ),
              const SizedBox(width: 12),
              Text(
                '($intervaloTexto)',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
            ],
          ),
          if (proximaAplicacion != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  estaVencida ? Icons.warning_amber_rounded : Icons.schedule,
                  size: 14,
                  color: estaVencida ? Colors.red : Colors.green.shade700,
                ),
                const SizedBox(width: 4),
                Text(
                  estaVencida
                      ? 'VENCIDA - Próximo refuerzo era: ${AnimalDetailHelpers.formatDate(proximaAplicacion)}'
                      : 'Próximo refuerzo: ${AnimalDetailHelpers.formatDate(proximaAplicacion)} ($diasRestantes días)',
                  style: TextStyle(
                    fontSize: 12,
                    color: estaVencida ? Colors.red : Colors.green.shade700,
                    fontWeight: estaVencida ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  static Widget _buildVacunasUnicasList(BuildContext context, Animal animal) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<MedicalEventRecord>>(
      future: isarService.getEventsByAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return AnimalDetailHelpers.buildEmptyState('Error al cargar vacunas');
        }

        final events = snapshot.data ?? [];
        final vacunasUnicas = events
            .where((e) => e.tipo == TipoEvento.vacuna && e.esAplicacionUnica)
            .toList();

        if (vacunasUnicas.isEmpty) {
          return AnimalDetailHelpers.buildEmptyState(
            'Sin vacunas de aplicación única',
          );
        }

        vacunasUnicas.sort((a, b) => b.date.compareTo(a.date));

        return Column(
          children: vacunasUnicas.map((vacuna) {
            final vacunaInfo = CatalogoVacunas.buscarPorNombre(
              vacuna.productName ?? '',
            );
            final color = vacunaInfo?.color ?? Colors.orange;

            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withAlpha(15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withAlpha(77)),
              ),
              child: Row(
                children: [
                  Icon(Icons.verified, color: color, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vacuna.productName ?? 'Sin name',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Aplicada: ${AnimalDetailHelpers.formatDateVerbose(vacuna.date)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 14,
                          color: Colors.green.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Completada',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  static Widget _buildProximasVacunasCard(BuildContext context, Animal animal) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<MedicalEventRecord>>(
      future: isarService.getEventsByAnimal(animal.id),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final ahora = DateTime.now();
        final vacunas = snapshot.data!
            .where(
              (e) =>
                  e.tipo == TipoEvento.vacuna &&
                  !e.esAplicacionUnica &&
                  e.nextApplicationDate != null,
            )
            .toList();

        // Vacunas vencidas o que vencen en los próximos 30 días
        final alertas = vacunas.where((v) {
          final dias = v.nextApplicationDate!.difference(ahora).inDays;
          return dias <= 30;
        }).toList();

        if (alertas.isEmpty) return const SizedBox.shrink();

        alertas.sort(
          (a, b) => a.nextApplicationDate!.compareTo(b.nextApplicationDate!),
        );

        return AnimatedInfoCard(
          title: 'Próximas Vacunas',
          icon: Icons.notification_important,
          color: Colors.amber.shade700,
          delay: 50,
          child: Column(
            children: alertas.map((v) {
              final dias = v.nextApplicationDate!.difference(ahora).inDays;
              final vencida = dias < 0;

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: vencida ? Colors.red.shade50 : Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: vencida
                        ? Colors.red.shade300
                        : Colors.amber.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      vencida ? Icons.warning_amber_rounded : Icons.schedule,
                      color: vencida ? Colors.red : Colors.amber.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            v.productName ?? 'Vacuna',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: vencida
                                  ? Colors.red.shade800
                                  : Colors.amber.shade900,
                            ),
                          ),
                          Text(
                            vencida
                                ? 'Vencida hace ${-dias} día${-dias != 1 ? 's' : ''}'
                                : dias == 0
                                ? 'Vence hoy'
                                : 'Vence en $dias día${dias != 1 ? 's' : ''}',
                            style: TextStyle(
                              fontSize: 12,
                              color: vencida
                                  ? Colors.red.shade600
                                  : Colors.amber.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AnimalDetailHelpers.formatDate(v.nextApplicationDate!),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class HealthTabContent extends StatelessWidget {
  final Animal animal;
  const HealthTabContent({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Column(children: HealthTab.buildChildrenStatic(context, animal));
  }
}
