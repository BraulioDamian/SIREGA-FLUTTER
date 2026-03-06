import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animated_info_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animal_detail_helpers.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/health_status_widget.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/medical_event_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/pantallas/sanitary_history_screen.dart';

import 'package:sirega_app/nucleo/modelos/enums.dart';

class HealthTab extends StatelessWidget {
  final Animal animal;
  final EdgeInsets padding;

  const HealthTab({super.key, required this.animal, required this.padding});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      physics: const BouncingScrollPhysics(),
      children: [
        AnimatedInfoCard(
          title: 'Estado de Salud',
          icon: Icons.favorite,
          color: Colors.red,
          delay: 0,
          child: Column(
            children: [
              HealthStatusWidget(status: animal.estadoSalud.name),
              const SizedBox(height: 20),
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Última Revisión',
                animal.fechaUltimaRevision != null
                    ? AnimalDetailHelpers.formatDate(
                        animal.fechaUltimaRevision!,
                      )
                    : 'Sin registros',
                Icons.medical_services,
                valueColor: Colors.teal,
              ),
            ],
          ),
        ),
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
                  animalName: animal.nombre,
                  initialFilter: 'Todos',
                ),
              ),
            );
          },
          child: _buildMedicalHistory(context),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Vacunas Aplicadas',
          icon: Icons.vaccines,
          color: Colors.orange,
          delay: 200,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SanitaryHistoryScreen(
                  animalId: animal.id,
                  animalName: animal.nombre,
                  initialFilter: 'Vacunas',
                ),
              ),
            );
          },
          child: _buildVaccinesList(context),
        ),
      ],
    );
  }

  Widget _buildMedicalHistory(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<EventoSanitario>>(
      future: isarService.obtenerEventosPorAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return AnimalDetailHelpers.buildEmptyState(
            'Error al cargar historial médico',
          );
        }

        final eventos = snapshot.data ?? [];

        if (eventos.isEmpty) {
          return AnimalDetailHelpers.buildEmptyState('Sin historial médico');
        }

        // Ordenar por fecha descendente (más reciente primero)
        eventos.sort((a, b) => b.fecha.compareTo(a.fecha));
        final previewList = eventos.take(3).toList();

        return Column(
          children: previewList.asMap().entries.map((entry) {
            final index = entry.key;
            final evento = entry.value;
            final isLast = index == previewList.length - 1;

            return MedicalEventCard(
              evento: evento,
              index: index,
              isLast: isLast,
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildVaccinesList(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<EventoSanitario>>(
      future: isarService.obtenerEventosPorAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return AnimalDetailHelpers.buildEmptyState('Error al cargar vacunas');
        }

        final eventos = snapshot.data ?? [];

        // Filtrar solo vacunas
        final vacunas = eventos
            .where((e) => e.tipo == TipoEvento.vacuna)
            .toList();

        if (vacunas.isEmpty) {
          return AnimalDetailHelpers.buildEmptyState('Sin vacunas registradas');
        }

        // Ordenar por fecha descendente
        vacunas.sort((a, b) => b.fecha.compareTo(a.fecha));
        final previewList = vacunas.take(3).toList();

        return Column(
          children: previewList.asMap().entries.map((entry) {
            final index = entry.key;
            final vacuna = entry.value;
            final isLast = index == previewList.length - 1;

            return MedicalEventCard(
              evento: vacuna,
              index: index,
              isLast: isLast,
            );
          }).toList(),
        );
      },
    );
  }
}
