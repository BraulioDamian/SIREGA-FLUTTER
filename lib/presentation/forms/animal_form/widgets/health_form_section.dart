import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para información de salud del animal
class HealthFormSection extends StatelessWidget {
  const HealthFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalFormController>(
      builder: (context, controller, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;

            return Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context, isMobile),
                    SizedBox(height: isMobile ? 8 : 12),
                    _buildDescription(context, isMobile),
                    SizedBox(height: isMobile ? 12 : 16),

                    // Estado de Salud
                    DropdownButtonFormField<EstadoSalud>(
                      initialValue: controller.estadoSalud,
                      decoration: _inputDecoration(
                        'Estado de Salud',
                        _getHealthIcon(controller.estadoSalud),
                        context: context,
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

                    SizedBox(height: isMobile ? 12 : 16),

                    // Estado del Animal
                    DropdownButtonFormField<EstadoAnimal>(
                      initialValue: controller.estadoAnimal,
                      decoration: _inputDecoration('Estado del Animal', Icons.pets, context: context),
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
                      SizedBox(height: isMobile ? 12 : 16),

                      // Banner informativo
                      Container(
                        padding: EdgeInsets.all(isMobile ? 10 : 12),
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
                              size: isMobile ? 18 : 20,
                            ),
                            SizedBox(width: isMobile ? 8 : 12),
                            Expanded(
                              child: Text(
                                'Se requiere especificar el diagnóstico, tratamiento o situación del animal',
                                style: TextStyle(
                                  color: _getHealthColor(controller.estadoSalud).withAlpha(230),
                                  fontSize: isMobile ? 11 : 12,
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
                          context: context,
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
          },
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Icon(
          Icons.health_and_safety,
          color: Theme.of(context).primaryColor,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Estado de Salud',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context, bool isMobile) {
    return Text(
      'Información sobre el estado de salud actual del animal',
      style: TextStyle(
        fontSize: isMobile ? 12 : 14,
        color: Colors.grey.shade600,
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon, {BuildContext? context}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: context != null ? Theme.of(context).primaryColor : Colors.blue,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
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
