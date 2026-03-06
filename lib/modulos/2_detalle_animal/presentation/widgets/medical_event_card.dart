// lib/modulos/2_detalle_animal/presentation/widgets/medical_event_card.dart
import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class MedicalEventCard extends StatelessWidget {
  final EventoSanitario evento;
  final int index;
  final bool isLast;

  const MedicalEventCard({
    super.key,
    required this.evento,
    this.index = 0,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final eventInfo = _getEventInfo(evento.tipo);

    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 400 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(30 * (1 - value), 0),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Stack(
        children: [
                  // Timeline line
          if (!isLast)
            Positioned(
              left: 27,
              top: 65,
              bottom: -10,
              child: Container(
                width: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      eventInfo.color.withValues(alpha: 0.3),
                      eventInfo.color.withValues(alpha: 0.1),
                    ],
                  ),
                ),
              ),
            ),

          // Main card
          Container(
            margin: const EdgeInsets.only(left: 0, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline dot with icon
                Column(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            eventInfo.color,
                            eventInfo.color.withValues(alpha: 0.7),
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: eventInfo.color.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        eventInfo.icon,
                        color: AppColors.surface,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),

                // Card content
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.surface,
                          eventInfo.color.withValues(alpha: 0.03),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textPrimary.withValues(alpha: 0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(
                        color: eventInfo.color.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: () => _showEventDetails(context),
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header row
                              Row(
                                children: [
                                  // Type badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          eventInfo.color.withValues(alpha: 0.2),
                                          eventInfo.color.withValues(alpha: 0.1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: eventInfo.color.withValues(alpha: 0.3),
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      eventInfo.name,
                                      style: TextStyle(
                                        color: eventInfo.color,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  // Date
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          _formatDate(evento.fecha),
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // Product name
                              Text(
                                evento.nombreProducto ?? 'Sin nombre',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                  height: 1.2,
                                ),
                              ),

                              // Dosage info
                              if (evento.dosis != null && evento.unidadDosis != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.medical_information_outlined,
                                        size: 16,
                                        color: AppColors.textSecondary,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Dosis: ${evento.dosis} ${evento.unidadDosis}',
                                        style: const TextStyle(
                                          color: AppColors.textSecondary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              // Veterinarian
                              if (evento.veterinario != null && evento.veterinario!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.person_outline,
                                        size: 16,
                                        color: AppColors.textSecondary,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Dr(a). ${evento.veterinario}',
                                        style: const TextStyle(
                                          color: AppColors.textSecondary,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              // Notes
                              if (evento.notas != null && evento.notas!.isNotEmpty)
                                Container(
                                  margin: const EdgeInsets.only(top: 12),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.divider,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.notes,
                                        size: 16,
                                        color: AppColors.textSecondary,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          evento.notas!,
                                          style: const TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 13,
                                            height: 1.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  EventInfo _getEventInfo(TipoEvento tipo) {
    switch (tipo) {
      case TipoEvento.vacuna:
        return EventInfo(
          name: 'VACUNA',
          icon: Icons.vaccines,
          color: AppColors.info,
        );
      case TipoEvento.desparasitante:
        return EventInfo(
          name: 'DESPARASITANTE',
          icon: Icons.bug_report,
          color: AppColors.success,
        );
      case TipoEvento.tratamiento:
        return EventInfo(
          name: 'TRATAMIENTO',
          icon: Icons.medication,
          color: AppColors.warning,
        );
      case TipoEvento.revisionVeterinaria:
        return EventInfo(
          name: 'REVISIÓN',
          icon: Icons.health_and_safety,
          color: AppColors.secondary,
        );
      case TipoEvento.castracion:
        return EventInfo(
          name: 'CIRUGÍA',
          icon: Icons.healing,
          color: AppColors.error,
        );
      default:
        return EventInfo(
          name: tipo.name.toUpperCase(),
          icon: Icons.medical_services,
          color: AppColors.textHint,
        );
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
      'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'
    ];
    return '${date.day} ${months[date.month - 1]}, ${date.year}';
  }

  void _showEventDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _EventDetailsSheet(evento: evento),
    );
  }
}

class EventInfo {
  final String name;
  final IconData icon;
  final Color color;

  EventInfo({required this.name, required this.icon, required this.color});
}

// Bottom sheet para mostrar detalles completos del evento
class _EventDetailsSheet extends StatelessWidget {
  final EventoSanitario evento;

  const _EventDetailsSheet({required this.evento});

  @override
  Widget build(BuildContext context) {
    final eventInfo = _getEventInfo(evento.tipo);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    eventInfo.color.withValues(alpha: 0.1),
                    eventInfo.color.withValues(alpha: 0.05),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: eventInfo.color,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      eventInfo.icon,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eventInfo.name,
                          style: TextStyle(
                            color: eventInfo.color,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          evento.nombreProducto ?? 'Sin nombre',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Details
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildDetailRow(
                    'Fecha',
                    _formatDate(evento.fecha),
                    Icons.calendar_today,
                  ),
                  if (evento.dosis != null && evento.unidadDosis != null)
                    _buildDetailRow(
                      'Dosis',
                      '${evento.dosis} ${evento.unidadDosis}',
                      Icons.medical_information,
                    ),
                  if (evento.veterinario != null)
                    _buildDetailRow(
                      'Veterinario',
                      'Dr(a). ${evento.veterinario}',
                      Icons.person,
                    ),
                  if (evento.notas != null && evento.notas!.isNotEmpty)
                    _buildDetailRow(
                      'Notas',
                      evento.notas!,
                      Icons.notes,
                      isMultiline: true,
                    ),
                ],
              ),
            ),

            // Close button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: eventInfo.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon,
      {bool isMultiline = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        crossAxisAlignment:
            isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.textSecondary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  EventInfo _getEventInfo(TipoEvento tipo) {
    switch (tipo) {
      case TipoEvento.vacuna:
        return EventInfo(
          name: 'VACUNA',
          icon: Icons.vaccines,
          color: AppColors.info,
        );
      case TipoEvento.desparasitante:
        return EventInfo(
          name: 'DESPARASITANTE',
          icon: Icons.bug_report,
          color: AppColors.success,
        );
      case TipoEvento.tratamiento:
        return EventInfo(
          name: 'TRATAMIENTO',
          icon: Icons.medication,
          color: AppColors.warning,
        );
      case TipoEvento.revisionVeterinaria:
        return EventInfo(
          name: 'REVISIÓN',
          icon: Icons.health_and_safety,
          color: AppColors.secondary,
        );
      case TipoEvento.castracion:
        return EventInfo(
          name: 'CIRUGÍA',
          icon: Icons.healing,
          color: AppColors.error,
        );
      default:
        return EventInfo(
          name: tipo.name.toUpperCase(),
          icon: Icons.medical_services,
          color: AppColors.textHint,
        );
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
    ];
    return '${date.day} de ${months[date.month - 1]}, ${date.year}';
  }
}
