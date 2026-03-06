import 'package:flutter/material.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

/// Helper methods to standardize the UI components across different detail tabs.
class AnimalDetailHelpers {
  /// Builds a standard row for basic information with a custom icon/color.
  static Widget buildDetailRow(
    BuildContext context,
    String label,
    String value,
    IconData icon, {
    Color? valueColor,
    Widget? customIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: (valueColor ?? Theme.of(context).primaryColor).withValues(
                alpha: 0.1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                customIcon ??
                Icon(
                  icon,
                  size: 22,
                  color: valueColor ?? Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: valueColor ?? AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a standard empty state placeholder across tabs.
  static Widget buildEmptyState(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Icon(
            Icons.inbox_rounded,
            size: 48,
            color: AppColors.textHint.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: TextStyle(
              color: AppColors.textHint.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  /// Maps an animal status string to a standard UI color.
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'activo':
        return AppColors.success;
      case 'enfermo':
        return AppColors.warning;
      case 'muerto':
        return AppColors.error;
      default:
        return AppColors.textHint;
    }
  }

  /// Centralized standard date formatter.
  static String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
