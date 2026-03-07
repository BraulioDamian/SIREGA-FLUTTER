import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class DetailFloatingButtons extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final VoidCallback onRegisterEvent;
  final VoidCallback onAddPhoto;

  const DetailFloatingButtons({
    super.key,
    required this.scaleAnimation,
    required this.onRegisterEvent,
    required this.onAddPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SmallFAB(
              icon: Icons.medical_services_rounded,
              color: AppColors.warning,
              onPressed: onRegisterEvent,
              tooltip: 'Registrar Evento',
            ),
            const SizedBox(height: 12),
            _MainFAB(
              icon: Icons.add_a_photo_rounded,
              color: Theme.of(context).primaryColor,
              onPressed: onAddPhoto,
              tooltip: 'Añadir Foto',
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallFAB extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final String tooltip;

  const _SmallFAB({
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 300),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withAlpha(102),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    onPressed();
                  },
                  customBorder: const CircleBorder(),
                  child: Icon(icon, color: AppColors.surface, size: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MainFAB extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final String tooltip;

  const _MainFAB({
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, color.withAlpha(204)],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(102),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              HapticFeedback.heavyImpact();
              onPressed();
            },
            customBorder: const CircleBorder(),
            child: Icon(icon, color: AppColors.surface, size: 28),
          ),
        ),
      ),
    );
  }
}
