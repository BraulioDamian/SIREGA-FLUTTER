import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para información de salud del animal
class HealthFormSection extends StatelessWidget {
  const HealthFormSection({super.key});

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
                Icon(Icons.health_and_safety,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Estado de Salud',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Estado de Salud
            DropdownButtonFormField<EstadoSalud>(
              initialValue: controller.estadoSalud,
              decoration: _inputDecoration(
                'Estado de Salud',
                _getHealthIcon(controller.estadoSalud),
              ),
              items: EstadoSalud.values.map((estado) {
                return DropdownMenuItem(
                  value: estado,
                  child: Row(
                    children: [
                      Icon(
                        _getHealthIcon(estado),
                        color: _getHealthColor(estado),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(_getEstadoSaludName(estado)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.setEstadoSalud(value);
                }
              },
            ),

            const SizedBox(height: 16),

            // Estado del Animal
            DropdownButtonFormField<EstadoAnimal>(
              initialValue: controller.estadoAnimal,
              decoration: _inputDecoration('Estado del Animal', Icons.pets),
              items: EstadoAnimal.values.map((estado) {
                return DropdownMenuItem(
                  value: estado,
                  child: Text(_getEstadoAnimalName(estado)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.setEstadoAnimal(value);
                }
              },
            ),

            // Campo condicional: Descripción de la situación de salud
            if (controller.requiereDescripcionSalud(controller.estadoSalud)) ...[
              const SizedBox(height: 16),

              // Banner informativo
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getHealthColor(controller.estadoSalud).withAlpha(26),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _getHealthColor(controller.estadoSalud).withAlpha(77),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: _getHealthColor(controller.estadoSalud),
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Se requiere especificar el diagnóstico, tratamiento o situación del animal',
                        style: TextStyle(
                          color: _getHealthColor(controller.estadoSalud).withAlpha(230),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Campo de texto para la descripción
              TextFormField(
                controller: controller.descripcionSaludController,
                decoration: _inputDecoration(
                  'Descripción de la Situación *',
                  Icons.medical_information_outlined,
                ).copyWith(
                  hintText: 'Ej: Fiebre alta, tratamiento con antibióticos...',
                  helperText: 'Especifique diagnóstico, síntomas o tratamiento aplicado',
                ),
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (controller.requiereDescripcionSalud(controller.estadoSalud)) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Debe especificar la situación de salud del animal';
                    }
                    if (value.trim().length < 10) {
                      return 'La descripción debe tener al menos 10 caracteres';
                    }
                  }
                  return null;
                },
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

  Color _getHealthColor(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return Colors.green;
      case EstadoSalud.enfermo:
        return Colors.orange;
      case EstadoSalud.critico:
        return Colors.red;
      case EstadoSalud.convaleciente:
        return Colors.blue;
      case EstadoSalud.enTratamiento:
        return Colors.purple;
      case EstadoSalud.enObservacion:
        return Colors.grey;
    }
  }

  IconData _getHealthIcon(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return Icons.check_circle_outline;
      case EstadoSalud.enfermo:
        return Icons.sick_outlined;
      case EstadoSalud.critico:
        return Icons.warning_amber_rounded;
      case EstadoSalud.convaleciente:
        return Icons.health_and_safety_outlined;
      case EstadoSalud.enTratamiento:
        return Icons.medical_services_outlined;
      case EstadoSalud.enObservacion:
        return Icons.visibility_outlined;
    }
  }

  String _getEstadoSaludName(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return 'Sano';
      case EstadoSalud.enfermo:
        return 'Enfermo';
      case EstadoSalud.critico:
        return 'Crítico';
      case EstadoSalud.convaleciente:
        return 'Convaleciente';
      case EstadoSalud.enTratamiento:
        return 'En Tratamiento';
      case EstadoSalud.enObservacion:
        return 'En Observación';
    }
  }

  String _getEstadoAnimalName(EstadoAnimal estado) {
    switch (estado) {
      case EstadoAnimal.activo:
        return 'Activo';
      case EstadoAnimal.vendido:
        return 'Vendido';
      case EstadoAnimal.muerto:
        return 'Muerto';
      case EstadoAnimal.perdido:
        return 'Perdido';
      case EstadoAnimal.enfermo:
        return 'Enfermo';
      case EstadoAnimal.cuarentena:
        return 'Cuarentena';
      case EstadoAnimal.prestado:
        return 'Prestado';
      case EstadoAnimal.enTransito:
        return 'En Tránsito';
    }
  }
}
