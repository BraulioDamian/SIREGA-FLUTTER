import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/core/extensions/enum_ui_extensions.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback onTap;

  const AnimalCard({super.key, required this.animal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              _buildAnimalImage(context),
              const SizedBox(width: 14),
              Expanded(child: _buildAnimalInfo(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalImage(BuildContext context) {
    final hasImage =
        animal.profilePhotoUrl != null && animal.profilePhotoUrl!.isNotEmpty;

    return Container(
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        image: hasImage
            ? DecorationImage(
                image: FileImage(File(animal.profilePhotoUrl!)),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: !hasImage
          ? Center(
              child: Icon(
                Icons.pets_rounded,
                size: 32,
                color: AppColors.textHint,
              ),
            )
          : null,
    );
  }

  Widget _buildAnimalInfo(BuildContext context) {
    final edad = _calcularEdad();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Fila superior: Nombre + Estado
        Row(
          children: [
            Expanded(
              child: Text(
                animal.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            _buildStatusChip(),
          ],
        ),
        const SizedBox(height: 4),

        // Identificador (SINIIGA > Arete > Herrado)
        Text(
          _getIdentificador(),
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),

        // Chips de info
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: [
            _buildInfoChip(
              icon: animal.sex.icon,
              label: animal.sex.displayName,
              color: animal.sex.color,
            ),
            _buildInfoChip(
              icon: Icons.pets_rounded,
              label: animal.breed,
              color: AppColors.secondary,
            ),
            if (edad.isNotEmpty)
              _buildInfoChip(
                icon: Icons.cake_outlined,
                label: edad,
                color: AppColors.info,
              ),
          ],
        ),

        // Estado de salud (solo si no es sano)
        if (animal.healthStatus != EstadoSalud.sano) ...[
          const SizedBox(height: 8),
          _buildHealthBadge(),
        ],
      ],
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthBadge() {
    final salud = animal.healthStatus;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: salud.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: salud.color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(salud.icon, size: 13, color: salud.color),
          const SizedBox(width: 4),
          Text(
            salud.displayName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: salud.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip() {
    final estado = animal.estado;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: estado.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(estado.icon, size: 12, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            estado.displayName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _getIdentificador() {
    // Prioridad: Arete visual > SINIIGA (formateado) > Herrado
    if (animal.visualTagId != null && animal.visualTagId!.isNotEmpty) {
      return 'No. de Arete: ${animal.visualTagId}';
    }
    final siniiga = animal.siniigaId;
    if (siniiga != null && siniiga.fullId.isNotEmpty) {
      final id = siniiga;
      return 'No. de Arete: ${id.especie ?? ''}-${id.estadoClave ?? ''}-${id.numeroNacional ?? ''}';
    }
    if (animal.brandNumber != null && animal.brandNumber!.isNotEmpty) {
      return 'Herrado: ${animal.brandNumber}';
    }
    return 'Sin identificador';
  }

  String _calcularEdad() {
    try {
      final ahora = DateTime.now();
      final diferencia = ahora.difference(animal.birthDate);
      final meses = (diferencia.inDays / 30).floor();
      final anos = (meses / 12).floor();

      if (anos > 0) {
        final mesesRestantes = meses % 12;
        if (mesesRestantes > 0) {
          return '$anos a ${mesesRestantes}m';
        }
        return '$anos año${anos > 1 ? 's' : ''}';
      } else if (meses > 0) {
        return '$meses mes${meses > 1 ? 'es' : ''}';
      } else {
        final dias = diferencia.inDays;
        return '$dias día${dias > 1 ? 's' : ''}';
      }
    } catch (e) {
      return '';
    }
  }
}
