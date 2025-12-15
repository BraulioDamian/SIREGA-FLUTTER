
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Registrar Evento'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¿Qué tipo de evento deseas registrar?',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Selecciona una opción para continuar',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: eventTypes.length,
                itemBuilder: (context, index) {
                  final eventType = eventTypes[index];
                  final details = _getEventTypeDetails(eventType);

                  return _EventTypeCard(
                    icon: details['icon'],
                    title: details['title'],
                    subtitle: details['subtitle'],
                    color: details['color'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DatosEventoScreen(tipoEvento: eventType),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
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

class _EventTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _EventTypeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: color.withAlpha(50),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: color.withAlpha(100),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    boxShadow: [
                      BoxShadow(
                        color: color.withAlpha(80),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
