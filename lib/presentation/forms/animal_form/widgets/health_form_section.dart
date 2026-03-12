import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/core/extensions/enum_ui_extensions.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/presentation/widgets/native_dropdown/native_dropdown.dart';
import 'package:sirega_app/presentation/widgets/native_dropdown/dropdown_item_tile.dart';
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

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NativeDropdown<EstadoSalud>(
                  controller: controller.estadoSaludDisplayController,
                  focusNode: controller.estadoSaludFocus,
                  labelText: 'Estado de Salud',
                  prefixIcon: Icons.favorite,
                  items: EstadoSalud.values,
                  displayStringForOption: (e) => e.displayName,
                  onSelected: (estado) {
                    controller.setEstadoSalud(estado);
                  },
                  readOnly: true,
                  initialSelection: controller.healthStatus,
                  itemBuilder: (context, estado) => DropdownItemTile(
                    icon: estado.icon,
                    color: estado.color,
                    text: estado.displayName,
                  ),
                ),

                SizedBox(height: isMobile ? 12 : 16),

                NativeDropdown<EstadoAnimal>(
                  controller: controller.estadoAnimalDisplayController,
                  focusNode: controller.estadoAnimalFocus,
                  labelText: 'Estado del Animal',
                  prefixIcon: Icons.pets,
                  items: EstadoAnimal.values,
                  displayStringForOption: (e) => e.displayName,
                  onSelected: (estado) {
                    controller.setEstadoAnimal(estado);
                  },
                  readOnly: true,
                  initialSelection: controller.estadoAnimal,
                  itemBuilder: (context, estado) => DropdownItemTile(
                    icon: estado.icon,
                    color: estado.color,
                    text: estado.displayName,
                  ),
                ),

                if (controller.requiereDescripcionSalud(
                  controller.healthStatus,
                )) ...[
                  SizedBox(height: isMobile ? 12 : 16),

                  // Banner informativo
                  Container(
                    padding: EdgeInsets.all(isMobile ? 10 : 12),
                    decoration: BoxDecoration(
                      color: controller.healthStatus.color.withAlpha(26),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: controller.healthStatus.color.withAlpha(77),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: controller.healthStatus.color,
                          size: isMobile ? 18 : 20,
                        ),
                        SizedBox(width: isMobile ? 8 : 12),
                        Expanded(
                          child: Text(
                            'Se requiere especificar el diagnóstico, tratamiento o situación del animal',
                            style: TextStyle(
                              color: controller.healthStatus.color.withAlpha(
                                230,
                              ),
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
                    decoration:
                        _inputDecoration(
                          'Descripción de la Situación *',
                          Icons.medical_information_outlined,
                          context: context,
                        ).copyWith(
                          hintText:
                              'Ej: Fiebre alta, tratamiento con antibióticos...',
                          helperText:
                              'Especifique diagnóstico, síntomas o tratamiento aplicado',
                        ),
                    maxLines: 3,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (value) {
                      if (controller.requiereDescripcionSalud(
                        controller.healthStatus,
                      )) {
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
            );
          },
        );
      },
    );
  }

  InputDecoration _inputDecoration(
    String label,
    IconData icon, {
    BuildContext? context,
  }) {
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
}
