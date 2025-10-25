import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para campos adicionales de identificación y características
class AdditionalFieldsFormSection extends StatelessWidget {
  const AdditionalFieldsFormSection({super.key});

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

                    // Número de Herrado
                    TextFormField(
                      controller: controller.numeroHerradoController,
                      decoration: _inputDecoration('Número de Herrado', Icons.format_list_numbered, context),
                    ),

                    SizedBox(height: isMobile ? 12 : 16),

                    // Color del Pelaje
                    TextFormField(
                      controller: controller.colorPelajeController,
                      decoration: _inputDecoration('Color del Pelaje', Icons.palette, context),
                      textCapitalization: TextCapitalization.words,
                    ),

                    SizedBox(height: isMobile ? 12 : 16),

                    // Señas Particulares
                    TextFormField(
                      controller: controller.senasParticularesController,
                      decoration: _inputDecoration('Señas Particulares', Icons.description, context),
                      maxLines: 3,
                      textCapitalization: TextCapitalization.sentences,
                    ),
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
          Icons.info_outline,
          color: Theme.of(context).primaryColor,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Información Adicional',
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
      'Datos complementarios de identificación del animal',
      style: TextStyle(
        fontSize: isMobile ? 12 : 14,
        color: Colors.grey.shade600,
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon, BuildContext context) {
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
          color: Theme.of(context).primaryColor,
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
