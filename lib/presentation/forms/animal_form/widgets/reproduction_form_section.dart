import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
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

                    // Mostrar campos solo para hembras
                    if (controller.sexo == Sexo.hembra) ...[
                      // Estado Reproductivo
                      DropdownButtonFormField<EstadoReproductivo>(
                        initialValue: controller.estadoReproductivo,
                        decoration: _inputDecoration(
                          'Estado Reproductivo',
                          Icons.pregnant_woman,
                          context: context,
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

                      SizedBox(height: isMobile ? 12 : 16),

                      // Switch de Gestante
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SwitchListTile(
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
                      ),
                    ] else ...[
                      // Mensaje para machos o castrados
                      Container(
                        padding: EdgeInsets.all(isMobile ? 10 : 12),
                        decoration: BoxDecoration(
                          color: Colors.blue.withAlpha(26),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.blue.withAlpha(77),
                          ),
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
          Icons.pregnant_woman,
          color: Theme.of(context).primaryColor,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Estado Reproductivo',
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
      'Información sobre el estado reproductivo del animal',
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
