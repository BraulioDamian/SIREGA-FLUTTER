import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/core/extensions/enum_ui_extensions.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animated_info_card.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animal_detail_helpers.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/pantallas/cattle_detail_screen.dart';
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
      children: _buildChildren(context),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    return [
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
              valueColor: animal.sexo.color,
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
              valueColor: animal.estado.color,
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
            if (animal.madre.value != null)
              _buildParentRow(
                context,
                'Madre',
                animal.madre.value!,
                Icons.female,
                Colors.pink,
              ),
            if (animal.padre.value != null)
              _buildParentRow(
                context,
                'Padre',
                animal.padre.value!,
                Icons.male,
                Colors.blue,
              ),
            if (animal.crias.isNotEmpty) ...[
              if (animal.madre.value != null || animal.padre.value != null)
                const Divider(height: 24),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(Icons.child_care, size: 16, color: Colors.brown.shade400),
                    const SizedBox(width: 6),
                    Text(
                      'Crías (${animal.crias.length})',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.brown.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              ..._buildCriasRows(context),
            ],
            if (animal.madre.value == null &&
                animal.padre.value == null &&
                animal.crias.isEmpty)
              AnimalDetailHelpers.buildEmptyState(
                'Sin información genealógica',
              ),
          ],
        ),
      ),
    ];
  }

  static List<Widget> buildChildren(BuildContext context, Animal animal) {
    return GeneralTab(
      animal: animal,
      padding: EdgeInsets.zero,
    )._buildChildren(context);
  }

  Widget _buildParentRow(
    BuildContext context,
    String label,
    Animal parent,
    IconData icon,
    Color color,
  ) {
    final nombre = parent.nombre.isNotEmpty ? parent.nombre : 'Sin nombre';
    final fotoPath = parent.fotoPerfilUrl ?? parent.fotoUrl;
    final hasPhoto = fotoPath != null && fotoPath.isNotEmpty && File(fotoPath).existsSync();

    // Calcular edad
    final now = DateTime.now();
    final diff = now.difference(parent.fechaNacimiento);
    final years = diff.inDays ~/ 365;
    final months = (diff.inDays % 365) ~/ 30;
    final edad = years > 0
        ? '$years año${years > 1 ? 's' : ''}${months > 0 ? ' $months m' : ''}'
        : '$months mes${months != 1 ? 'es' : ''}';

    // Info chips
    final chips = <String>[
      if (parent.raza.isNotEmpty) parent.raza,
      edad,
      if (parent.idAreteVisual != null && parent.idAreteVisual!.isNotEmpty)
        parent.idAreteVisual!,
    ];

    return InkWell(
      onTap: () {
        final isarService = RepositoryProvider.of<IsarService>(context);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => CattleDetailBloc(isarService: isarService)
                ..add(LoadCattleDetail(parent.id)),
              child: CattleDetailScreen(id: parent.id),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            // Foto o ícono
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
                image: hasPhoto
                    ? DecorationImage(
                        image: FileImage(File(fotoPath)),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: !hasPhoto
                  ? Icon(icon, size: 26, color: color)
                  : null,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      color: color.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Nombre
                  Text(
                    nombre,
                    style: TextStyle(
                      fontSize: 16,
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Info chips
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: chips.map((chip) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        chip,
                        style: TextStyle(
                          fontSize: 11,
                          color: color.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )).toList(),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400, size: 22),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCriasRows(BuildContext context) {
    final crias = animal.crias.toList()
      ..sort((a, b) => b.fechaNacimiento.compareTo(a.fechaNacimiento));
    return crias.map((cria) => _buildParentRow(
      context,
      cria.sexo == Sexo.macho ? 'Hijo' : 'Hija',
      cria,
      cria.sexo == Sexo.macho ? Icons.male : Icons.female,
      Colors.brown,
    )).toList();
  }
}

/// Version that returns just a Column (no scroll), for use inside CustomScrollView.
class GeneralTabContent extends StatelessWidget {
  final Animal animal;
  const GeneralTabContent({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Column(children: GeneralTab.buildChildren(context, animal));
  }
}
