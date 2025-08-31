import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';
import '../../../widgets/native_dropdown/native_dropdown.dart';

class SinigaFormSection extends StatelessWidget {
  const SinigaFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalFormController>(
      builder: (context, controller, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;
            final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
            
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
                    _buildSinigaFields(controller, isMobile, isTablet, context),
                    SizedBox(height: isMobile ? 12 : 16),
                    _buildEstadoDropdown(context, controller),
                    if (controller.sinigaValidationMessage != null) ...[
                      SizedBox(height: isMobile ? 12 : 16),
                      _buildValidationMessage(controller, isMobile),
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
          Icons.pets,
          color: Theme.of(context).primaryColor,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Identificación SINIGA (Obligatorio)',
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
      'Formato: Especie (2) + Estado (2) + Número Nacional (8)',
      style: TextStyle(
        fontSize: isMobile ? 12 : 14,
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget _buildSinigaFields(AnimalFormController controller, bool isMobile, bool isTablet, BuildContext context) {
    if (isMobile) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(flex: 1, child: _buildEspecieField(controller)),
              const SizedBox(width: 8),
              Expanded(flex: 1, child: _buildEstadoField(controller, context)),
            ],
          ),
          const SizedBox(height: 12),
          _buildNumeroField(controller, context),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(flex: 2, child: _buildEspecieField(controller)),
          const SizedBox(width: 8),
          Expanded(flex: 2, child: _buildEstadoField(controller, context)),
          const SizedBox(width: 8),
          Expanded(flex: 4, child: _buildNumeroField(controller, context)),
        ],
      );
    }
  }

  Widget _buildEspecieField(AnimalFormController controller) {
    return TextFormField(
      controller: controller.especieController,
      decoration: const InputDecoration(
        labelText: 'Especie',
        helperText: '00 = Bovinos',
        border: OutlineInputBorder(),
        counterText: '',
      ),
      maxLength: 2,
      readOnly: true,
      style: const TextStyle(
        fontFamily: 'monospace',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEstadoField(AnimalFormController controller, BuildContext context) {
    final bool isValid = controller.estadoController.text.length == 2 && 
                         controller.estadoSeleccionado != null;
    
    return TextFormField(
      controller: controller.estadoController,
      focusNode: controller.estadoFocus,
      decoration: InputDecoration(
        labelText: 'Estado',
        helperText: isValid
            ? '✓ ${controller.estadoSeleccionado?.nombre ?? ''}'
            : 'Código 01-32',
        helperStyle: TextStyle(
          color: isValid ? Colors.green : null,
          fontWeight: isValid ? FontWeight.bold : null,
          fontSize: 11,
        ),
        errorText: controller.estadoController.text.isNotEmpty && 
                  !isValid && 
                  controller.estadoController.text.length == 2
            ? 'Código inválido'
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: isValid ? Colors.green : Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isValid ? Colors.green : Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: isValid 
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green.shade300,
                  width: 1.5,
                ),
              )
            : null,
        counterText: '',
      ),
      maxLength: 2,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(2),
        // Validador personalizado para limitar a 32
        TextInputFormatter.withFunction(
          (oldValue, newValue) {
            if (newValue.text.isEmpty) return newValue;
            final value = int.tryParse(newValue.text) ?? 0;
            if (value > 32) {
              return oldValue;
            }
            return newValue;
          },
        ),
      ],
      style: const TextStyle(
        fontFamily: 'monospace',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      validator: (v) {
        if (v == null || v.length != 2) return 'Requerido';
        final num = int.tryParse(v) ?? 0;
        if (num < 1 || num > 32) return 'Entre 01-32';
        return null;
      },
    );
  }

  Widget _buildNumeroField(AnimalFormController controller, BuildContext context) {
    final bool isValid = controller.numeroController.text.length == 8;
    
    return TextFormField(
      controller: controller.numeroController,
      focusNode: controller.numeroFocus,
      decoration: InputDecoration(
        labelText: 'Número Nacional',
        helperText: isValid
            ? '✓ Completo'
            : '8 dígitos únicos',
        helperStyle: TextStyle(
          color: isValid ? Colors.green : null,
          fontWeight: isValid ? FontWeight.bold : null,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: isValid ? Colors.green : Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isValid ? Colors.green : Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: isValid 
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green.shade300,
                  width: 1.5,
                ),
              )
            : null,
        counterText: '',
      ),
      maxLength: 8,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(8),
      ],
      style: const TextStyle(
        fontFamily: 'monospace',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      validator: (v) => (v == null || v.length != 8) ? 'Requerido' : null,
    );
  }

  Widget _buildEstadoDropdown(BuildContext context, AnimalFormController controller) {
    return NativeDropdown<EstadoMexico>(
      controller: controller.estadoDisplayController,
      focusNode: controller.estadoDropdownFocus,
      labelText: 'Seleccionar Estado',
      prefixIcon: Icons.location_on,
      helperText: 'Toque para seleccionar o escriba el código arriba',
      items: controller.estados,
      displayStringForOption: (estado) => '${estado.clave} - ${estado.nombre}',
      onSelected: (estado) {
        controller.setEstadoSeleccionado(estado);
        // Enfocar en número nacional después de seleccionar
        Future.delayed(const Duration(milliseconds: 100), () {
          controller.numeroFocus.requestFocus();
        });
      },
      readOnly: true,
      initialSelection: controller.estadoSeleccionado,
      itemBuilder: (context, estado) {
        final bool isSelected = controller.estadoSeleccionado?.clave == estado.clave;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : null,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? Theme.of(context).primaryColor 
                      : Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  estado.clave,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                    color: isSelected ? Colors.white : null,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  estado.nombre,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildValidationMessage(AnimalFormController controller, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 10 : 12),
      decoration: BoxDecoration(
        color: controller.sinigaIsValid
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        border: Border.all(
          color: controller.sinigaIsValid ? Colors.green : Colors.red,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            controller.sinigaIsValid ? Icons.check_circle : Icons.error,
            color: controller.sinigaIsValid ? Colors.green : Colors.red,
            size: isMobile ? 20 : 24,
          ),
          SizedBox(width: isMobile ? 6 : 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.sinigaValidationMessage!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 13 : 14,
                    color: controller.sinigaIsValid
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                  ),
                ),
                if (controller.sinigaIsValid && controller.sinigaId != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'ID Completo: ${controller.sinigaId!.formatoVisual}',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
