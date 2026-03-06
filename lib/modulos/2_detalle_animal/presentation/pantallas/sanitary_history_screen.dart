import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animal_detail_helpers.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/medical_event_card.dart';

class SanitaryHistoryScreen extends StatefulWidget {
  final int animalId;
  final String animalName;
  final String initialFilter;

  const SanitaryHistoryScreen({
    super.key,
    required this.animalId,
    required this.animalName,
    this.initialFilter = 'Todos',
  });

  @override
  State<SanitaryHistoryScreen> createState() => _SanitaryHistoryScreenState();
}

class _SanitaryHistoryScreenState extends State<SanitaryHistoryScreen> {
  late String _currentFilter;
  final List<String> _filters = [
    'Todos',
    'Vacunas',
    'Tratamientos',
    'Desparasitantes',
    'Pruebas',
  ];

  @override
  void initState() {
    super.initState();
    _currentFilter = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Historial de ${widget.animalName}',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: _buildFilterChips(),
        ),
      ),
      body: _buildHistoryList(context),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isSelected = filter == _currentFilter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _currentFilter = filter);
                }
              },
              backgroundColor: Colors.white,
              selectedColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? AppColors.primary : AppColors.border,
                ),
              ),
              showCheckmark: false,
            ),
          );
        },
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<EventoSanitario>>(
      future: isarService.obtenerEventosPorAnimal(widget.animalId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: AnimalDetailHelpers.buildEmptyState(
              'Error al cargar historial',
            ),
          );
        }

        List<EventoSanitario> eventos = snapshot.data ?? [];

        // Apply filter logic
        if (_currentFilter != 'Todos') {
          TipoEvento? targetType;
          switch (_currentFilter) {
            case 'Vacunas':
              targetType = TipoEvento.vacuna;
              break;
            case 'Tratamientos':
              targetType = TipoEvento.tratamiento;
              break;
            case 'Desparasitantes':
              targetType = TipoEvento.desparasitante;
              break;
          }

          if (targetType != null) {
            eventos = eventos.where((e) => e.tipo == targetType).toList();
          }
        }

        if (eventos.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: AnimalDetailHelpers.buildEmptyState(
                'Sin registros para "$_currentFilter"',
              ),
            ),
          );
        }

        // Sort descending by date
        eventos.sort((a, b) => b.fecha.compareTo(a.fecha));

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: eventos.length,
          itemBuilder: (context, index) {
            final evento = eventos[index];
            final isLast = index == eventos.length - 1;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MedicalEventCard(
                evento: evento,
                index: index,
                isLast: isLast,
              ),
            );
          },
        );
      },
    );
  }
}
