
import 'package:flutter/material.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/datos_evento_screen.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class SeleccionarTipoEventoScreen extends StatelessWidget {
  const SeleccionarTipoEventoScreen({super.key});

  static const _eventTypes = [
    TipoEvento.vacuna,
    TipoEvento.desparasitante,
    TipoEvento.tratamiento,
    TipoEvento.revisionVeterinaria,
    TipoEvento.castracion,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Registrar Evento',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '¿Qué labor sanitaria o evento deseas registrar?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    height: 1.3,
                  ),
            ),
          ),
          const SizedBox(height: 24),
          for (int i = 0; i < _eventTypes.length; i += 2)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildCard(context, _eventTypes[i]),
                  ),
                  const SizedBox(width: 16),
                  if (i + 1 < _eventTypes.length)
                    Expanded(
                      child: _buildCard(context, _eventTypes[i + 1]),
                    )
                  else
                    const Expanded(child: SizedBox()),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, TipoEvento eventType) {
    final d = _eventTypeDetails[eventType]!;
    return _EventTypeCard(
      icon: d.icon,
      title: d.title,
      subtitle: d.subtitle,
      color: d.color,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DatosEventoScreen(tipoEvento: eventType),
        ),
      ),
    );
  }

  static const _eventTypeDetails = <TipoEvento, _EventDetails>{
    TipoEvento.vacuna: _EventDetails(
      Icons.vaccines_rounded, 'Vacunación',
      'Aplicar vacunas y biológicos', AppColors.success,
    ),
    TipoEvento.desparasitante: _EventDetails(
      Icons.bug_report_rounded, 'Desparasitación',
      'Control de parásitos internos/externos', AppColors.warning,
    ),
    TipoEvento.tratamiento: _EventDetails(
      Icons.medical_services_rounded, 'Tratamiento Médico',
      'Antibióticos o medicación general', AppColors.info,
    ),
    TipoEvento.revisionVeterinaria: _EventDetails(
      Icons.health_and_safety_rounded, 'Revisión Veterinaria',
      'Chequeo general o diagnóstico', AppColors.secondary,
    ),
    TipoEvento.castracion: _EventDetails(
      Icons.content_cut_rounded, 'Castración',
      'Procedimiento quirúrgico', AppColors.error,
    ),
  };
}

class _EventDetails {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  const _EventDetails(this.icon, this.title, this.subtitle, this.color);
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
    return AspectRatio(
      aspectRatio: 0.85,
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        elevation: 1,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          splashColor: color.withValues(alpha: 0.12),
          highlightColor: color.withValues(alpha: 0.06),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: color.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(icon, size: 40, color: color),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
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

