import 'package:flutter/material.dart';

class SwipeAnimation extends StatefulWidget {
  final Color primaryColor;

  const SwipeAnimation({super.key, required this.primaryColor});

  @override
  State<SwipeAnimation> createState() => _SwipeAnimationState();
}

class _SwipeAnimationState extends State<SwipeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final double offsetX = 12 - (_animation.value * 24);
        return Transform.translate(
          offset: Offset(offsetX, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chevron_left,
                color: widget.primaryColor,
                size: 38,
              ),
              Icon(
                Icons.chevron_left,
                color: widget.primaryColor.withValues(alpha: 0.7),
                size: 38,
              ),
              Icon(
                Icons.chevron_left,
                color: widget.primaryColor.withValues(alpha: 0.5),
                size: 38,
              ),
            ],
          ),
        );
      },
    );
  }
}
