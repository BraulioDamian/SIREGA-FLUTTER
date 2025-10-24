import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para información reproductiva del animal
class ReproductionFormSection extends StatelessWidget {
  const ReproductionFormSection({super.key});

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
                Icon(Icons.pregnant_woman,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Estado Reproductivo',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Mostrar campos solo para hembras
            if (controller.sexo == Sexo.hembra) ...[
              // Estado Reproductivo
              DropdownButtonFormField<EstadoReproductivo>(
                initialValue: controller.estadoReproductivo,
                decoration: _inputDecoration(
                  'Estado Reproductivo',
                  Icons.pregnant_woman,
                ),
                items: EstadoReproductivo.values.map((estado) {
                  return DropdownMenuItem(
                    value: estado,
                    child: Text(_getEstadoReproductivoName(estado)),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.setEstadoReproductivo(value);
                },
              ),

              const SizedBox(height: 16),

              // Switch de Gestante
              SwitchListTile(
                title: const Text('Gestante'),
                subtitle: controller.gestante
                    ? const Text('La hembra está en gestación')
                    : const Text('La hembra no está en gestación'),
                value: controller.gestante,
                onChanged: (value) {
                  controller.setGestante(value);
                },
                secondary: Icon(
                  controller.gestante
                      ? Icons.check_circle
                      : Icons.check_circle_outline,
                  color: controller.gestante
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
                activeThumbColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ] else ...[
              // Mensaje para machos o castrados
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue.shade700),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'La información reproductiva solo aplica para hembras.',
                        style: TextStyle(color: Colors.blue.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

  String _getEstadoReproductivoName(EstadoReproductivo estado) {
    switch (estado) {
      case EstadoReproductivo.virgen:
        return 'Virgen';
      case EstadoReproductivo.servida:
        return 'Servida';
      case EstadoReproductivo.gestante:
        return 'Gestante';
      case EstadoReproductivo.lactante:
        return 'Lactante';
      case EstadoReproductivo.seca:
        return 'Seca';
      case EstadoReproductivo.descarte:
        return 'Descarte';
      case EstadoReproductivo.reproductorActivo:
        return 'Reproductor Activo';
      case EstadoReproductivo.reproductorInactivo:
        return 'Reproductor Inactivo';
    }
  }
}
