
// lib/presentation/widgets/home/alerts_section.dart
import 'package:flutter/material.dart';

class AlertsSection extends StatelessWidget {
  const AlertsSection({Key? key}) : super(key: key);

  Widget _buildAlertCard({
    required String title,
    required String subtitle,
    required DateTime date,
    required String type,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: color, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${date.day}/${date.month}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                type,
                style: TextStyle(fontSize: 11, color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Alertas y Eventos',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _buildAlertCard(
          title: 'Vacunación pendiente',
          subtitle: 'Lote 5 - Fiebre aftosa',
          date: DateTime.now().add(const Duration(days: 3)),
          type: 'Vacunación',
          color: Colors.orange,
        ),
        const SizedBox(height: 8),
        _buildAlertCard(
          title: 'Revisión veterinaria',
          subtitle: 'Animal ID: 12345 - Cojera',
          date: DateTime.now().add(const Duration(days: 1)),
          type: 'Salud',
          color: Colors.red,
        ),
      ],
    );
  }
}
