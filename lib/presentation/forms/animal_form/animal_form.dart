import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/animal_form_controller.dart';
import 'widgets/image_picker_section.dart';
import 'widgets/siniga_form_section.dart';
import 'widgets/basic_info_form_section.dart';
import 'widgets/nfc_section.dart';
import 'widgets/validation_summary.dart';

/// Formulario reutilizable para crear o editar animales
/// Puede ser usado en diferentes pantallas con diferentes configuraciones
class AnimalForm extends StatelessWidget {
  final AnimalFormController controller;
  final VoidCallback onSave;
  final String? saveButtonText;
  final bool showValidationSummary;
  
  const AnimalForm({
    super.key,
    required this.controller,
    required this.onSave,
    this.saveButtonText,
    this.showValidationSummary = true,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: Consumer<AnimalFormController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          return LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final isMobile = screenWidth < 600;
              final isTablet = screenWidth >= 600 && screenWidth < 1024;
              
              // Responsive padding
              EdgeInsets padding;
              if (isMobile) {
                padding = const EdgeInsets.all(16);
              } else if (isTablet) {
                padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 24);
              } else {
                // Desktop - contenido centrado con máximo ancho
                return Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    padding: const EdgeInsets.all(32),
                    child: _buildFormContent(context),
                  ),
                );
              }
              
              return SingleChildScrollView(
                padding: padding,
                child: _buildFormContent(context),
              );
            },
          );
        },
      ),
    );
  }
  
  Widget _buildFormContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Selector de imagen
        const ImagePickerSection(),
        const SizedBox(height: 24),
        
        // Formulario SINIGA
        const SinigaFormSection(),
        const SizedBox(height: 24),
        
        // Información básica
        const BasicInfoFormSection(),
        const SizedBox(height: 24),
        
        // Sección NFC
        const NfcSection(),
        const SizedBox(height: 24),
        
        // Resumen de validación (opcional)
        if (showValidationSummary) ...[
          const ValidationSummary(),
          const SizedBox(height: 24),
        ],
        
        // Botón de guardado
        SaveButton(
          onPressed: onSave,
          text: saveButtonText ?? 
                (controller.isEditMode ? 'Actualizar Animal' : 'Guardar Animal'),
        ),
      ],
    );
  }
}
