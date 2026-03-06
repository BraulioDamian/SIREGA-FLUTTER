import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class SiregaCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Color? color;

  const SiregaCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidget = Card(
      color: color,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: cardWidget,
      );
    }

    return cardWidget;
  }
}
