
// lib/presentation/widgets/home/chart_card.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartCard extends StatelessWidget {
  final int machos;
  final int hembras;
  final int totalAnimales;

  const ChartCard({
    super.key,
    required this.machos,
    required this.hembras,
    required this.totalAnimales,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 250.0,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Distribución del Ganado',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: machos.toDouble(),
                        title: totalAnimales > 0
                            ? '${(machos / totalAnimales * 100).toStringAsFixed(0)}%'
                            : '0%',
                        color: Colors.blue[400],
                        radius: 50,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        value: hembras.toDouble(),
                        title: totalAnimales > 0
                            ? '${(hembras / totalAnimales * 100).toStringAsFixed(0)}%'
                            : '0%',
                        color: Colors.pink[300],
                        radius: 50,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
