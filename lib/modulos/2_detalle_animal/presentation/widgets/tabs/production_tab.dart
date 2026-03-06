import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animated_info_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animal_detail_helpers.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/production_charts.dart';

class ProductionTab extends StatelessWidget {
  final Animal animal;
  final EdgeInsets padding;

  const ProductionTab({super.key, required this.animal, required this.padding});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      physics: const BouncingScrollPhysics(),
      children: [
        AnimatedInfoCard(
          title: 'Producción',
          icon: Icons.ssid_chart,
          color: Colors.lightBlue,
          delay: 0,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: ProductionChart(type: ChartType.weight, animal: animal),
              ),
              const SizedBox(height: 16),
              // Aquí iría un resumen de estadísticas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard(
                    context,
                    'Promedio (30d)',
                    '---',
                    Colors.lightBlue,
                  ),
                  _buildStatCard(context, 'Tendencia', '+0%', Colors.green),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Historial Productivo',
          icon: Icons.list_alt,
          color: Colors.brown,
          delay: 100,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Historial productivo completo próximamente'),
              ),
            );
          },
          child: AnimalDetailHelpers.buildEmptyState(
            'Sin registros productivos en el sistema',
          ),
        ),
      ],
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
