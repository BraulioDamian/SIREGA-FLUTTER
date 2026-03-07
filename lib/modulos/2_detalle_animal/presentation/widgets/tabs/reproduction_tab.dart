import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animated_info_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animal_detail_helpers.dart';

import 'package:sirega_app/nucleo/modelos/enums.dart';

class ReproductionTab extends StatelessWidget {
  final Animal animal;
  final EdgeInsets padding;

  const ReproductionTab({
    super.key,
    required this.animal,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      physics: const BouncingScrollPhysics(),
      children: _buildChildren(context),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    return [
      AnimatedInfoCard(
        title: 'Estado Reproductivo',
        icon: Icons.child_care,
        color: Colors.pink,
        delay: 0,
        child: _buildReproductiveStatus(context),
      ),
      const SizedBox(height: 16),
      AnimatedInfoCard(
        title: 'Historial de Crías',
        icon: Icons.pets,
        color: Colors.indigo,
        delay: 100,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Historial de crías completo próximamente'),
            ),
          );
        },
        child: _buildOffspringHistory(context),
      ),
    ];
  }

  static List<Widget> buildChildrenStatic(BuildContext context, Animal animal) {
    return ReproductionTab(
      animal: animal,
      padding: EdgeInsets.zero,
    )._buildChildren(context);
  }

  Widget _buildReproductiveStatus(BuildContext context) {
    if (animal.sexo == Sexo.macho) {
      return Column(
        children: [
          AnimalDetailHelpers.buildDetailRow(
            context,
            'Estado',
            'Semental',
            Icons.male,
            valueColor: Colors.blue,
          ),
          AnimalDetailHelpers.buildDetailRow(
            context,
            'Crías Registradas',
            'No disponible', // Próximamente: Conectar con API o query inverso
            Icons.format_list_numbered,
          ),
        ],
      );
    } else {
      final isarService = RepositoryProvider.of<IsarService>(context);
      return FutureBuilder<List<RegistroProduccion>>(
        future: isarService.obtenerProduccionPorAnimal(animal.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final registros = snapshot.data ?? [];
          final partos = registros.where((r) => r.tipo == 'Parto').toList();
          partos.sort((a, b) => b.fecha.compareTo(a.fecha));

          final ultimoParto = partos.isNotEmpty
              ? '${partos.first.fecha.day.toString().padLeft(2, '0')}/${partos.first.fecha.month.toString().padLeft(2, '0')}/${partos.first.fecha.year}'
              : 'Ninguno';

          return Column(
            children: [
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Estado',
                'Vientre Activo',
                Icons.female,
                valueColor: Colors.pink,
              ),
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Último Parto',
                ultimoParto,
                Icons.child_friendly,
              ),
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Partos Totales',
                partos.length.toString(),
                Icons.numbers,
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildOffspringHistory(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<RegistroProduccion>>(
      future: isarService.obtenerProduccionPorAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return AnimalDetailHelpers.buildEmptyState(
            'Error al cargar historial de partos',
          );
        }

        final registros = snapshot.data ?? [];

        // Filtrar solo los partos
        final partos = registros.where((r) => r.tipo == 'Parto').toList();

        if (partos.isEmpty) {
          return AnimalDetailHelpers.buildEmptyState('Sin crías registradas');
        }

        // Ordenar por fecha descendente
        partos.sort((a, b) => b.fecha.compareTo(a.fecha));

        return Column(
          children: partos.map((parto) {
            // Extraer el sexo de las notas si existe
            bool esMacho = false;
            if (parto.notas != null && parto.notas!.contains('Sexo:')) {
              esMacho = parto.notas!.contains('Macho');
            }
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Material(
                color: Colors.brown.shade50,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.brown.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            esMacho ? Icons.male : Icons.female,
                            color: esMacho ? Colors.blue : Colors.pink,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                parto.idCria ?? 'Cría sin identificar',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Nacido: ${parto.fecha.day.toString().padLeft(2, '0')}/${parto.fecha.month.toString().padLeft(2, '0')}/${parto.fecha.year}',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),
                              if (parto.pesoKg != null) ...[
                                const SizedBox(height: 2),
                                Text(
                                  'Peso al nacer: ${parto.pesoKg!.toStringAsFixed(1)} kg',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        if (parto.notas != null && parto.notas!.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.brown.withAlpha(26),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.notes,
                              color: Colors.brown,
                              size: 16,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class ReproductionTabContent extends StatelessWidget {
  final Animal animal;
  const ReproductionTabContent({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ReproductionTab.buildChildrenStatic(context, animal),
    );
  }
}
