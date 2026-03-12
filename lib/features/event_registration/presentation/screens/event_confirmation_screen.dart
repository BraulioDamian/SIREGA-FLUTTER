import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sirega_app/features/event_registration/application/event_registration_service.dart';
import 'package:sirega_app/features/event_registration/presentation/screens/event_result_screen.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/services/isar_service.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class EventConfirmationScreen extends StatefulWidget {
  final TipoEvento type;
  final String productName;
  final DateTime date;
  final double? dose;
  final String? doseUnit;
  final String? veterinarian;
  final String? applicationRoute;
  final DateTime? nextApplicationDate;
  final String? notes;
  final List<int> animalesIds;

  const EventConfirmationScreen({
    super.key,
    required this.type,
    required this.productName,
    required this.date,
    this.dose,
    this.doseUnit,
    this.veterinarian,
    this.applicationRoute,
    this.nextApplicationDate,
    this.notes,
    required this.animalesIds,
  });

  @override
  State<EventConfirmationScreen> createState() =>
      _ConfirmacionEventoScreenState();
}

class _ConfirmacionEventoScreenState extends State<EventConfirmationScreen> {
  bool _isLoading = false;

  Map<String, dynamic> _getEventTypeDetails() {
    switch (widget.type) {
      case TipoEvento.vacuna:
        return {
          'title': 'Vacunación',
          'icon': Icons.vaccines,
          'color': AppColors.success,
        };
      case TipoEvento.desparasitante:
        return {
          'title': 'Desparasitación',
          'icon': Icons.bug_report,
          'color': AppColors.warning,
        };
      case TipoEvento.tratamiento:
        return {
          'title': 'Tratamiento',
          'icon': Icons.medical_services,
          'color': AppColors.info,
        };
      case TipoEvento.revisionVeterinaria:
        return {
          'title': 'Revisión Veterinaria',
          'icon': Icons.science,
          'color': AppColors.secondary,
        };
      case TipoEvento.castracion:
        return {
          'title': 'Castración',
          'icon': Icons.cut,
          'color': AppColors.error,
        };
      default:
        return {
          'title': 'Evento',
          'icon': Icons.event,
          'color': AppColors.textHint,
        };
    }
  }

  Future<void> _guardarEvento() async {
    setState(() => _isLoading = true);

    try {
      final service = EventRegistrationService(IsarService.isar);

      await service.registrarEvento(
        tipo: widget.type,
        producto: widget.productName,
        date: widget.date,
        animalesIds: widget.animalesIds,
        dose: widget.dose,
        doseUnit: widget.doseUnit,
        veterinarian: widget.veterinarian,
        applicationRoute: widget.applicationRoute,
        nextApplicationDate: widget.nextApplicationDate,
        notes: widget.notes,
      );

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) =>
              EventResultScreen(animalCount: widget.animalesIds.length),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
              child: SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(0.03, 0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                child: child,
              ),
            );
          },
        ),
        (route) => route.isFirst,
      );
    } catch (e) {
      if (!mounted) return;

      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar el evento: ${e.toString()}'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventDetails = _getEventTypeDetails();
    final primaryColor = eventDetails['color'] as Color;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Confirmar Registro'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [primaryColor.withValues(alpha: 0.8), primaryColor],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      eventDetails['icon'],
                      size: 32,
                      color: AppColors.surface,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resumen del Evento',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.surface.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          eventDetails['title'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.surface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Datos del Evento
            const Text(
              'Información General',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.divider),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildSummaryRow(
                      'Producto / Vacuna',
                      widget.productName,
                      Icons.inventory_2_rounded,
                    ),
                    const Divider(height: 24),
                    _buildSummaryRow(
                      'Fecha de Aplicación',
                      DateFormat('dd/MM/yyyy').format(widget.date),
                      Icons.calendar_month_rounded,
                    ),
                    if (widget.dose != null) ...[
                      const Divider(height: 24),
                      _buildSummaryRow(
                        'Dosis por Animal',
                        '${widget.dose} ${widget.doseUnit ?? ''}',
                        Icons.vaccines_rounded,
                      ),
                    ],
                    if (widget.applicationRoute != null &&
                        widget.applicationRoute!.isNotEmpty) ...[
                      const Divider(height: 24),
                      _buildSummaryRow(
                        'Vía de Administración',
                        widget.applicationRoute!,
                        Icons.vaccines_outlined,
                      ),
                    ],
                    if (widget.nextApplicationDate != null) ...[
                      const Divider(height: 24),
                      _buildSummaryRow(
                        'Próximo Refuerzo',
                        DateFormat(
                          'dd/MM/yyyy',
                        ).format(widget.nextApplicationDate!),
                        Icons.event_repeat_rounded,
                      ),
                    ],
                    if (widget.veterinarian != null &&
                        widget.veterinarian!.isNotEmpty) ...[
                      const Divider(height: 24),
                      _buildSummaryRow(
                        'Médico Veterinario',
                        widget.veterinarian!,
                        Icons.badge_rounded,
                      ),
                    ],
                    if (widget.notes != null && widget.notes!.isNotEmpty) ...[
                      const Divider(height: 24),
                      _buildSummaryRow(
                        'Anotaciones',
                        widget.notes!,
                        Icons.notes_rounded,
                        maxLines: 3,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Animales Seleccionados
            const Text(
              'Ganado Seleccionado',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primaryColor.withValues(alpha: 0.3)),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primaryColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.pets_rounded,
                        color: primaryColor,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.animalesIds.length}',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.animalesIds.length == 1
                              ? 'Animal recibirá tratamiento'
                              : 'Animales recibirán tratamiento',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Botón de Guardar
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _guardarEvento,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: AppColors.surface,
                  disabledBackgroundColor: AppColors.divider,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.surface,
                          ),
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_outline_rounded, size: 24),
                          SizedBox(width: 8),
                          Text(
                            'Confirmar y Guardar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value,
    IconData icon, {
    int maxLines = 1,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.textPrimary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20, color: AppColors.textSecondary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
