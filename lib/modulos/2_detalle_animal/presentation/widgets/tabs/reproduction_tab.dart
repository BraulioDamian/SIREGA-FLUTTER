import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animated_info_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animal_detail_helpers.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/quick_add_dialogs.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/pantallas/cattle_detail_screen.dart';

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
      if (animal.sexo == Sexo.hembra) ...[        
        const SizedBox(height: 16),
        _buildQuickAction(context),
      ],
      const SizedBox(height: 16),
      AnimatedInfoCard(
        title: 'Historial de Crías',
        icon: Icons.pets,
        color: Colors.indigo,
        delay: 100,
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

  Widget _buildQuickAction(BuildContext context) {
    return Material(
      color: Colors.pink.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => QuickAddDialogs.mostrarRegistroParto(context, animal),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.pink.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.child_care_rounded,
                    color: Colors.pink, size: 24),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Registrar Parto',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15)),
                    Text('Agregar nuevo registro de cría',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
              Icon(Icons.add_circle_rounded,
                  color: Colors.pink, size: 28),
            ],
          ),
        ),
      ),
    );
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
    return FutureBuilder<List<Animal>>(
      future: _loadCrias(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return AnimalDetailHelpers.buildEmptyState(
            'Error al cargar historial de crías',
          );
        }

        final crias = snapshot.data ?? [];

        if (crias.isEmpty) {
          return AnimalDetailHelpers.buildEmptyState('Sin crías registradas');
        }

        return Column(
          children: crias.map((cria) => _buildCriaCard(context, cria)).toList(),
        );
      },
    );
  }

  Future<List<Animal>> _loadCrias() async {
    await animal.crias.load();
    final lista = animal.crias.toList();
    lista.sort((a, b) => b.fechaNacimiento.compareTo(a.fechaNacimiento));
    return lista;
  }

  Widget _buildCriaCard(BuildContext context, Animal cria) {
    final esMacho = cria.sexo == Sexo.macho;
    final fecha = cria.fechaNacimiento;
    final fechaStr =
        '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            final isarService = RepositoryProvider.of<IsarService>(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => CattleDetailBloc(isarService: isarService)
                    ..add(LoadCattleDetail(cria.id)),
                  child: CattleDetailScreen(id: cria.id),
                ),
              ),
            );
          },
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
                        cria.nombre,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Nacido: $fechaStr',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                      if (cria.pesoNacimiento != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          'Peso al nacer: ${cria.pesoNacimiento!.toStringAsFixed(1)} kg',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded,
                    color: Colors.grey.shade400, size: 24),
              ],
            ),
          ),
        ),
      ),
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
