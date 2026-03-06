import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class CustomSliverHeader extends StatelessWidget {
  final Animal animal;
  final double scrollOffset;
  final bool isScrolled;
  final Animation<double> fadeAnimation;

  const CustomSliverHeader({
    super.key,
    required this.animal,
    required this.scrollOffset,
    required this.isScrolled,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      stretchModes: const [
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
      centerTitle: false,
      titlePadding: const EdgeInsets.only(left: 64, bottom: 16, right: 16),
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isScrolled ? 1.0 : 0.0,
        child: Text(
          animal.nombre,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
      background: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen con efecto parallax
          Transform.translate(
            offset: Offset(0, scrollOffset * 0.5),
            child: Transform.scale(
              scale: 1 + (scrollOffset.abs() * 0.001),
              child: _buildImage(),
            ),
          ),
          // Efecto de blur gradual
          if (scrollOffset > 0)
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: scrollOffset * 0.01,
                sigmaY: scrollOffset * 0.01,
              ),
              child: Container(color: Colors.transparent),
            ),
          // Gradiente oscuro
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.1),
                  Colors.black.withValues(alpha: 0.7),
                ],
                stops: const [0.3, 0.6, 1.0],
              ),
            ),
          ),
          // Información del animal
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre con efecto de sombra
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.pets, color: Colors.white, size: 28),
                        const SizedBox(width: 12),
                        Text(
                          animal.nombre,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Chips de información
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      _buildInfoChip(
                        Icons.cake,
                        animal.getEdadFormateada(),
                        AppColors.warning,
                      ),
                      _buildInfoChip(
                        animal.sexo.name == 'macho' ? Icons.male : Icons.female,
                        animal.sexo.name.toUpperCase(),
                        animal.sexo.name == 'macho'
                            ? AppColors.info
                            : AppColors.accent,
                      ),
                      _buildInfoChip(Icons.tag, animal.raza, AppColors.success),
                      if (animal.estado.name == 'activo')
                        _buildInfoChip(
                          Icons.check_circle,
                          'ACTIVO',
                          AppColors.success,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Indicador de estado de salud
          Positioned(
            top: MediaQuery.of(context).padding.top + 60,
            right: 20,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: !isScrolled ? 1.0 : 0.0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getHealthColor(animal.estadoSalud.name),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _getHealthColor(
                        animal.estadoSalud.name,
                      ).withValues(alpha: 0.5),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  _getHealthIcon(animal.estadoSalud.name),
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (animal.fotoPerfilUrl != null && animal.fotoPerfilUrl!.isNotEmpty) {
      return Image.file(
        File(animal.fotoPerfilUrl!),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholder();
        },
      );
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryLight,
            AppColors.primary,
            AppColors.primaryDark,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Patrón de fondo
          Positioned.fill(child: CustomPaint(painter: PatternPainter())),
          // Icono central
          Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.pets,
                size: 80,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: color.withValues(alpha: 0.4), width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getHealthColor(String status) {
    switch (status.toLowerCase()) {
      case 'sano':
        return AppColors.success;
      case 'enfermo':
        return AppColors.warning;
      case 'critico':
        return AppColors.error;
      default:
        return AppColors.textHint;
    }
  }

  IconData _getHealthIcon(String status) {
    switch (status.toLowerCase()) {
      case 'sano':
        return Icons.favorite;
      case 'enfermo':
        return Icons.warning;
      case 'critico':
        return Icons.error;
      default:
        return Icons.help_outline;
    }
  }
}

// Clase para dibujar un patrón decorativo en el placeholder
class PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const spacing = 30.0;

    // Dibujar líneas diagonales
    for (double i = -size.height; i < size.width + size.height; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }

    // Dibujar círculos decorativos
    paint.style = PaintingStyle.fill;
    paint.color = Colors.white.withValues(alpha: 0.03);

    for (double x = 0; x < size.width; x += spacing * 2) {
      for (double y = 0; y < size.height; y += spacing * 2) {
        canvas.drawCircle(Offset(x, y), 10, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
