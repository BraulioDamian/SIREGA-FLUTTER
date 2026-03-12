import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/form_dtos.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para registrar eventos médicos
/// (desparasitaciones, tratamientos, diagnósticos)
class MedicalEventsFormSection extends StatelessWidget {
  const MedicalEventsFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalFormController>(
      builder: (context, controller, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lista de eventos médicos
                    if (controller.medicalEvents.isEmpty)
                      _buildEmptyState(isMobile)
                    else
                      ...controller.medicalEvents.asMap().entries.map((entry) {
                        final index = entry.key;
                        final evento = entry.value;
                        return _buildEventoCard(
                          context,
                          controller,
                          evento,
                          index,
                          isMobile,
                        );
                      }),

                    SizedBox(height: isMobile ? 12 : 16),

                    // Botón para agregar evento
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _showAddEventDialog(context, controller),
                        icon: const Icon(Icons.add),
                        label: const Text('Agregar Evento Médico'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                );
          },
        );
      },
    );
  }



  Widget _buildEmptyState(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.medical_information_outlined,
              size: isMobile ? 40 : 48,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: isMobile ? 8 : 12),
            Text(
              'Sin eventos médicos registrados',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: isMobile ? 13 : 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventoCard(
    BuildContext context,
    AnimalFormController controller,
    MedicalEventRecord evento,
    int index,
    bool isMobile,
  ) {
    final (color, icon) = _getTipoInfo(evento.eventType);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(77)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(26),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono del tipo
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withAlpha(26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 12),

            // Información del evento
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getTipoNombre(evento.eventType),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile ? 14 : 15,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    evento.product,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 12, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Text(
                        _formatDate(evento.date),
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  if (evento.notes != null && evento.notes!.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      evento.notes!,
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 12,
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),

            // Botón eliminar
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
              onPressed: () => controller.removeMedicalEvent(index),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddEventDialog(
    BuildContext context,
    AnimalFormController controller,
  ) {
    TipoEvento tipoSeleccionado = TipoEvento.desparasitante;
    final productoController = TextEditingController();
    final notasController = TextEditingController();
    DateTime fechaSeleccionada = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.medical_services, color: Colors.teal),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Nuevo Evento Médico',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tipo de evento
                DropdownButtonFormField<TipoEvento>(
                  initialValue: tipoSeleccionado,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de Evento',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: TipoEvento.desparasitante, child: Text('Desparasitación')),
                    DropdownMenuItem(value: TipoEvento.tratamiento, child: Text('Tratamiento')),
                    DropdownMenuItem(value: TipoEvento.revisionVeterinaria, child: Text('Diagnóstico')),
                    DropdownMenuItem(value: TipoEvento.castracion, child: Text('Castración')),
                    DropdownMenuItem(value: TipoEvento.descorne, child: Text('Descorne')),
                    DropdownMenuItem(value: TipoEvento.otro, child: Text('Otro')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => tipoSeleccionado = value);
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Producto/Medicamento
                TextField(
                  controller: productoController,
                  decoration: const InputDecoration(
                    labelText: 'Producto/Medicamento',
                    hintText: 'Ej: Ivermectina 1%',
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 16),

                // Fecha
                ListTile(
                  title: const Text('Fecha'),
                  subtitle: Text(_formatDate(fechaSeleccionada)),
                  leading: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final fecha = await showDatePicker(
                      context: context,
                      initialDate: fechaSeleccionada,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      locale: const Locale('es', 'ES'),
                    );
                    if (fecha != null) {
                      setState(() => fechaSeleccionada = fecha);
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                const SizedBox(height: 16),

                // Notas
                TextField(
                  controller: notasController,
                  decoration: const InputDecoration(
                    labelText: 'Notas (opcional)',
                    hintText: 'Observaciones adicionales',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final producto = productoController.text.trim();
                if (producto.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('El producto/medicamento es requerido')),
                  );
                  return;
                }

                controller.addMedicalEvent(MedicalEventRecord(
                  eventType: tipoSeleccionado,
                  date: fechaSeleccionada,
                  product: producto,
                  notes: notasController.text.trim().isEmpty
                      ? null
                      : notasController.text.trim(),
                ));

                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  (Color, IconData) _getTipoInfo(TipoEvento tipo) {
    switch (tipo) {
      case TipoEvento.desparasitante:
        return (Colors.green, Icons.bug_report);
      case TipoEvento.tratamiento:
        return (Colors.orange, Icons.medication);
      case TipoEvento.revisionVeterinaria:
        return (Colors.blue, Icons.health_and_safety);
      case TipoEvento.castracion:
      case TipoEvento.descorne:
        return (Colors.red, Icons.healing);
      default:
        return (Colors.grey, Icons.medical_services);
    }
  }

  String _getTipoNombre(TipoEvento tipo) {
    switch (tipo) {
      case TipoEvento.desparasitante:
        return 'Desparasitación';
      case TipoEvento.tratamiento:
        return 'Tratamiento';
      case TipoEvento.revisionVeterinaria:
        return 'Diagnóstico';
      case TipoEvento.castracion:
        return 'Castración';
      case TipoEvento.descorne:
        return 'Descorne';
      default:
        return 'Evento Médico';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
