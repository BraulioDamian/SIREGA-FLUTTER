import 'package:flutter/material.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class ScannerAnimation extends StatefulWidget {
  final IconData icon;
  final bool isActive;
  final Color primaryColor;

  const ScannerAnimation({
    super.key,
    required this.icon,
    required this.isActive,
    required this.primaryColor,
  });

  @override
  State<ScannerAnimation> createState() => _ScannerAnimationState();
}

class _ScannerAnimationState extends State<ScannerAnimation>
    with TickerProviderStateMixin {
  late AnimationController _rippleController;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    if (widget.isActive) {
      _rippleController.repeat();
    }
  }

  @override
  void didUpdateWidget(ScannerAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _rippleController.repeat();
      } else {
        _rippleController.stop();
      }
    }
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: CustomPaint(
        painter: _RipplePainter(
          ripple: _rippleController,
          isActive: widget.isActive,
          color: widget.primaryColor,
        ),
        child: Center(
          child: Icon(
            widget.icon,
            size: 32,
            color: widget.isActive
                ? widget.primaryColor
                : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final Animation<double> ripple;
  final bool isActive;
  final Color color;

  _RipplePainter({
    required this.ripple,
    required this.isActive,
    required this.color,
  }) : super(repaint: ripple);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    if (isActive) {
      final ripplePaint1 = Paint()
        ..color = color.withValues(alpha: (1 - ripple.value))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5;

      canvas.drawCircle(center, radius * ripple.value, ripplePaint1);

      final delayedRippleValue = (ripple.value - 0.5).clamp(0.0, 1.0);
      final ripplePaint2 = Paint()
        ..color = color.withValues(alpha: (1 - delayedRippleValue))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5;
      canvas.drawCircle(center, radius * delayedRippleValue, ripplePaint2);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
