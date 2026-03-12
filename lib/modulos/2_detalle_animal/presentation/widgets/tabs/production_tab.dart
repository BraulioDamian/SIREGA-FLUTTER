import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animated_info_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animal_detail_helpers.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/production_charts.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/quick_add_dialogs.dart';

class ProductionTab extends StatelessWidget {
  final Animal animal;
  final EdgeInsets padding;

  const ProductionTab({super.key, required this.animal, required this.padding});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      physics: const BouncingScrollPhysics(),
      children: _buildChildren(context),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);
    return [
      // Gráfico + estadísticas reales
      FutureBuilder<List<RegistroProduccion>>(
        future: isarService.getProductionByAnimal(animal.id),
        builder: (context, snapshot) {
          final registros = snapshot.data ?? [];
          final pesajes = registros.where((r) => r.tipo == ProductionType.weight && r.pesoKg != null).toList()
            ..sort((a, b) => a.fecha.compareTo(b.fecha));
          final leche = registros.where((r) => r.tipo == ProductionType.milk && r.litrosPorDia != null).toList()
            ..sort((a, b) => a.fecha.compareTo(b.fecha));

          // Calcular promedios y tendencias de pesaje
          String promedioPeso = '---';
          String tendenciaPeso = '—';
          Color tendenciaPesoColor = Colors.grey;
          if (pesajes.isNotEmpty) {
            final ahora = DateTime.now();
            final hace30 = ahora.subtract(const Duration(days: 30));
            final recientes = pesajes.where((p) => p.fecha.isAfter(hace30)).toList();
            if (recientes.isNotEmpty) {
              final avg = recientes.map((p) => p.pesoKg!).reduce((a, b) => a + b) / recientes.length;
              promedioPeso = '${avg.toStringAsFixed(1)} kg';
            } else {
              final avg = pesajes.map((p) => p.pesoKg!).reduce((a, b) => a + b) / pesajes.length;
              promedioPeso = '${avg.toStringAsFixed(1)} kg';
            }
            if (pesajes.length >= 2) {
              final ultimo = pesajes.last.pesoKg!;
              final penultimo = pesajes[pesajes.length - 2].pesoKg!;
              final cambio = ((ultimo - penultimo) / penultimo * 100);
              tendenciaPeso = '${cambio >= 0 ? '+' : ''}${cambio.toStringAsFixed(1)}%';
              tendenciaPesoColor = cambio >= 0 ? Colors.green : Colors.red;
            }
          }

          // Calcular promedios de leche
          String promedioLeche = '---';
          String tendenciaLeche = '—';
          Color tendenciaLecheColor = Colors.grey;
          if (leche.isNotEmpty) {
            final ahora = DateTime.now();
            final hace30 = ahora.subtract(const Duration(days: 30));
            final recientes = leche.where((l) => l.fecha.isAfter(hace30)).toList();
            if (recientes.isNotEmpty) {
              final avg = recientes.map((l) => l.litrosPorDia!).reduce((a, b) => a + b) / recientes.length;
              promedioLeche = '${avg.toStringAsFixed(1)} L/d';
            } else {
              final avg = leche.map((l) => l.litrosPorDia!).reduce((a, b) => a + b) / leche.length;
              promedioLeche = '${avg.toStringAsFixed(1)} L/d';
            }
            if (leche.length >= 2) {
              final ultimo = leche.last.litrosPorDia!;
              final penultimo = leche[leche.length - 2].litrosPorDia!;
              final cambio = ((ultimo - penultimo) / penultimo * 100);
              tendenciaLeche = '${cambio >= 0 ? '+' : ''}${cambio.toStringAsFixed(1)}%';
              tendenciaLecheColor = cambio >= 0 ? Colors.green : Colors.red;
            }
          }

          return AnimatedInfoCard(
            title: 'Producción',
            icon: Icons.ssid_chart,
            color: Colors.lightBlue,
            delay: 0,
            child: Column(
              children: [
                // Gráfico de peso
                SizedBox(
                  height: 380,
                  child: ProductionChart(type: ChartType.weight, animal: animal),
                ),
                const SizedBox(height: 16),
                // Estadísticas de peso
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard(context, 'Peso Prom.', promedioPeso, Colors.lightBlue),
                    _buildStatCard(context, 'Tendencia', tendenciaPeso, tendenciaPesoColor),
                  ],
                ),
                if (leche.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  // Gráfico de leche
                  SizedBox(
                    height: 380,
                    child: ProductionChart(type: ChartType.milk, animal: animal),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard(context, 'Leche Prom.', promedioLeche, Colors.teal),
                      _buildStatCard(context, 'Tendencia', tendenciaLeche, tendenciaLecheColor),
                    ],
                  ),
                ],
              ],
            ),
          );
        },
      ),
      const SizedBox(height: 16),
      // Acciones rápidas
      _buildQuickActions(context),
      const SizedBox(height: 16),
      // Historial de pesajes y leche desde Isar
      _buildHistorial(context),
    ];
  }

  static List<Widget> buildChildrenStatic(BuildContext context, Animal animal) {
    return ProductionTab(
      animal: animal,
      padding: EdgeInsets.zero,
    )._buildChildren(context);
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionButton(
            icon: Icons.monitor_weight_rounded,
            label: 'Registrar Pesaje',
            color: Colors.lightBlue,
            onTap: () => QuickAddDialogs.mostrarRegistroPesaje(context, animal),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _QuickActionButton(
            icon: Icons.water_drop_rounded,
            label: 'Producción Leche',
            color: Colors.teal,
            onTap: () => QuickAddDialogs.mostrarRegistroLeche(context, animal),
          ),
        ),
      ],
    );
  }

  Widget _buildHistorial(BuildContext context) {
    final isarService = RepositoryProvider.of<IsarService>(context);
    return FutureBuilder<List<RegistroProduccion>>(
      future: isarService.getProductionByAnimal(animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final registros = snapshot.data ?? [];
        final pesajes = registros.where((r) => r.tipo == ProductionType.weight).toList()
          ..sort((a, b) => b.fecha.compareTo(a.fecha));
        final leche = registros.where((r) => r.tipo == ProductionType.milk).toList()
          ..sort((a, b) => b.fecha.compareTo(a.fecha));

        return Column(
          children: [
            AnimatedInfoCard(
              title: 'Pesajes (${pesajes.length})',
              icon: Icons.monitor_weight_rounded,
              color: Colors.lightBlue,
              delay: 100,
              child: pesajes.isEmpty
                  ? AnimalDetailHelpers.buildEmptyState('Sin pesajes registrados')
                  : Column(
                      children: pesajes.take(5).map((p) => _buildRegistroRow(
                        '${p.pesoKg?.toStringAsFixed(1)} kg',
                        p.fecha,
                        Icons.monitor_weight_outlined,
                        Colors.lightBlue,
                        p.notas,
                      )).toList(),
                    ),
            ),
            const SizedBox(height: 16),
            AnimatedInfoCard(
              title: 'Producción Leche (${leche.length})',
              icon: Icons.water_drop_rounded,
              color: Colors.teal,
              delay: 200,
              child: leche.isEmpty
                  ? AnimalDetailHelpers.buildEmptyState('Sin registros de leche')
                  : Column(
                      children: leche.take(5).map((l) => _buildRegistroRow(
                        '${l.litrosPorDia?.toStringAsFixed(1)} L/día',
                        l.fecha,
                        Icons.water_drop_outlined,
                        Colors.teal,
                        l.notas,
                      )).toList(),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRegistroRow(
    String valor,
    DateTime fecha,
    IconData icon,
    Color color,
    String? notas,
  ) {
    final fechaStr =
        '${fecha.day.toString().padLeft(2, '0')}/${fecha.month.toString().padLeft(2, '0')}/${fecha.year}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(valor,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                    Text(fechaStr,
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  ],
                ),
              ),
            ],
          ),
          if (notas != null && notas.isNotEmpty) ...[         
            Padding(
              padding: const EdgeInsets.only(left: 46, top: 4),
              child: Text(
                notas,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

class ProductionTabContent extends StatelessWidget {
  final Animal animal;
  const ProductionTabContent({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Column(children: ProductionTab.buildChildrenStatic(context, animal));
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
