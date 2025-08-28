// lib/presentation/widgets/home/summary_grid.dart
import 'package:flutter/material.dart';
import 'package:sirega_app/presentation/widgets/home/metric_card.dart';

class SummaryGrid extends StatelessWidget {
  final int totalAnimales;
  final int animalesActivos;
  final int alertasSanitarias;
  final int eventosPendientes;
  final double produccionLecheHoy;
  final int animalesEnfermos;

  const SummaryGrid({
    super.key,
    required this.totalAnimales,
    required this.animalesActivos,
    required this.alertasSanitarias,
    required this.eventosPendientes,
    required this.produccionLecheHoy,
    required this.animalesEnfermos,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Si la pantalla es ancha (tablet/desktop), mostramos más columnas
        final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;

        return GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            // altura mínima decente para que no se desborde
            mainAxisExtent: 140,
          ),
          children: [
            MetricCard(
              title: 'Total Animales',
              value: totalAnimales.toString(),
              subtitle: '$animalesActivos activos',
              icon: Icons.pets,
              color: Colors.blue,
              trend: '+2',
              trendUp: true,
            ),
            MetricCard(
              title: 'Alertas Sanitarias',
              value: alertasSanitarias.toString(),
              subtitle: '$eventosPendientes pendientes',
              icon: Icons.warning_amber,
              color: Colors.orange,
              trend: '-1',
              trendUp: false,
            ),
            MetricCard(
              title: 'Producción Hoy',
              value: '${produccionLecheHoy.toStringAsFixed(1)} L',
              subtitle: 'Leche recolectada',
              icon: Icons.water_drop,
              color: Colors.green,
              trend: '+5%',
              trendUp: true,
            ),
            MetricCard(
              title: 'Estado Sanitario',
              value: animalesActivos > 0
                  ? '${((animalesActivos - animalesEnfermos) / animalesActivos * 100).toStringAsFixed(0)}%'
                  : '100%',
              subtitle: '$animalesEnfermos enfermos',
              icon: Icons.health_and_safety,
              color: animalesEnfermos > 0 ? Colors.red : Colors.teal,
              trend: animalesEnfermos > 0 ? '$animalesEnfermos' : 'OK',
              trendUp: animalesEnfermos == 0,
            ),
          ],
        );
      },
    );
  }
}
