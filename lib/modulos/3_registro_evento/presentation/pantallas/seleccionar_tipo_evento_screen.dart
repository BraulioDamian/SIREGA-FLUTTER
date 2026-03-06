
import 'package:flutter/material.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/datos_evento_screen.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

                  return TweenAnimationBuilder<double>(
                    duration: Duration(milliseconds: 300 + (index * 80)),
                    curve: Curves.easeOutCubic,
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 30 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: child,
                        ),
                      );
                    },
                    child: _EventTypeCard(
                      icon: details['icon'],
                      title: details['title'],
                      subtitle: details['subtitle'],
                      color: details['color'],
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 300),
                            reverseTransitionDuration: const Duration(milliseconds: 250),
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                DatosEventoScreen(tipoEvento: eventType),
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
                        );
                      },
                    ),
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
          'icon': Icons.vaccines_rounded,
          'title': 'Vacunación',
          'subtitle': 'Aplicar vacunas y biológicos',
          'color': AppColors.success,
        };
      case TipoEvento.desparasitante:
        return {
          'icon': Icons.bug_report_rounded,
          'title': 'Desparasitación',
          'subtitle': 'Control de parásitos internos/externos',
          'color': AppColors.warning,
        };
      case TipoEvento.tratamiento:
        return {
          'icon': Icons.medical_services_rounded,
          'title': 'Tratamiento Médico',
          'subtitle': 'Antibióticos o medicación general',
          'color': AppColors.info,
        };
      case TipoEvento.revisionVeterinaria:
        return {
          'icon': Icons.health_and_safety_rounded,
          'title': 'Revisión Veterinaria',
          'subtitle': 'Chequeo general o diagnóstico',
          'color': AppColors.secondary,
        };
      case TipoEvento.castracion:
        return {
          'icon': Icons.content_cut_rounded,
          'title': 'Castración',
          'subtitle': 'Procedimiento quirúrgico',
          'color': AppColors.error,
        };
      default:
        return {
          'icon': Icons.help_outline_rounded,
          'title': 'Otro',
          'subtitle': 'Evento no especificado',
          'color': AppColors.textHint,
        };
    }
  }
}

class _EventTypeCard extends StatefulWidget {
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
  State<_EventTypeCard> createState() => _EventTypeCardState();
}

class _EventTypeCardState extends State<_EventTypeCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
            setState(() => _isPressed = false);
            widget.onTap();
          },
          onTapCancel: () => setState(() => _isPressed = false),
          child: AnimatedScale(
            scale: _isPressed ? 0.97 : 1.0,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textPrimary.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: _isPressed 
                      ? widget.color.withValues(alpha: 0.6) 
                      : widget.color.withValues(alpha: 0.2),
                  width: _isPressed ? 2.0 : 1.5,
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
                        color: widget.color.withValues(alpha: 0.1),
                      ),
                      child: Icon(
                        widget.icon,
                        size: 40,
                        color: widget.color,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.title,
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
                      widget.subtitle,
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
        ),
      );
  }
}

