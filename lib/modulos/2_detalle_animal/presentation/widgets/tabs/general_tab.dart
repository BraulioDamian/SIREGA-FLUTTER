import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animated_info_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animal_detail_helpers.dart';
import 'package:sirega_app/core/widgets/ear_tag_icon.dart';

class GeneralTab extends StatelessWidget {
  final Animal animal;
  final EdgeInsets padding;

  const GeneralTab({super.key, required this.animal, required this.padding});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      physics: const BouncingScrollPhysics(),
      children: [
        AnimatedInfoCard(
          title: 'Información Básica',
          icon: Icons.info_rounded,
          color: Colors.blue,
          delay: 0,
          child: Column(
            children: [
              AnimalDetailHelpers.buildDetailRow(
                context,
                'No. de Arete',
                animal.idSinigaParaMostrar.isNotEmpty
                    ? animal.idSinigaParaMostrar
                    : '#${animal.id}',
                Icons.label_outlined, // Fallback
                customIcon: EarTagIcon(
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
              ),
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Nombre',
                animal.nombre,
                Icons.pets,
              ),
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Raza',
                animal.raza,
                Icons.category,
              ),
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Sexo',
                animal.sexo.name.toUpperCase(),
                animal.sexo.name == 'macho' ? Icons.male : Icons.female,
                valueColor: animal.sexo.name == 'macho'
                    ? Colors.blue
                    : Colors.pink,
              ),
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Fecha de Nacimiento',
                AnimalDetailHelpers.formatDate(animal.fechaNacimiento),
                Icons.cake,
              ),
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Edad',
                animal.getEdadFormateada(),
                Icons.calendar_today,
                valueColor: Colors.orange,
              ),
              AnimalDetailHelpers.buildDetailRow(
                context,
                'Estado',
                animal.estado.name.toUpperCase(),
                Icons.check_circle,
                valueColor: AnimalDetailHelpers.getStatusColor(
                  animal.estado.name,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Identificación Digital',
          icon: Icons.qr_code_scanner,
          color: Colors.purple,
          delay: 100,
          child: Column(
            children: [
              if (animal.idAreteVisual != null)
                AnimalDetailHelpers.buildDetailRow(
                  context,
                  'Número de Arete Visual',
                  animal.idAreteVisual!,
                  Icons.numbers,
                ),
              if (animal.idAreteNFC != null)
                AnimalDetailHelpers.buildDetailRow(
                  context,
                  'Código RFID',
                  animal.idAreteNFC!,
                  Icons.nfc,
                ),
              if (animal.idAreteVisual == null && animal.idAreteNFC == null)
                AnimalDetailHelpers.buildEmptyState(
                  'Sin identificación digital registrada',
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInfoCard(
          title: 'Genealogía',
          icon: Icons.family_restroom,
          color: Colors.green,
          delay: 200,
          child: Column(
            children: [
              if (animal.madre.value?.id != null)
                AnimalDetailHelpers.buildDetailRow(
                  context,
                  'Madre',
                  'ID: ${animal.madre.value?.id}',
                  Icons.female,
                  valueColor: Colors.pink,
                ),
              if (animal.padre.value?.id != null)
                AnimalDetailHelpers.buildDetailRow(
                  context,
                  'Padre',
                  'ID: ${animal.padre.value?.id}',
                  Icons.male,
                  valueColor: Colors.blue,
                ),
              if (animal.madre.value?.id == null &&
                  animal.padre.value?.id == null)
                AnimalDetailHelpers.buildEmptyState(
                  'Sin información genealógica',
                ),
            ],
          ),
        ),
      ],
    );
  }
}
