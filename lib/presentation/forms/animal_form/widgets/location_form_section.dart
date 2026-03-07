import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para ubicación del animal
class LocationFormSection extends StatelessWidget {
  const LocationFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AnimalFormController>();

    return TextFormField(
      controller: controller.zonaActualController,
      decoration: _inputDecoration(
        'Zona / Potrero Actual',
        Icons.location_on,
      ),
      textCapitalization: TextCapitalization.words,
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
