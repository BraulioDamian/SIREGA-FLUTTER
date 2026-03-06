import 'package:flutter/material.dart';

/// Un ícono vectorial nativo que representa un arete ganadero (SINIIGA/SIVIG).
/// Se dibuja con [CustomPaint] para escalar sin perder calidad y ahorrar
/// la necesidad de assets externos pesados.
class EarTagIcon extends StatelessWidget {
  final Color? color;
  final double size;

  const EarTagIcon({super.key, this.color, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    // Si no se provee color, toma el color del tema de iconos actual
    final iconColor = color ?? IconTheme.of(context).color ?? Colors.black;

    return CustomPaint(
      size: Size(size, size),
      painter: _EarTagPainter(color: iconColor),
    );
  }
}

class _EarTagPainter extends CustomPainter {
  final Color color;

  _EarTagPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // Calcular el grosor del trazo basado en el tamaño para mantener proporción
    final strokeWidth = size.width * 0.08;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Margen interno grande para hacer el ícono más pequeño en el mismo canvas
    final m = size.width * 0.15; // Dejamos un 15% de margen por cada lado

    // Ancho y alto efectivo (lo que sobra después de los márgenes)
    final double ew = size.width - (m * 2);
    final double eh = size.height - (m * 2);

    // Offset X e Y para centrar el dibujo
    final double ox = m;
    final double oy = m;

    // --- Proporciones Super Compactas (Paso 3) ---
    final neckWidth = ew * 0.35; // Cuello estrecho en relación al área efectiva
    final neckXLeft = ox + ((ew - neckWidth) / 2);
    final neckXRight = neckXLeft + neckWidth;
    final neckTopY = oy + (eh * 0.10);

    final shoulderY = oy + (eh * 0.35);
    final shoulderExtension = ew * 0.15;
    final shoulderXLeft = neckXLeft - shoulderExtension;
    final shoulderXRight = neckXRight + shoulderExtension;

    final baseWidth = ew * 0.60;
    final baseXLeft = ox + ((ew - baseWidth) / 2);
    final baseXRight = baseXLeft + baseWidth;
    final bottomY = oy + (eh * 0.90);

    // --- Dibujar el contorno del arete ---
    path.moveTo(neckXLeft + strokeWidth / 2, neckTopY);

    // Borde superior recto
    path.quadraticBezierTo(
      ox + (ew * 0.5),
      neckTopY - (eh * 0.02),
      neckXRight - strokeWidth / 2,
      neckTopY,
    );

    // Curva derecha superior
    path.quadraticBezierTo(
      neckXRight,
      neckTopY,
      neckXRight,
      neckTopY + (eh * 0.05),
    );

    // Cuello derecho bajando
    path.lineTo(neckXRight, shoulderY - (eh * 0.08));

    // Curva del hombro derecho hacia afuera
    path.quadraticBezierTo(
      neckXRight,
      shoulderY,
      shoulderXRight - strokeWidth / 2,
      shoulderY + (eh * 0.05),
    );

    // Bajada ligera en ángulo hacia la base derecha
    path.lineTo(baseXRight - strokeWidth / 2, bottomY - (eh * 0.08));

    // Curva suave esquina inferior derecha
    path.quadraticBezierTo(
      baseXRight - strokeWidth / 2,
      bottomY,
      baseXRight - strokeWidth / 2 - (ew * 0.08),
      bottomY,
    );

    // Base recta
    path.lineTo(baseXLeft + strokeWidth / 2 + (ew * 0.08), bottomY);

    // Curva suave esquina inferior izquierda
    path.quadraticBezierTo(
      baseXLeft + strokeWidth / 2,
      bottomY,
      baseXLeft + strokeWidth / 2,
      bottomY - (eh * 0.08),
    );

    // Subida ligera en ángulo hacia el hombro izquierdo
    path.lineTo(shoulderXLeft + strokeWidth / 2, shoulderY + (eh * 0.05));

    // Curva del hombro izquierdo hacia el cuello
    path.quadraticBezierTo(
      neckXLeft,
      shoulderY,
      neckXLeft,
      shoulderY - (eh * 0.08),
    );

    // Cuello izquierdo subiendo
    path.lineTo(neckXLeft, neckTopY + (eh * 0.05));

    // Curva sutil superior izquierda
    path.quadraticBezierTo(
      neckXLeft,
      neckTopY,
      neckXLeft + strokeWidth / 2,
      neckTopY,
    );

    // Dibujar el trazo
    canvas.drawPath(path, paint);

    // --- Dibujar el pin / orificio de respiración ---
    canvas.drawCircle(
      Offset(ox + (ew * 0.5), oy + (eh * 0.22)),
      ew * 0.05,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _EarTagPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
