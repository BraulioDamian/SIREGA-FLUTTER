import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/production_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/services/isar_service.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

enum ChartType { milk, weight }

/// Filtro de período temporal
enum _PeriodFilter { oneMonth, threeMonths, sixMonths, oneYear, all }

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
  int? _selectedIndex;
  _PeriodFilter _period = _PeriodFilter.all;
  late Future<List<ProductionRecord>> _dataFuture;

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
    _loadData();
  }

  @override
  void didUpdateWidget(covariant ProductionChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animal.id != widget.animal.id ||
        oldWidget.type != widget.type) {
      _loadData();
    }
  }

  void _loadData() {
    final isarService = RepositoryProvider.of<IsarService>(context);
    _dataFuture = isarService.getProductionByAnimal(widget.animal.id);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Filtra registros por período seleccionado
  List<ProductionRecord> _filterByPeriod(List<ProductionRecord> registros) {
    if (_period == _PeriodFilter.all || registros.isEmpty) return registros;
    final now = DateTime.now();
    final cutoff = switch (_period) {
      _PeriodFilter.oneMonth => DateTime(now.year, now.month - 1, now.day),
      _PeriodFilter.threeMonths => DateTime(now.year, now.month - 3, now.day),
      _PeriodFilter.sixMonths => DateTime(now.year, now.month - 6, now.day),
      _PeriodFilter.oneYear => DateTime(now.year - 1, now.month, now.day),
      _PeriodFilter.all => now, // no se alcanza
    };
    return registros.where((r) => r.date.isAfter(cutoff)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.type == ChartType.milk
        ? AppColors.info
        : AppColors.success;
    final title = widget.type == ChartType.milk
        ? 'Producción de Leche (L/día)'
        : 'Evolución del Peso (kg)';

    return FutureBuilder<List<ProductionRecord>>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 380,
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
        var registrosFiltrados = registros.where((r) {
          if (widget.type == ChartType.milk) {
            return r.tipo == ProductionType.milk && r.litrosPorDia != null;
          } else {
            return r.tipo == ProductionType.weight && r.pesoKg != null;
          }
        }).toList();

        // Ordenar por date
        registrosFiltrados.sort((a, b) => a.date.compareTo(b.date));

        // Aplicar filtro de período
        registrosFiltrados = _filterByPeriod(registrosFiltrados);

        // Extraer datos y fechas
        final data = <double>[];
        final dates = <DateTime>[];
        for (final r in registrosFiltrados) {
          final v = widget.type == ChartType.milk
              ? (r.litrosPorDia ?? 0.0)
              : (r.pesoKg ?? 0.0);
          if (v > 0) {
            data.add(v);
            dates.add(r.date);
          }
        }

        // Si no hay datos, mostrar estado vacío
        if (data.isEmpty) {
          return Container(
            height: 380,
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
                ],
              ),
            ),
          );
        }

        // Calcular estadísticas
        final minValue = data.reduce(math.min);
        final maxValue = data.reduce(math.max);
        final avgValue = data.reduce((a, b) => a + b) / data.length;

        // Calcular tendencia
        final lastValue = data.last;
        final trend = data.length >= 2 ? lastValue - avgValue : 0.0;
        final trendPercent = avgValue > 0
            ? (trend / avgValue * 100).abs()
            : 0.0;
        final showTrend = data.length >= 2 && trend != 0;

        // Total de registros sin filtro para mostrar en chips
        final totalRegistros = registros.where((r) {
          if (widget.type == ChartType.milk) {
            return r.tipo == ProductionType.milk &&
                r.litrosPorDia != null &&
                (r.litrosPorDia ?? 0) > 0;
          } else {
            return r.tipo == ProductionType.weight &&
                r.pesoKg != null &&
                (r.pesoKg ?? 0) > 0;
          }
        }).length;

        return Container(
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
                    Expanded(
                      child: Column(
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
                      child: showTrend
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
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
                            )
                          : Text(
                              '${data.length} reg.',
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                    ),
                  ],
                ),
                // Filtros de período (solo si hay suficientes registros)
                if (totalRegistros >= 3) ...[
                  const SizedBox(height: 12),
                  _buildPeriodChips(color),
                ],
                const SizedBox(height: 12),
                // Gráfico interactivo
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTapDown: (details) => _onTouch(
                          details.localPosition,
                          constraints.biggest,
                          data,
                        ),
                        onPanUpdate: (details) => _onTouch(
                          details.localPosition,
                          constraints.biggest,
                          data,
                        ),
                        onPanEnd: (_) => _clearSelection(),
                        onTapUp: (_) {
                          // Mantener selección visible 2s después de tap
                          Future.delayed(const Duration(seconds: 2), () {
                            if (mounted) setState(() => _selectedIndex = null);
                          });
                        },
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
                                dates: dates,
                                selectedIndex: _selectedIndex,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                // Hint de interacción
                if (_selectedIndex == null)
                  Center(
                    child: Text(
                      'Toca o desliza sobre el gráfico',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.textHint,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 14),
                const SizedBox(height: 8),
                // Leyenda con datos reales
                _buildLegendWithData(color, minValue, avgValue, maxValue),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Determina el punto más cercano al toque
  void _onTouch(Offset localPosition, Size size, List<double> data) {
    if (data.isEmpty) return;
    final chartWidth = size.width;
    final touchX = localPosition.dx.clamp(0.0, chartWidth);

    int closest = 0;
    double minDist = double.infinity;
    for (int i = 0; i < data.length; i++) {
      final x = data.length == 1
          ? chartWidth / 2
          : (chartWidth / (data.length - 1)) * i;
      final dist = (x - touchX).abs();
      if (dist < minDist) {
        minDist = dist;
        closest = i;
      }
    }
    if (_selectedIndex != closest) {
      setState(() => _selectedIndex = closest);
    }
  }

  void _clearSelection() {
    // Dejar tooltip visible un momento tras soltar
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _selectedIndex = null);
    });
  }

  Widget _buildPeriodChips(Color color) {
    const labels = {
      _PeriodFilter.oneMonth: '1M',
      _PeriodFilter.threeMonths: '3M',
      _PeriodFilter.sixMonths: '6M',
      _PeriodFilter.oneYear: '1A',
      _PeriodFilter.all: 'Todo',
    };
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _PeriodFilter.values.map((p) {
        final selected = _period == p;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _period = p;
                _selectedIndex = null;
              });
              // Re-animar el gráfico al cambiar período
              _animationController.reset();
              _animationController.forward();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: selected ? color : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: selected ? color : color.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Text(
                labels[p]!,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                  color: selected ? Colors.white : color,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLegendWithData(Color color, double min, double avg, double max) {
    final suffix = widget.type == ChartType.milk ? 'L' : 'kg';
    if (min == max) {
      return Center(
        child: _buildLegendItem(
          'Valor actual',
          '${avg.toStringAsFixed(1)}$suffix',
          color,
        ),
      );
    }
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

// ─────────────────────────────────────────────
// ChartPainter — ahora con soporte de selección
// ─────────────────────────────────────────────

class ChartPainter extends CustomPainter {
  final Color color;
  final double progress;
  final ChartType type;
  final List<double> data;
  final List<DateTime> dates;
  final int? selectedIndex;

  ChartPainter({
    required this.color,
    required this.progress,
    required this.type,
    required this.data,
    required this.dates,
    this.selectedIndex,
  });

  static final _dateFormat = DateFormat('d MMM yyyy', 'es');

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [color.withValues(alpha: 0.25), color.withValues(alpha: 0.0)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final gridPaint = Paint()
      ..color = AppColors.divider
      ..strokeWidth = 0.5;

    // Reservar espacio arriba para tooltip
    const double topPadding = 34;
    final chartHeight = size.height - topPadding;

    // Líneas de cuadrícula
    const int gridLines = 4;
    for (int i = 0; i <= gridLines; i++) {
      final y = topPadding + (chartHeight / gridLines) * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Calcular puntos
    final maxValue = data.reduce(math.max);
    final minValue = data.reduce(math.min);
    final range = maxValue - minValue;
    final points = <Offset>[];

    for (int i = 0; i < data.length; i++) {
      final x = data.length == 1
          ? size.width / 2
          : (size.width / (data.length - 1)) * i;
      final normalizedValue = range > 0 ? (data[i] - minValue) / range : 0.5;
      final y =
          topPadding + chartHeight - (normalizedValue * chartHeight * 0.85) - 8;
      points.add(Offset(x, y));
    }

    // Área bajo la curva
    if (points.isNotEmpty && progress > 0) {
      final path = Path();
      final lastIdx = (points.length * progress).round().clamp(
        1,
        points.length,
      );
      path.moveTo(points.first.dx, size.height);
      path.lineTo(points.first.dx, points.first.dy);
      for (int i = 1; i < lastIdx; i++) {
        final xMid = (points[i - 1].dx + points[i].dx) / 2;
        path.quadraticBezierTo(
          xMid,
          points[i - 1].dy,
          points[i].dx,
          points[i].dy,
        );
      }
      path.lineTo(points[lastIdx - 1].dx, size.height);
      path.close();
      canvas.drawPath(path, fillPaint);
    }

    // Línea principal
    if (points.length > 1 && progress > 0) {
      final curvePath = Path();
      final lastIdx = (points.length * progress).round().clamp(
        1,
        points.length,
      );
      curvePath.moveTo(points.first.dx, points.first.dy);
      for (int i = 1; i < lastIdx; i++) {
        final xMid = (points[i - 1].dx + points[i].dx) / 2;
        curvePath.quadraticBezierTo(
          xMid,
          points[i - 1].dy,
          points[i].dx,
          points[i].dy,
        );
      }
      canvas.drawPath(curvePath, linePaint);
    }

    // Dibujar puntos
    for (int i = 0; i < points.length; i++) {
      if (i / points.length > progress) continue;
      final isSelected = selectedIndex == i;
      final pointProgress = ((progress * points.length) - i).clamp(0.0, 1.0);
      final baseSize = isSelected ? 8.0 : 5.0;
      final pointSize = baseSize * pointProgress;

      if (isSelected) {
        // Línea guía vertical
        canvas.drawLine(
          Offset(points[i].dx, topPadding),
          Offset(points[i].dx, size.height),
          Paint()
            ..color = color.withValues(alpha: 0.2)
            ..strokeWidth = 1,
        );

        // Glow del punto seleccionado
        canvas.drawCircle(
          points[i],
          pointSize + 4,
          Paint()
            ..color = color.withValues(alpha: 0.15)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
        );
      }

      // Punto exterior
      canvas.drawCircle(
        points[i],
        pointSize,
        Paint()
          ..color = isSelected ? color : color.withValues(alpha: 0.3)
          ..style = PaintingStyle.fill,
      );
      // Punto interior blanco
      canvas.drawCircle(
        points[i],
        math.max(pointSize - 2, 0),
        Paint()
          ..color = AppColors.surface
          ..style = PaintingStyle.fill,
      );
      // Borde
      canvas.drawCircle(
        points[i],
        math.max(pointSize - 2, 0),
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = isSelected ? 2.5 : 1.5,
      );
    }

    // Tooltip del punto seleccionado (o último si no hay selección)
    final tooltipIdx =
        selectedIndex ?? ((points.length - 1) * progress).round();
    if (tooltipIdx >= 0 &&
        tooltipIdx < data.length &&
        points.isNotEmpty &&
        progress > 0) {
      _drawTooltip(canvas, size, points, tooltipIdx);
    }
  }

  void _drawTooltip(Canvas canvas, Size size, List<Offset> points, int idx) {
    final value = data[idx];
    final suffix = type == ChartType.milk ? 'L' : 'kg';
    final valueStr =
        '${value.toStringAsFixed(value == value.roundToDouble() ? 0 : 1)}$suffix';
    final hasDate = idx < dates.length;
    final dateStr = hasDate ? _dateFormat.format(dates[idx]) : '';

    // Línea 1: valor   Línea 2: date
    final valuePainter = TextPainter(
      text: TextSpan(
        text: valueStr,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final datePainter = hasDate
        ? (TextPainter(
            text: TextSpan(
              text: dateStr,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
            ),
            textDirection: TextDirection.ltr,
          )..layout())
        : null;

    final boxW = math.max(valuePainter.width, datePainter?.width ?? 0) + 20;
    final boxH =
        valuePainter.height +
        (datePainter != null ? datePainter.height + 2 : 0) +
        12;

    final offset = points[idx];

    // Posicionar tooltip arriba del punto, clamped
    var tooltipY = offset.dy - 26;
    if (tooltipY - boxH / 2 < 0) tooltipY = boxH / 2 + 2;
    var tooltipX = offset.dx;
    if (tooltipX - boxW / 2 < 0) tooltipX = boxW / 2 + 2;
    if (tooltipX + boxW / 2 > size.width) tooltipX = size.width - boxW / 2 - 2;

    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(tooltipX, tooltipY),
        width: boxW,
        height: boxH,
      ),
      const Radius.circular(10),
    );

    // Sombra
    canvas.drawRRect(
      rect.shift(const Offset(0, 2)),
      Paint()
        ..color = Colors.black.withValues(alpha: 0.08)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );

    // Fondo
    canvas.drawRRect(rect, Paint()..color = AppColors.surface);

    // Borde
    canvas.drawRRect(
      rect,
      Paint()
        ..color = color.withValues(alpha: 0.4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    // Valor
    final textStartY = tooltipY - boxH / 2 + 6;
    valuePainter.paint(
      canvas,
      Offset(tooltipX - valuePainter.width / 2, textStartY),
    );

    // Fecha
    if (datePainter != null) {
      datePainter.paint(
        canvas,
        Offset(
          tooltipX - datePainter.width / 2,
          textStartY + valuePainter.height + 1,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(ChartPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.data != data ||
        oldDelegate.selectedIndex != selectedIndex;
  }
}
