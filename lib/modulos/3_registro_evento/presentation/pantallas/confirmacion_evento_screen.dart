import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sirega_app/modulos/3_registro_evento/aplicacion/registro_evento_service.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/resultado_evento_screen.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class ConfirmacionEventoScreen extends StatefulWidget {
  final TipoEvento tipoEvento;
  final String producto;
  final DateTime fecha;
  final double? dosis;
  final String? unidadDosis;
  final String? veterinario;
  final String? viaAplicacion;
  final DateTime? fechaProximaAplicacion;
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
    this.viaAplicacion,
    this.fechaProximaAplicacion,
    this.notas,
    required this.animalesIds,
  });

  @override
  State<ConfirmacionEventoScreen> createState() => _ConfirmacionEventoScreenState();
}

class _ConfirmacionEventoScreenState extends State<ConfirmacionEventoScreen> {
  bool _isLoading = false;

  Map<String, dynamic> _getEventTypeDetails() {
    switch (widget.tipoEvento) {
      case TipoEvento.vacuna:
        return {'title': 'Vacunación', 'icon': Icons.vaccines, 'color': AppColors.success};
      case TipoEvento.desparasitante:
        return {'title': 'Desparasitación', 'icon': Icons.bug_report, 'color': AppColors.warning};
      case TipoEvento.tratamiento:
        return {'title': 'Tratamiento', 'icon': Icons.medical_services, 'color': AppColors.info};
      case TipoEvento.revisionVeterinaria:
        return {'title': 'Revisión Veterinaria', 'icon': Icons.science, 'color': AppColors.secondary};
      case TipoEvento.castracion:
        return {'title': 'Castración', 'icon': Icons.cut, 'color': AppColors.error};
      default:
        return {'title': 'Evento', 'icon': Icons.event, 'color': AppColors.textHint};
    }
  }

  Future<void> _guardarEvento() async {
    setState(() => _isLoading = true);

    try {
      final service = RegistroEventoService(IsarService.isar);

      await service.registrarEvento(
        tipo: widget.tipoEvento,
        producto: widget.producto,
        fecha: widget.fecha,
        animalesIds: widget.animalesIds,
        dosis: widget.dosis,
        unidadDosis: widget.unidadDosis,
        veterinario: widget.veterinario,
        viaAplicacion: widget.viaAplicacion,
        fechaProximaAplicacion: widget.fechaProximaAplicacion,
        notas: widget.notas,
      );

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) =>
              ResultadoEventoScreen(animalCount: widget.animalesIds.length),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.03, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                )),
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
                  colors: [
                    primaryColor.withValues(alpha: 0.8),
                    primaryColor,
                  ],
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
                    child: Icon(eventDetails['icon'], size: 32, color: AppColors.surface),
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
                    _buildSummaryRow('Producto / Vacuna', widget.producto, Icons.inventory_2_rounded),
                    const Divider(height: 24),
                    _buildSummaryRow('Fecha de Aplicación', DateFormat('dd/MM/yyyy').format(widget.fecha), Icons.calendar_month_rounded),
                    if (widget.dosis != null) ...[
                      const Divider(height: 24),
                      _buildSummaryRow('Dosis por Animal', '${widget.dosis} ${widget.unidadDosis ?? ''}', Icons.vaccines_rounded),
                    ],
                    if (widget.viaAplicacion != null && widget.viaAplicacion!.isNotEmpty) ...[
                      const Divider(height: 24),
                      _buildSummaryRow('Vía de Administración', widget.viaAplicacion!, Icons.vaccines_outlined),
                    ],
                    if (widget.fechaProximaAplicacion != null) ...[
                      const Divider(height: 24),
                      _buildSummaryRow('Próximo Refuerzo', DateFormat('dd/MM/yyyy').format(widget.fechaProximaAplicacion!), Icons.event_repeat_rounded),
                    ],
                    if (widget.veterinario != null && widget.veterinario!.isNotEmpty) ...[
                      const Divider(height: 24),
                      _buildSummaryRow('Médico Veterinario', widget.veterinario!, Icons.badge_rounded),
                    ],
                    if (widget.notas != null && widget.notas!.isNotEmpty) ...[
                      const Divider(height: 24),
                      _buildSummaryRow('Anotaciones', widget.notas!, Icons.notes_rounded, maxLines: 3),
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
                      child: Icon(Icons.pets_rounded, color: primaryColor, size: 32),
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
                          widget.animalesIds.length == 1 ? 'Animal recibirá tratamiento' : 'Animales recibirán tratamiento',
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
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.surface),
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle_outline_rounded, size: 24),
                          SizedBox(width: 8),
                          Text(
                            'Confirmar y Guardar',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

  Widget _buildSummaryRow(String label, String value, IconData icon, {int maxLines = 1}) {
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
