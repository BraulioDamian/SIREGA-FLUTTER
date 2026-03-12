// lib/presentation/widgets/home/quick_actions_section.dart
import 'package:flutter/material.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class QuickActionsSection extends StatelessWidget {
  final VoidCallback onRegisterAnimal;
  final VoidCallback onRegisterEvent;
  final VoidCallback onViewInventory;

  const QuickActionsSection({
    super.key,
    required this.onRegisterAnimal,
    required this.onRegisterEvent,
    required this.onViewInventory,
  });

  Widget _buildActionChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required BuildContext context, // Added context here
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textPrimary.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.textPrimary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Acciones Rápidas',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionChip(
              icon: Icons.add_circle_outline,
              label: 'Registrar Animal',
              onTap: onRegisterAnimal,
              context: context,
            ),
            _buildActionChip(
              icon: Icons.event_note,
              label: 'Registrar Evento',
              onTap: onRegisterEvent,
              context: context,
            ),
            _buildActionChip(
              icon: Icons.list_alt,
              label: 'Ver Inventario',
              onTap: onViewInventory,
              context: context,
            ),
          ],
        ),
      ],
    );
  }
}
