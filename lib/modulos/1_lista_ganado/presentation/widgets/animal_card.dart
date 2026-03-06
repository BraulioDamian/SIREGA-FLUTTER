import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback onTap;

  const AnimalCard({super.key, required this.animal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surface,
                ],
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      _buildAnimalImage(context),
                      const SizedBox(width: 16),
                      Expanded(child: _buildAnimalInfo(context)),
                    ],
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: _buildStatusChip(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 45,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        backgroundImage: animal.fotoPerfilUrl != null && animal.fotoPerfilUrl!.isNotEmpty
            ? FileImage(File(animal.fotoPerfilUrl!))
            : null,
        child: animal.fotoPerfilUrl == null || animal.fotoPerfilUrl!.isEmpty
            ? Icon(
                Icons.pets,
                size: 45,
                color: Theme.of(context).colorScheme.outline,
              )
            : null,
      ),
    );
  }

  Widget _buildAnimalInfo(BuildContext context) {
    final edad = _calcularEdad();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nombre del animal
        Text(
          animal.nombre,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        
        // ID/Arete
        Row(
          children: [
            Icon(
              Icons.tag,
              size: 14,
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                _getIdentificador(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        
        // Información adicional
        Wrap(
          spacing: 12,
          runSpacing: 6,
          children: [
            // Sexo
            _buildInfoChip(
              icon: animal.sexo == Sexo.macho ? Icons.male : Icons.female,
              label: animal.sexo == Sexo.macho ? 'Macho' : 'Hembra',
              color: animal.sexo == Sexo.macho ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
            ),
            
            // Raza
            _buildInfoChip(
              icon: Icons.pets,
              label: animal.raza,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            
            // Edad
            if (edad.isNotEmpty)
              _buildInfoChip(
                icon: Icons.cake,
                label: edad,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
          ],
        ),
        
        const SizedBox(height: 8),
        
        // Estado de salud
        if (animal.estadoSalud != EstadoSalud.sano)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _getHealthColor(animal.estadoSalud).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _getHealthColor(animal.estadoSalud).withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getHealthIcon(animal.estadoSalud),
                  size: 14,
                  color: _getHealthColor(animal.estadoSalud),
                ),
                const SizedBox(width: 6),
                Text(
                  _getEstadoSaludText(animal.estadoSalud),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _getHealthColor(animal.estadoSalud),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
  
  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
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
  
  String _getIdentificador() {
    if (animal.idAreteNFC != null && animal.idAreteNFC!.isNotEmpty) {
      return 'NFC: ${animal.idAreteNFC}';
    }
    if (animal.idAreteVisual != null && animal.idAreteVisual!.isNotEmpty) {
      return 'Arete: ${animal.idAreteVisual}';
    }
    if (animal.numeroHerrado != null && animal.numeroHerrado!.isNotEmpty) {
      return 'Herrado: ${animal.numeroHerrado}';
    }
    return 'Sin identificador';
  }
  
  String _calcularEdad() {
    try {
      final ahora = DateTime.now();
      final diferencia = ahora.difference(animal.fechaNacimiento);
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
  
  String _getEstadoSaludText(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return 'Sano';
      case EstadoSalud.enfermo:
        return 'Enfermo';
      case EstadoSalud.critico:
        return 'Crítico';
      case EstadoSalud.convaleciente:
        return 'Convaleciente';
      case EstadoSalud.enTratamiento:
        return 'En tratamiento';
      case EstadoSalud.enObservacion:
        return 'En observación';
    }
  }
  
  Color _getHealthColor(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return AppColors.success;
      case EstadoSalud.enfermo:
        return AppColors.warning;
      case EstadoSalud.critico:
        return AppColors.error;
      case EstadoSalud.convaleciente:
        return AppColors.info;
      case EstadoSalud.enTratamiento:
        return AppColors.secondary;
      case EstadoSalud.enObservacion:
        return AppColors.textHint;
    }
  }
  
  IconData _getHealthIcon(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return Icons.check_circle;
      case EstadoSalud.enfermo:
        return Icons.sick;
      case EstadoSalud.critico:
        return Icons.warning;
      case EstadoSalud.convaleciente:
        return Icons.health_and_safety;
      case EstadoSalud.enTratamiento:
        return Icons.medical_services;
      case EstadoSalud.enObservacion:
        return Icons.visibility;
    }
  }

  Widget _buildStatusChip(BuildContext context) {
    final statusInfo = _getStatusInfo(animal.estado);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: statusInfo['color'] as Color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: (statusInfo['color'] as Color).withValues(alpha: 0.4),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            statusInfo['icon'] as IconData,
            size: 14,
            color: Colors.white,
          ),
          const SizedBox(width: 6),
          Text(
            statusInfo['text'] as String,
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

  Map<String, dynamic> _getStatusInfo(EstadoAnimal estado) {
    switch (estado) {
      case EstadoAnimal.activo:
        return {
          'color': AppColors.success,
          'text': 'Activo',
          'icon': Icons.check_circle,
        };
      case EstadoAnimal.vendido:
        return {
          'color': AppColors.textSecondary,
          'text': 'Vendido',
          'icon': Icons.shopping_cart,
        };
      case EstadoAnimal.muerto:
        return {
          'color': AppColors.error,
          'text': 'Muerto',
          'icon': Icons.dangerous,
        };
      case EstadoAnimal.enfermo:
        return {
          'color': AppColors.warning,
          'text': 'Enfermo',
          'icon': Icons.sick,
        };
      case EstadoAnimal.cuarentena:
        return {
          'color': AppColors.primaryLight,
          'text': 'Cuarentena',
          'icon': Icons.lock,
        };
      case EstadoAnimal.perdido:
        return {
          'color': AppColors.accent,
          'text': 'Perdido',
          'icon': Icons.search_off,
        };
      case EstadoAnimal.prestado:
        return {
          'color': AppColors.info,
          'text': 'Prestado',
          'icon': Icons.handshake,
        };
      case EstadoAnimal.enTransito:
        return {
          'color': AppColors.secondary,
          'text': 'En Tránsito',
          'icon': Icons.local_shipping,
        };
    }
  }
}