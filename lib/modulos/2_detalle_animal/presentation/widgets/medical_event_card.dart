// lib/modulos/2_detalle_animal/presentation/widgets/medical_event_card.dart
import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/core/extensions/enum_ui_extensions.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/widgets/animal_detail_helpers.dart';
import 'package:sirega_app/nucleo/modelos/catalogo_vacunas.dart';

class MedicalEventCard extends StatelessWidget {
  final EventoSanitario evento;
  final int index;
  final bool isLast;
  /// When false, hides the type badge (e.g. inside a filtered tab where it's redundant).
  final bool showTypeBadge;

  const MedicalEventCard({
    super.key,
    required this.evento,
    this.index = 0,
    this.isLast = false,
    this.showTypeBadge = true,
  });

  @override
  Widget build(BuildContext context) {
    final tipo = evento.tipo;

    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 60)),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(20 * (1 - value), 0),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Stack(
        children: [
          // Timeline line
          if (!isLast)
            Positioned(
              left: 17,
              top: 40,
              bottom: -4,
              child: Container(
                width: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      tipo.color.withValues(alpha: 0.25),
                      tipo.color.withValues(alpha: 0.05),
                    ],
                  ),
                ),
              ),
            ),

          // Main row
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline dot
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [tipo.color, tipo.color.withValues(alpha: 0.75)],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: tipo.color.withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(tipo.icon, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 12),

                // Card
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.divider),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textPrimary.withValues(alpha: 0.03),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        onTap: () => _showEventDetails(context),
                        borderRadius: BorderRadius.circular(12),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              // Color accent strip
                              Container(
                                width: 4,
                                decoration: BoxDecoration(
                                  color: tipo.color,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                              ),
                              // Content
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Top row: name + date
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              evento.nombreProducto ?? 'Sin nombre',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.textPrimary,
                                                height: 1.2,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            evento.esAplicacionUnica
                                                ? AnimalDetailHelpers.formatDateVerbose(evento.fecha)
                                                : AnimalDetailHelpers.formatDate(evento.fecha),
                                            style: TextStyle(
                                              color: AppColors.textHint,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 6),

                                      // Info chips row
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 4,
                                        children: [
                                          // Type badge (conditional)
                                          if (showTypeBadge)
                                            _infoPill(
                                              tipo.eventName,
                                              tipo.color,
                                              filled: true,
                                            ),

                                          // Dosis
                                          if (evento.dosis != null && evento.unidadDosis != null)
                                            _infoPill(
                                              '${evento.dosis} ${evento.unidadDosis}',
                                              AppColors.textSecondary,
                                            ),

                                          // Vía de administración
                                          if (evento.viaAplicacion != null && evento.viaAplicacion!.isNotEmpty)
                                            _infoPill(
                                              evento.viaAplicacion!,
                                              AppColors.textSecondary,
                                              icon: Icons.vaccines_outlined,
                                            ),

                                          // Veterinario
                                          if (evento.veterinario != null && evento.veterinario!.isNotEmpty)
                                            _infoPill(
                                              'Dr(a). ${evento.veterinario}',
                                              AppColors.textSecondary,
                                              icon: Icons.person_outline,
                                            ),
                                        ],
                                      ),

                                      // Notes preview
                                      if (evento.notas != null && evento.notas!.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6),
                                          child: Text(
                                            evento.notas!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: AppColors.textHint,
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              // Chevron
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  size: 20,
                                  color: AppColors.textHint.withValues(alpha: 0.5),
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

  Widget _infoPill(String text, Color color, {bool filled = false, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: filled ? color.withValues(alpha: 0.12) : AppColors.background,
        borderRadius: BorderRadius.circular(6),
        border: filled
            ? Border.all(color: color.withValues(alpha: 0.25))
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: filled ? color : AppColors.textHint),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: filled ? FontWeight.w700 : FontWeight.w500,
              color: filled ? color : AppColors.textSecondary,
              letterSpacing: filled ? 0.3 : 0,
            ),
          ),
        ],
      ),
    );
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

// Bottom sheet para mostrar detalles completos del evento
class _EventDetailsSheet extends StatelessWidget {
  final EventoSanitario evento;

  const _EventDetailsSheet({required this.evento});

  @override
  Widget build(BuildContext context) {
    final tipo = evento.tipo;

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
                    tipo.color.withValues(alpha: 0.1),
                    tipo.color.withValues(alpha: 0.05),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: tipo.color,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      tipo.icon,
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
                          tipo.eventName,
                          style: TextStyle(
                            color: tipo.color,
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

            // Vaccine info from catalog
            if (evento.tipo == TipoEvento.vacuna) _buildVacunaInfoSection(),

            // Details
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildDetailRow(
                    'Fecha',
                    AnimalDetailHelpers.formatDateVerbose(evento.fecha),
                    Icons.calendar_today,
                  ),
                  if (evento.dosis != null && evento.unidadDosis != null)
                    _buildDetailRow(
                      'Dosis',
                      '${evento.dosis} ${evento.unidadDosis}',
                      Icons.medical_information,
                    ),
                  if (evento.viaAplicacion != null && evento.viaAplicacion!.isNotEmpty)
                    _buildDetailRow(
                      'Vía de administración',
                      evento.viaAplicacion!,
                      Icons.vaccines_outlined,
                    ),
                  if (evento.veterinario != null && evento.veterinario!.isNotEmpty)
                    _buildDetailRow(
                      'Veterinario',
                      'Dr(a). ${evento.veterinario}',
                      Icons.person,
                    ),
                  if (evento.fechaProximaAplicacion != null)
                    _buildDetailRow(
                      'Próxima aplicación',
                      AnimalDetailHelpers.formatDateVerbose(evento.fechaProximaAplicacion!),
                      Icons.event_repeat_rounded,
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
                    backgroundColor: tipo.color,
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

  Widget _buildVacunaInfoSection() {
    final info = CatalogoVacunas.buscarPorNombre(evento.nombreProducto ?? '');
    if (info == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, size: 16, color: Colors.blue.shade700),
              const SizedBox(width: 6),
              Text(
                'Información de la vacuna',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            info.descripcion,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade800,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              if (info.esCampanaObligatoria)
                _infoChip(
                  'Campaña obligatoria',
                  Icons.gavel_rounded,
                  Colors.red,
                ),
              _infoChip(
                info.esAplicacionUnica ? 'Única aplicación' : 'Refuerzo periódico',
                info.esAplicacionUnica ? Icons.check_circle_outline : Icons.event_repeat_rounded,
                info.esAplicacionUnica ? Colors.green : Colors.orange,
              ),
              if (!info.esAplicacionUnica)
                _infoChip(
                  info.intervaloTexto,
                  Icons.timer_outlined,
                  Colors.orange,
                ),
              if (info.edadRecomendada != null)
                _infoChip(
                  info.edadRecomendada!,
                  Icons.cake_outlined,
                  Colors.purple,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
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

}
