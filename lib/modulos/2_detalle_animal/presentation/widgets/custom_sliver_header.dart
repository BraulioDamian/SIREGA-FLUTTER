import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/core/extensions/enum_ui_extensions.dart';

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
      ],
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
                  Colors.black.withValues(alpha: 0.05),
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.6),
                ],
                stops: const [0.3, 0.55, 0.78, 1.0],
              ),
            ),
          ),
          // Información del animal
          Positioned(
            bottom: 72,
            left: 20,
            right: 20,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Minimalist Name indicator
                  Text(
                    animal.nombre,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                      shadows: [
                        Shadow(
                          color: Colors.black87,
                          blurRadius: 16,
                          offset: Offset(0, 4),
                        ),
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
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
                color: animal.estadoSalud.color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: animal.estadoSalud.color.withValues(alpha: 0.5),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  animal.estadoSalud.icon,
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
