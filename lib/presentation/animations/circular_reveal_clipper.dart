// lib/presentation/animations/circular_reveal_clipper.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Clipper que crea un efecto de "gota" expandiéndose desde un punto
class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset? centerOffset;
  final double? minRadius;
  final double? maxRadius;

  CircularRevealClipper({
    required this.fraction,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
  });

  @override
  Path getClip(Size size) {
    // Centro: esquina superior derecha si no se especifica
    final center = centerOffset ?? Offset(size.width - 40, 40);

    // Radio mínimo: tamaño del avatar
    final minR = minRadius ?? 25.0;

    // Radio máximo: distancia más larga desde el centro a cualquier esquina
    final maxR = maxRadius ?? _calculateMaxRadius(size, center);

    // Radio actual basado en la fracción de la animación
    final radius = minR + (maxR - minR) * fraction;

    final path = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  /// Calcula el radio máximo necesario para cubrir toda la pantalla
  double _calculateMaxRadius(Size size, Offset center) {
    // Calcular distancia a cada esquina
    final topLeft = math.sqrt(
      math.pow(center.dx, 2) + math.pow(center.dy, 2),
    );
    final topRight = math.sqrt(
      math.pow(size.width - center.dx, 2) + math.pow(center.dy, 2),
    );
    final bottomLeft = math.sqrt(
      math.pow(center.dx, 2) + math.pow(size.height - center.dy, 2),
    );
    final bottomRight = math.sqrt(
      math.pow(size.width - center.dx, 2) + math.pow(size.height - center.dy, 2),
    );

    // Retornar la distancia más larga
    return [topLeft, topRight, bottomLeft, bottomRight].reduce(math.max);
  }
}
