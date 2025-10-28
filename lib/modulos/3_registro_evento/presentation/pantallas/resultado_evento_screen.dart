import 'package:flutter/material.dart';

class ResultadoEventoScreen extends StatelessWidget {
  final int animalCount;

  const ResultadoEventoScreen({super.key, required this.animalCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text('¡Evento Registrado!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Se registró el evento para $animalCount animales.'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navegar de vuelta a la lista de ganado
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }
}
