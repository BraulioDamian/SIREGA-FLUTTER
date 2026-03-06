import 'package:flutter/material.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class HealthStatusWidget extends StatelessWidget {
  final String status;

  const HealthStatusWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isHealthy = status.toLowerCase() == 'sano';
    final color = _getStatusColor();
    final icon = _getStatusIcon();
    final message = _getStatusMessage();

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withValues(alpha: 0.15),
                  color.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: color.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                // Icono animado
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.bounceOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: color.withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Icon(
                          icon,
                          color: color,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Texto del estado
                Text(
                  status.toUpperCase(),
                  style: TextStyle(
                    color: color,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                // Mensaje descriptivo
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                // Barra de salud visual
                _buildHealthBar(color),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHealthBar(Color color) {
    double percentage = _getHealthPercentage();
    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Nivel de Salud',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${(percentage * 100).toInt()}%',
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.divider,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: percentage),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: value,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color,
                        color.withValues(alpha: 0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: 0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'sano':
        return AppColors.success;
      case 'enfermo':
        return AppColors.warning;
      case 'critico':
        return AppColors.error;
      case 'recuperacion':
        return AppColors.info;
      default:
        return AppColors.textHint;
    }
  }

  IconData _getStatusIcon() {
    switch (status.toLowerCase()) {
      case 'sano':
        return Icons.check_circle_outline;
      case 'enfermo':
        return Icons.warning_amber_rounded;
      case 'critico':
        return Icons.error_outline;
      case 'recuperacion':
        return Icons.healing;
      default:
        return Icons.help_outline;
    }
  }

  String _getStatusMessage() {
    switch (status.toLowerCase()) {
      case 'sano':
        return 'El animal se encuentra en perfectas condiciones de salud';
      case 'enfermo':
        return 'Requiere atención médica y seguimiento constante';
      case 'critico':
        return 'Estado crítico - Atención veterinaria urgente';
      case 'recuperacion':
        return 'En proceso de recuperación y mejora';
      default:
        return 'Estado de salud no especificado';
    }
  }

  double _getHealthPercentage() {
    switch (status.toLowerCase()) {
      case 'sano':
        return 1.0;
      case 'enfermo':
        return 0.5;
      case 'critico':
        return 0.2;
      case 'recuperacion':
        return 0.7;
      default:
        return 0.3;
    }
  }
}
