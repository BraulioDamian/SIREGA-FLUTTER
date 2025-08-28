// lib/presentation/widgets/home/quick_stats_bar.dart
import 'package:flutter/material.dart';

/// Barra de estadísticas rápidas con diseño minimalista y claro
class QuickStatsBar extends StatelessWidget {
  final int totalAnimales;
  final int animalesActivos;
  final int alertas;
  final VoidCallback? onStatTap;

  const QuickStatsBar({
    Key? key,
    required this.totalAnimales,
    required this.animalesActivos,
    required this.alertas,
    this.onStatTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _StatItem(
              value: totalAnimales.toString(),
              label: 'Total',
              color: theme.primaryColor,
              icon: Icons.pets,
              onTap: onStatTap,
            ),
          ),
          _buildDivider(),
          Expanded(
            child: _StatItem(
              value: animalesActivos.toString(),
              label: 'Activos',
              color: Colors.green,
              icon: Icons.check_circle,
              onTap: onStatTap,
            ),
          ),
          _buildDivider(),
          Expanded(
            child: _StatItem(
              value: alertas.toString(),
              label: 'Alertas',
              color: alertas > 0 ? Colors.orange : Colors.grey,
              icon: Icons.notifications,
              showBadge: alertas > 0,
              onTap: onStatTap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.grey.withOpacity(0.2),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final IconData icon;
  final bool showBadge;
  final VoidCallback? onTap;

  const _StatItem({
    required this.value,
    required this.label,
    required this.color,
    required this.icon,
    this.showBadge = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: color.withOpacity(0.7)),
              const SizedBox(width: 6),
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              if (showBadge) ...[
                const SizedBox(width: 4),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
