import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback onTap;

  const AnimalCard({super.key, required this.animal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  _buildAnimalImage(),
                  const SizedBox(width: 16),
                  _buildAnimalInfo(context),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: _buildStatusChip(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalImage() {
    return Hero(
      tag: 'animal_image_${animal.id}',
      child: CircleAvatar(
        radius: 40,
        backgroundImage: animal.fotoPerfilUrl != null && animal.fotoPerfilUrl!.isNotEmpty
            ? FileImage(File(animal.fotoPerfilUrl!))
            : null,
        child: animal.fotoPerfilUrl == null || animal.fotoPerfilUrl!.isEmpty
            ? const Icon(Icons.pets, size: 40, color: Colors.grey)
            : null,
      ),
    );
  }

  Widget _buildAnimalInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            animal.nombre,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            animal.idAreteNFC ?? 'Sin arete NFC',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(animal.sexo == Sexo.macho ? Icons.male : Icons.female, color: Colors.blue, size: 16),
              const SizedBox(width: 4),
              Text(animal.sexo.name),
              const SizedBox(width: 12),
              const Icon(Icons.cake, color: Colors.orange, size: 16),
              const SizedBox(width: 4),
              Text(animal.getEdadFormateada()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    Color chipColor;
    String statusText;

    switch (animal.estado) {
      case EstadoAnimal.activo:
        chipColor = Colors.green;
        statusText = 'Activo';
        break;
      case EstadoAnimal.vendido:
        chipColor = Colors.blueGrey;
        statusText = 'Vendido';
        break;
      case EstadoAnimal.muerto:
        chipColor = Colors.red;
        statusText = 'Muerto';
        break;
      case EstadoAnimal.enfermo:
        chipColor = Colors.orange;
        statusText = 'Enfermo';
        break;
      case EstadoAnimal.cuarentena:
        chipColor = Colors.purple;
        statusText = 'Cuarentena';
        break;
      case EstadoAnimal.perdido:
        chipColor = Colors.brown;
        statusText = 'Perdido';
        break;
      case EstadoAnimal.prestado:
        chipColor = Colors.indigo;
        statusText = 'Prestado';
        break;
      case EstadoAnimal.enTransito:
        chipColor = Colors.teal;
        statusText = 'En Tránsito';
        break;
    }

    return Chip(
      label: Text(statusText, style: const TextStyle(color: Colors.white, fontSize: 10)),
      backgroundColor: chipColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
    );
  }
}