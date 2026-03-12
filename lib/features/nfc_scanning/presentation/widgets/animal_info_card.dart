import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';

/// Widget mejorado para mostrar la información del animal escaneado,
/// combinando datos clave, indicadores de estado y acciones.
class AnimalInfoCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback? onVerMas;
  final VoidCallback? onEditarDatos;

  const AnimalInfoCard({
    super.key,
    required this.animal,
    this.onVerMas,
    this.onEditarDatos,
  });

  // Método para determinar el supplier de imagen correcto (Network, File, Asset)
  ImageProvider _getImagenProvider() {
    final photoUrl = animal.profilePhotoUrl;
    if (photoUrl != null && photoUrl.trim().isNotEmpty) {
      // Si la URL empieza con http, es una imagen de red.
      if (photoUrl.trim().startsWith('http')) {
        return NetworkImage(photoUrl.trim());
      }
      // Si no, se asume que es una ruta de archivo local.
      final file = File(photoUrl.trim());
      if (file.existsSync()) {
        return FileImage(file);
      }
    }
    // Si no hay foto o la ruta no es válida, usar la imagen por defecto.
    return const AssetImage('assets/images/default_cow.png');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, colorScheme),
          _buildStatusIndicators(context, theme),
          const Divider(height: 1, indent: 20, endIndent: 20),
          _buildGeneralInfo(context),
          if (onVerMas != null || onEditarDatos != null) ...[
            const Divider(height: 1, indent: 20, endIndent: 20),
            _buildActionButtons(context),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.primary.withAlpha((255 * 0.7).round()),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Hero(
            tag: 'animal_foto_${animal.id}',
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                image: DecorationImage(
                  image: _getImagenProvider(),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    debugPrint('Error al cargar la imagen: $exception');
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            animal.name,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Chip(
            avatar: Icon(Icons.tag, color: colorScheme.primary),
            label: Text(
              animal.displaySiniigaId,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIndicators(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatusBadge(
            context,
            theme,
            'Estado',
            animal.estado.name.toUpperCase(),
            _getEstadoColor(animal.estado),
            Icons.pets,
          ),
          _buildStatusBadge(
            context,
            theme,
            'Salud',
            animal.healthStatus.name.toUpperCase(),
            _getEstadoSaludColor(animal.healthStatus),
            Icons.favorite,
          ),
          if (animal.isPregnant)
            _buildStatusBadge(
              context,
              theme,
              'Gestación',
              '${animal.gestationDays ?? 0} días',
              Colors.purple,
              Icons.child_care,
            ),
        ],
      ),
    );
  }

  Widget _buildGeneralInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(
            context,
            icon: animal.sex == Sexo.macho ? Icons.male : Icons.female,
            label: 'Sexo',
            value: animal.sex.name.replaceFirst(
              animal.sex.name[0],
              animal.sex.name[0].toUpperCase(),
            ),
            iconColor: animal.sex == Sexo.macho ? Colors.blue : Colors.pink,
          ),
          const Divider(height: 24),
          _buildInfoRow(
            context,
            icon: Icons.cake,
            label: 'Edad',
            value: animal.getFormattedAge(),
          ),
          const Divider(height: 24),
          _buildInfoRow(
            context,
            icon: Icons.line_weight,
            label: 'Raza',
            value: animal.breed,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (onEditarDatos != null)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onEditarDatos,
                icon: const Icon(Icons.edit),
                label: const Text('Editar'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          if (onEditarDatos != null && onVerMas != null)
            const SizedBox(width: 12),
          if (onVerMas != null)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onVerMas,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Ver Más'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    Color? iconColor,
  }) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: iconColor ?? theme.colorScheme.primary, size: 28),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            Text(
              value,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusBadge(
    BuildContext context,
    ThemeData theme,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withAlpha((255 * 0.1).round()),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Color _getEstadoColor(EstadoAnimal estado) {
    switch (estado) {
      case EstadoAnimal.activo:
        return Colors.green;
      case EstadoAnimal.vendido:
        return Colors.blue;
      case EstadoAnimal.muerto:
        return Colors.red;
      case EstadoAnimal.perdido:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Color _getEstadoSaludColor(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return Colors.green;
      case EstadoSalud.enfermo:
        return Colors.red;
      case EstadoSalud.enTratamiento:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
