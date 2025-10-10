import 'package:flutter/material.dart';

class DatosGanadoCard extends StatelessWidget {
  final String? imageUrl;
  final String? numeroArete;
  final String? raza;
  final String? sexo;

  const DatosGanadoCard({
    super.key,
    this.imageUrl,
    this.numeroArete,
    this.raza,
    this.sexo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
              Center(
                child: Image.network(
                  imageUrl!,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16.0),
            Text(
              'Número de Arete: ${numeroArete ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Raza: ${raza ?? 'N/A'}'),
            const SizedBox(height: 8.0),
            Text('Sexo: ${sexo ?? 'N/A'}'),
          ],
        ),
      ),
    );
  }
}
