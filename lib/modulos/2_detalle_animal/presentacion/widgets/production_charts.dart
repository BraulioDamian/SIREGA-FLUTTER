import 'package:flutter/material.dart';
import 'dart:math' as math;

enum ChartType { milk, weight }

class ProductionChart extends StatefulWidget {
  final ChartType type;

  const ProductionChart({
    super.key,
    required this.type,
  });

  @override
  State<ProductionChart> createState() => _ProductionChartState();
}

class _ProductionChartState extends State<ProductionChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.type == ChartType.milk ? Colors.blue : Colors.green;
    final title = widget.type == ChartType.milk
        ? 'Producción de Leche (L/día)'
        : 'Evolución del Peso (kg)';
    final subtitle = widget.type == ChartType.milk
        ? 'Últimos 30 días'
        : 'Últimos 6 meses';

    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        widget.type == ChartType.milk
                            ? Icons.trending_up
                            : Icons.show_chart,
                        color: color,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.type == ChartType.milk ? '+5%' : '+12kg',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Gráfico
            Expanded(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size.infinite,
                    painter: ChartPainter(
                      color: color,
                      progress: _animation.value,
                      type: widget.type,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Leyenda
            _buildLegend(color),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildLegendItem('Min', widget.type == ChartType.milk ? '15L' : '450kg', color.withOpacity(0.5)),
        _buildLegendItem('Promedio', widget.type == ChartType.milk ? '22L' : '475kg', color),
        _buildLegendItem('Max', widget.type == ChartType.milk ? '28L' : '500kg', color.withOpacity(0.8)),
      ],
    );
  }

  Widget _buildLegendItem(String label, String value, Color color) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class ChartPainter extends CustomPainter {
  final Color color;
  final double progress;
  final ChartType type;

  ChartPainter({
    required this.color,
    required this.progress,
    required this.type,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withOpacity(0.3),
          color.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeWidth = 0.5;

    // Dibujar líneas de cuadrícula
    const int gridLines = 4;
    for (int i = 0; i <= gridLines; i++) {
      final y = (size.height / gridLines) * i;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    // Generar datos de ejemplo
    final data = _generateData();
    final maxValue = data.reduce(math.max);
    final minValue = data.reduce(math.min);
    final points = <Offset>[];

    for (int i = 0; i < data.length; i++) {
      final x = (size.width / (data.length - 1)) * i;
      final normalizedValue = (data[i] - minValue) / (maxValue - minValue);
      final y = size.height - (normalizedValue * size.height * 0.8) - 10;
      points.add(Offset(x, y));
    }

    // Dibujar área bajo la curva con gradiente
    if (points.isNotEmpty && progress > 0) {
      final path = Path();
      final lastIndex = (points.length * progress).round().clamp(1, points.length);
      
      path.moveTo(points.first.dx, size.height);
      path.lineTo(points.first.dx, points.first.dy);
      
      // Usar curvas de Bézier para suavizar la línea
      for (int i = 1; i < lastIndex; i++) {
        final xMid = (points[i - 1].dx + points[i].dx) / 2;
        final yMid = (points[i - 1].dy + points[i].dy) / 2;
        final cp1 = Offset(xMid, points[i - 1].dy);
        final cp2 = Offset(xMid, points[i].dy);
        path.quadraticBezierTo(cp1.dx, cp1.dy, points[i].dx, points[i].dy);
      }
      
      path.lineTo(points[lastIndex - 1].dx, size.height);
      path.close();
      canvas.drawPath(path, fillPaint);
    }

    // Dibujar línea principal con suavizado
    if (points.length > 1 && progress > 0) {
      final progressPath = Path();
      final lastIndex = (points.length * progress).round().clamp(1, points.length);
      
      progressPath.moveTo(points.first.dx, points.first.dy);
      
      for (int i = 1; i < lastIndex; i++) {
        final xMid = (points[i - 1].dx + points[i].dx) / 2;
        final yMid = (points[i - 1].dy + points[i].dy) / 2;
        final cp1 = Offset(xMid, points[i - 1].dy);
        final cp2 = Offset(xMid, points[i].dy);
        progressPath.quadraticBezierTo(cp1.dx, cp1.dy, points[i].dx, points[i].dy);
      }
      
      canvas.drawPath(progressPath, paint);
    }

    // Dibujar puntos con animación
    for (int i = 0; i < points.length; i++) {
      if (i / points.length <= progress) {
        final pointProgress = ((progress * points.length) - i).clamp(0.0, 1.0);
        final pointSize = 6.0 * pointProgress;
        
        // Sombra del punto
        canvas.drawCircle(
          points[i],
          pointSize + 2,
          Paint()
            ..color = color.withOpacity(0.2)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
        );
        
        // Círculo exterior
        canvas.drawCircle(
          points[i],
          pointSize,
          Paint()
            ..color = color.withOpacity(0.3)
            ..style = PaintingStyle.fill,
        );
        
        // Círculo interior blanco
        canvas.drawCircle(
          points[i],
          pointSize - 2,
          Paint()
            ..color = Colors.white
            ..style = PaintingStyle.fill,
        );
        
        // Borde del círculo
        canvas.drawCircle(
          points[i],
          pointSize - 2,
          Paint()
            ..color = color
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2,
        );
      }
    }

    // Dibujar el valor actual en el último punto visible
    if (points.isNotEmpty && progress > 0) {
      final lastIndex = ((points.length - 1) * progress).round();
      if (lastIndex < data.length) {
        final value = data[lastIndex];
        final textPainter = TextPainter(
          text: TextSpan(
            text: type == ChartType.milk ? '${value.toStringAsFixed(0)}L' : '${value.toStringAsFixed(0)}kg',
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        
        final offset = points[lastIndex];
        final boxRect = RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(offset.dx, offset.dy - 25),
            width: textPainter.width + 16,
            height: textPainter.height + 8,
          ),
          const Radius.circular(8),
        );
        
        // Fondo del tooltip
        canvas.drawRRect(
          boxRect,
          Paint()
            ..color = Colors.white
            ..style = PaintingStyle.fill,
        );
        
        // Borde del tooltip
        canvas.drawRRect(
          boxRect,
          Paint()
            ..color = color
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5,
        );
        
        // Texto del valor
        textPainter.paint(
          canvas,
          Offset(offset.dx - textPainter.width / 2, offset.dy - 25 - textPainter.height / 2),
        );
      }
    }
  }

  List<double> _generateData() {
    if (type == ChartType.milk) {
      return [18, 20, 19, 22, 21, 23, 25, 24, 26, 28, 27, 25];
    } else {
      return [450, 455, 460, 458, 465, 470, 475, 480, 485, 490, 495, 500];
    }
  }

  @override
  bool shouldRepaint(ChartPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
