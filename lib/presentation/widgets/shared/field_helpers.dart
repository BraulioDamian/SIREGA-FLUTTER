// lib/presentation/widgets/shared/field_helpers.dart

import 'package:flutter/material.dart';

/// Widget que envuelve campos de texto numéricos para mejorar la interacción con dropdowns
class NumericFieldWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onFocusGained;
  final Duration delayBeforeAction;

  const NumericFieldWrapper({
    super.key,
    required this.child,
    this.onFocusGained,
    this.delayBeforeAction = const Duration(milliseconds: 150),
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus && onFocusGained != null) {
          Future.delayed(delayBeforeAction, () {
            if (context.mounted) {
               onFocusGained!();
            }
          });
        }
      },
      child: child,
    );
  }
}