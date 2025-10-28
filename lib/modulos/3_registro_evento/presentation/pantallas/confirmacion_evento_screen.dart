import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sirega_app/modulos/3_registro_evento/aplicacion/registro_evento_service.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/resultado_evento_screen.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

class ConfirmacionEventoScreen extends StatelessWidget {
  final TipoEvento tipoEvento;
  final String producto;
  final DateTime fecha;
  final double? dosis;
  final String? unidadDosis;
  final String? veterinario;
  final String? notas;
  final List<int> animalesIds;

  const ConfirmacionEventoScreen({
    super.key,
    required this.tipoEvento,
    required this.producto,
    required this.fecha,
    this.dosis,
    this.unidadDosis,
    this.veterinario,
    this.notas,
    required this.animalesIds,
  });

  @override
  Widget build(BuildContext context) {
    final service = RegistroEventoService(IsarService.isar);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumen del Evento', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildSummaryRow('Tipo:', tipoEvento.name),
                    _buildSummaryRow('Producto:', producto),
                    _buildSummaryRow('Fecha:', DateFormat('dd/MM/yyyy').format(fecha)),
                    if (dosis != null) _buildSummaryRow('Dosis:', '$dosis ${unidadDosis ?? ''}'),
                    if (veterinario != null && veterinario!.isNotEmpty) _buildSummaryRow('Veterinario:', veterinario!),
                    if (notas != null && notas!.isNotEmpty) _buildSummaryRow('Notas:', notas!),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Animales Seleccionados (${animalesIds.length}):', style: Theme.of(context).textTheme.titleMedium),
            // Aquí se podría mostrar una lista de los animales, pero por ahora solo la cantidad.
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await service.registrarEvento(
                    tipo: tipoEvento,
                    producto: producto,
                    fecha: fecha,
                    animalesIds: animalesIds,
                    dosis: dosis,
                    unidadDosis: unidadDosis,
                    veterinario: veterinario,
                    notas: notas,
                  );

                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResultadoEventoScreen(animalCount: animalesIds.length),
                      ),
                      (route) => route.isFirst,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Guardar ✓'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: const TextStyle(fontWeight: FontWeight.bold)), Text(value)],
      ),
    );
  }
}
