import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/core/extensions/enum_ui_extensions.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/presentation/widgets/native_dropdown/native_dropdown.dart';
import 'package:sirega_app/presentation/widgets/native_dropdown/dropdown_item_tile.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para información reproductiva del animal
class ReproductionFormSection extends StatelessWidget {
  const ReproductionFormSection({super.key});

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
                // Mostrar campos solo para hembras
                if (controller.sex == Sexo.hembra) ...[
                  // Estado Reproductivo
                  NativeDropdown<EstadoReproductivo>(
                    controller: controller.estadoReproductivoDisplayController,
                    focusNode: controller.estadoReproductivoFocus,
                    labelText: 'Estado Reproductivo',
                    prefixIcon: Icons.pregnant_woman,
                    items: EstadoReproductivo.values,
                    displayStringForOption: (e) => e.displayName,
                    onSelected: (estado) {
                      controller.setEstadoReproductivo(estado);
                    },
                    readOnly: true,
                    initialSelection: controller.reproductiveStatus,
                    itemBuilder: (context, estado) => DropdownItemTile(
                      icon: estado.icon,
                      color: estado.color,
                      text: estado.displayName,
                    ),
                  ),

                  SizedBox(height: isMobile ? 12 : 16),

                  // Switch de Gestante
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SwitchListTile(
                      title: const Text('Gestante'),
                      subtitle: controller.isPregnant
                          ? const Text('La hembra está en gestación')
                          : const Text('La hembra no está en gestación'),
                      value: controller.isPregnant,
                      onChanged: (value) {
                        controller.setGestante(value);
                      },
                      secondary: Icon(
                        controller.isPregnant
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: controller.isPregnant
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      activeThumbColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ] else ...[
                  // Mensaje para machos o castrados
                  Container(
                    padding: EdgeInsets.all(isMobile ? 10 : 12),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(26),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.withAlpha(77)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue.shade700,
                          size: isMobile ? 18 : 20,
                        ),
                        SizedBox(width: isMobile ? 8 : 12),
                        Expanded(
                          child: Text(
                            'La información reproductiva solo aplica para hembras.',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: isMobile ? 12 : 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
