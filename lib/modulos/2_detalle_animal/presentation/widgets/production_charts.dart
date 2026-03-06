import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

enum ChartType { milk, weight }

class ProductionChart extends StatefulWidget {
  final ChartType type;
  final Animal animal;

  const ProductionChart({super.key, required this.type, required this.animal});

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
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.type == ChartType.milk
        ? AppColors.info
        : AppColors.success;
    final title = widget.type == ChartType.milk
        ? 'Producción de Leche (L/día)'
        : 'Evolución del Peso (kg)';

    final isarService = RepositoryProvider.of<IsarService>(context);

    return FutureBuilder<List<RegistroProduccion>>(
      future: isarService.obtenerProduccionPorAnimal(widget.animal.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
            ),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final registros = snapshot.data ?? [];

        // Filtrar registros según el tipo de gráfico
        final registrosFiltrados = registros.where((r) {
          if (widget.type == ChartType.milk) {
            return r.tipo == 'Producción de Leche';
          } else {
            return r.tipo == 'Pesaje' || r.pesoKg != null;
          }
        }).toList();

        // Ordenar por fecha
        registrosFiltrados.sort((a, b) => a.fecha.compareTo(b.fecha));

        // Extraer datos para el gráfico
        final data = registrosFiltrados
            .map((r) {
              if (widget.type == ChartType.milk) {
                return r.litrosPorDia ?? 0.0;
              } else {
                return r.pesoKg ?? 0.0;
              }
            })
            .where((value) => value > 0)
            .toList();

        // Si no hay datos suficientes, mostrar estado vacío
        if (data.isEmpty || data.length < 2) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.type == ChartType.milk
                        ? Icons.opacity
                        : Icons.monitor_weight,
                    size: 48,
                    color: AppColors.textHint,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.type == ChartType.milk
                        ? 'Sin datos de producción de leche'
                        : 'Sin datos de pesaje',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Registra al menos 2 mediciones',
                    style: TextStyle(fontSize: 12, color: AppColors.textHint),
                  ),
                ],
              ),
            ),
          );
        }

        // Calcular estadísticas
        final minValue = data.reduce(math.min);
        final maxValue = data.reduce(math.max);
        final avgValue = data.reduce((a, b) => a + b) / data.length;

        // Calcular tendencia (comparar último valor con promedio)
        final lastValue = data.last;
        final trend = lastValue - avgValue;
        final trendPercent = (trend / avgValue * 100).abs();

        return Container(
          height: 250,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
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
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '${data.length} registros',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
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
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            trend >= 0
                                ? Icons.trending_up
                                : Icons.trending_down,
                            color: trend >= 0
                                ? AppColors.success
                                : AppColors.error,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.type == ChartType.milk
                                ? '${trend >= 0 ? '+' : ''}${trendPercent.toStringAsFixed(1)}%'
                                : '${trend >= 0 ? '+' : ''}${trend.toStringAsFixed(1)}kg',
                            style: TextStyle(
                              color: trend >= 0
                                  ? AppColors.success
                                  : AppColors.error,
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
                          data: data,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Leyenda con datos reales
                _buildLegendWithData(color, minValue, avgValue, maxValue),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLegendWithData(Color color, double min, double avg, double max) {
    final suffix = widget.type == ChartType.milk ? 'L' : 'kg';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildLegendItem(
          'Min',
          '${min.toStringAsFixed(1)}$suffix',
          color.withValues(alpha: 0.5),
        ),
        _buildLegendItem('Promedio', '${avg.toStringAsFixed(1)}$suffix', color),
        _buildLegendItem(
          'Max',
          '${max.toStringAsFixed(1)}$suffix',
          color.withValues(alpha: 0.8),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, String value, Color color) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class ChartPainter extends CustomPainter {
  final Color color;
  final double progress;
  final ChartType type;
  final List<double> data;

  ChartPainter({
    required this.color,
    required this.progress,
    required this.type,
    required this.data,
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
        colors: [color.withValues(alpha: 0.3), color.withValues(alpha: 0.0)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final gridPaint = Paint()
      ..color = AppColors.divider
      ..strokeWidth = 0.5;

    // Dibujar líneas de cuadrícula
    const int gridLines = 4;
    for (int i = 0; i <= gridLines; i++) {
      final y = (size.height / gridLines) * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Usar los datos reales pasados como parámetro
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
      final lastIndex = (points.length * progress).round().clamp(
        1,
        points.length,
      );

      path.moveTo(points.first.dx, size.height);
      path.lineTo(points.first.dx, points.first.dy);

      // Usar curvas de Bézier para suavizar la línea
      for (int i = 1; i < lastIndex; i++) {
        final xMid = (points[i - 1].dx + points[i].dx) / 2;
        final cp1 = Offset(xMid, points[i - 1].dy);
        path.quadraticBezierTo(cp1.dx, cp1.dy, points[i].dx, points[i].dy);
      }

      path.lineTo(points[lastIndex - 1].dx, size.height);
      path.close();
      canvas.drawPath(path, fillPaint);
    }

    // Dibujar línea principal con suavizado
    if (points.length > 1 && progress > 0) {
      final progressPath = Path();
      final lastIndex = (points.length * progress).round().clamp(
        1,
        points.length,
      );

      progressPath.moveTo(points.first.dx, points.first.dy);

      for (int i = 1; i < lastIndex; i++) {
        final xMid = (points[i - 1].dx + points[i].dx) / 2;
        final cp1 = Offset(xMid, points[i - 1].dy);
        progressPath.quadraticBezierTo(
          cp1.dx,
          cp1.dy,
          points[i].dx,
          points[i].dy,
        );
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
            ..color = color.withValues(alpha: 0.2)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
        );

        // Círculo exterior
        canvas.drawCircle(
          points[i],
          pointSize,
          Paint()
            ..color = color.withValues(alpha: 0.3)
            ..style = PaintingStyle.fill,
        );

        // Círculo interior blanco
        canvas.drawCircle(
          points[i],
          pointSize - 2,
          Paint()
            ..color = AppColors.surface
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
            text: type == ChartType.milk
                ? '${value.toStringAsFixed(0)}L'
                : '${value.toStringAsFixed(0)}kg',
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
            ..color = AppColors.surface
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
          Offset(
            offset.dx - textPainter.width / 2,
            offset.dy - 25 - textPainter.height / 2,
          ),
        );
      }
    }
  }

  @override
  bool shouldRepaint(ChartPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.data != data;
  }
}
