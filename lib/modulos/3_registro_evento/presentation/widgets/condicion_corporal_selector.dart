import 'package:flutter/material.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

/// Body condition score selector (1-5 scale) for veterinary reviews.
class CondicionCorporalSelector extends StatelessWidget {
  final int? selected;
  final Color accentColor;
  final ValueChanged<int> onSelected;

  const CondicionCorporalSelector({
    super.key,
    required this.selected,
    required this.accentColor,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Condición Corporal',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Escala del 1 (muy flaco) al 5 (obeso)',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            final score = index + 1;
            final isSelected = selected == score;
            return GestureDetector(
              onTap: () => onSelected(score),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isSelected
                      ? accentColor.withValues(alpha: 0.15)
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? accentColor : AppColors.divider,
                    width: isSelected ? 2.0 : 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$score',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? accentColor : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
