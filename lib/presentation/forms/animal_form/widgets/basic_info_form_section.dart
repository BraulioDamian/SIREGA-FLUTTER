import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';
import '../../../widgets/native_dropdown/native_dropdown.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/core/widgets/sirega_text_field.dart';
import 'package:sirega_app/core/widgets/sirega_card.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class BasicInfoFormSection extends StatelessWidget {
  const BasicInfoFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalFormController>(
      builder: (context, controller, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;
            
            return SiregaCard(
              padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context, isMobile),
                    SizedBox(height: isMobile ? 12 : 16),
                    _buildFormFields(context, controller, isMobile),
                  ],
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
          _buildNombreField(context, controller),
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
                _buildNombreField(context, controller),
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

  Widget _buildNombreField(BuildContext context, AnimalFormController controller) {
    return SiregaTextField(
      controller: controller.nombreController,
      label: 'Nombre del Animal',
      hint: 'Nombre único identificativo',
      helperText: 'Nombre único identificativo',
      prefixIcon: const Icon(Icons.pets),
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
      controller: controller.razaDisplayController,
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
                      color: AppColors.info.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      raza.tipo,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.info,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    raza.origen,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
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
      controller: controller.sexoDisplayController,
      focusNode: controller.sexoFocus,
      labelText: 'Sexo',
      prefixIcon: Icons.pets,
      items: sexoOptions,
      displayStringForOption: _getSexoDisplayName,
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
                color: sexo == Sexo.macho ? AppColors.info :
                       sexo == Sexo.hembra ? AppColors.error : AppColors.textHint,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                _getSexoDisplayName(sexo),
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
    return SiregaTextField(
      controller: controller.fechaController,
      label: 'Fecha de Nacimiento',
      helperText: 'Toque para seleccionar',
      prefixIcon: const Icon(Icons.calendar_today),
      suffixIcon: const Icon(Icons.arrow_drop_down),
      readOnly: true,
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
      validator: (value) {
        if (controller.fechaNacimiento == null) {
          return 'La fecha es requerida';
        }
        return null;
      },
    );
  }

  String _getSexoDisplayName(Sexo sexo) {
    switch (sexo) {
      case Sexo.macho:
        return 'Macho';
      case Sexo.hembra:
        return 'Hembra';
      case Sexo.castrado:
        return 'Castrado';
    }
  }
}
