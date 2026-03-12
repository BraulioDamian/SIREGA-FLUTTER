import 'package:flutter/material.dart';
import 'package:sirega_app/features/nfc_scanning/presentation/widgets/animal_info_card.dart';
import 'package:sirega_app/core/models/animal_model.dart';

/// Widget unificado para mostrar el resultado del escaneo NFC
/// Puede ser usado tanto para el escáner móvil como para el escáner externo ESP32
class ScanResultWidget extends StatelessWidget {
  final Animal animal;
  final VoidCallback onScanAnother;
  final VoidCallback? onViewDetails;
  final VoidCallback? onEditData;
  final String successMessage;

  const ScanResultWidget({
    super.key,
    required this.animal,
    required this.onScanAnother,
    this.onViewDetails,
    this.onEditData,
    this.successMessage = 'Animal encontrado',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Banner de éxito
          _buildSuccessBanner(theme),
          const SizedBox(height: 16),

          // Tarjeta con información del animal
          AnimalInfoCard(
            animal: animal,
            onVerMas: onViewDetails,
            onEditarDatos: onEditData,
          ),
          const SizedBox(height: 20),

          // Botón para escanear otro
          _buildScanAnotherButton(context),
        ],
      ),
    );
  }

  Widget _buildSuccessBanner(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.withAlpha((255 * 0.1).round()),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green, width: 1.5),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.withAlpha((255 * 0.2).round()),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  successMessage,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  animal.name,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScanAnotherButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onScanAnother,
        icon: const Icon(Icons.refresh),
        label: const Text('Escanear Otro Animal'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
