import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';
import '../../../widgets/native_dropdown/native_dropdown.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

class BasicInfoFormSection extends StatelessWidget {
  const BasicInfoFormSection({super.key});

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
                    SizedBox(height: isMobile ? 12 : 16),
                    _buildFormFields(context, controller, isMobile),
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
            'Información Básica',
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

  Widget _buildFormFields(BuildContext context, AnimalFormController controller, bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _buildNombreField(controller),
          const SizedBox(height: 16),
          _buildRazaDropdown(context, controller),
          const SizedBox(height: 16),
          _buildSexoDropdown(context, controller),
          const SizedBox(height: 16),
          _buildFechaField(context, controller),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                _buildNombreField(controller),
                const SizedBox(height: 16),
                _buildSexoDropdown(context, controller),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                _buildRazaDropdown(context, controller),
                const SizedBox(height: 16),
                _buildFechaField(context, controller),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildNombreField(AnimalFormController controller) {
    return TextFormField(
      controller: controller.nombreController,
      focusNode: controller.nombreFocus,
      decoration: const InputDecoration(
        labelText: 'Nombre del Animal',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.pets),
        helperText: 'Nombre único identificativo',
      ),
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El nombre es requerido';
        }
        if (value.length < 2) {
          return 'El nombre debe tener al menos 2 caracteres';
        }
        return null;
      },
    );
  }

  Widget _buildRazaDropdown(BuildContext context, AnimalFormController controller) {
    return NativeSearchableDropdown<RazaBovina>(
      controller: controller.razaDisplayController, // Usar controller del provider
      focusNode: controller.razaFocus,
      labelText: 'Raza',
      prefixIcon: Icons.category,
      helperText: 'Busque y seleccione',
      items: controller.razas,
      displayStringForOption: (raza) => raza.nombre,
      onSelected: (raza) {
        controller.setRaza(raza);
      },
      itemBuilder: (context, raza) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                raza.nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(26),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      raza.tipo,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    raza.origen,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSexoDropdown(BuildContext context, AnimalFormController controller) {
    final sexoOptions = Sexo.values;

    return NativeDropdown<Sexo>(
      controller: controller.sexoDisplayController, // Usar controller del provider
      focusNode: controller.sexoFocus,
      labelText: 'Sexo',
      prefixIcon: Icons.pets,
      items: sexoOptions,
      displayStringForOption: (sexo) => controller.sexoDisplayController.text,
      onSelected: (sexo) {
        controller.setSexo(sexo);
      },
      readOnly: true,
      initialSelection: controller.sexo,
      itemBuilder: (context, sexo) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(
                sexo == Sexo.macho ? Icons.male :
                sexo == Sexo.hembra ? Icons.female : Icons.content_cut,
                color: sexo == Sexo.macho ? Colors.blue :
                       sexo == Sexo.hembra ? Colors.pink : Colors.grey,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                controller.sexoDisplayController.text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFechaField(BuildContext context, AnimalFormController controller) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: controller.fechaNacimiento ?? 
                      DateTime.now().subtract(const Duration(days: 30)),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          locale: const Locale('es', 'ES'),
        );
        
        if (picked != null) {
          controller.setFechaNacimiento(picked);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller.fechaController,
          decoration: const InputDecoration(
            labelText: 'Fecha de Nacimiento',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.calendar_today),
            suffixIcon: Icon(Icons.arrow_drop_down),
            helperText: 'Toque para seleccionar',
          ),
          validator: (value) {
            if (controller.fechaNacimiento == null) {
              return 'La fecha es requerida';
            }
            return null;
          },
        ),
      ),
    );
  }
}