
import 'package:flutter/material.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/datos_evento_screen.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

class SeleccionarTipoEventoScreen extends StatelessWidget {
  const SeleccionarTipoEventoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventTypes = [
      TipoEvento.vacuna,
      TipoEvento.desparasitante,
      TipoEvento.tratamiento,
      TipoEvento.revisionVeterinaria,
      TipoEvento.castracion,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Evento'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: eventTypes.length,
        itemBuilder: (context, index) {
          final eventType = eventTypes[index];
          final details = _getEventTypeDetails(eventType);

          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(details['icon'], size: 40, color: details['color']),
              title: Text(details['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(details['subtitle']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DatosEventoScreen(tipoEvento: eventType),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Map<String, dynamic> _getEventTypeDetails(TipoEvento eventType) {
    switch (eventType) {
      case TipoEvento.vacuna:
        return {
          'icon': Icons.vaccines,
          'title': 'Vacunación',
          'subtitle': 'Aplicar vacunas al ganado',
          'color': Colors.green,
        };
      case TipoEvento.desparasitante:
        return {
          'icon': Icons.bug_report,
          'title': 'Desparasitación',
          'subtitle': 'Aplicar desparasitante',
          'color': Colors.orange,
        };
      case TipoEvento.tratamiento:
        return {
          'icon': Icons.medical_services,
          'title': 'Tratamiento Médico',
          'subtitle': 'Medicamentos y antibióticos',
          'color': Colors.blue,
        };
      case TipoEvento.revisionVeterinaria:
        return {
          'icon': Icons.science,
          'title': 'Revisión Veterinaria',
          'subtitle': 'Chequeo general o diagnóstico',
          'color': Colors.teal,
        };
      case TipoEvento.castracion:
        return {
          'icon': Icons.cut,
          'title': 'Castración',
          'subtitle': 'Procedimiento quirúrgico',
          'color': Colors.purple,
        };
      default:
        return {
          'icon': Icons.help_outline,
          'title': 'Otro',
          'subtitle': 'Evento no especificado',
          'color': Colors.grey,
        };
    }
  }
}
