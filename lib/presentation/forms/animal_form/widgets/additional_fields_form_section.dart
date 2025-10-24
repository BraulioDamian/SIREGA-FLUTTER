import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para campos adicionales de identificación y características
class AdditionalFieldsFormSection extends StatelessWidget {
  const AdditionalFieldsFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AnimalFormController>();

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Información Adicional',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Arete Visual y Número de Herrado
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.idAreteVisualController,
                    decoration: _inputDecoration('Arete Visual', Icons.tag),
                    textCapitalization: TextCapitalization.characters,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: controller.numeroHerradoController,
                    decoration: _inputDecoration('Número de Herrado', Icons.format_list_numbered),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Color del Pelaje
            TextFormField(
              controller: controller.colorPelajeController,
              decoration: _inputDecoration('Color del Pelaje', Icons.palette),
              textCapitalization: TextCapitalization.words,
            ),

            const SizedBox(height: 16),

            // Señas Particulares
            TextFormField(
              controller: controller.senasParticularesController,
              decoration: _inputDecoration('Señas Particulares', Icons.description),
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),

            const SizedBox(height: 16),

            // Peso al Nacer y Peso Actual
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.pesoNacimientoController,
                    decoration: _inputDecoration('Peso al Nacer (kg)', Icons.scale),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: controller.pesoActualController,
                    decoration: _inputDecoration('Peso Actual (kg)', Icons.monitor_weight),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }
}
