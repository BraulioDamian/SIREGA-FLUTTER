import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sirega_app/modulos/3_registro_evento/aplicacion/registro_evento_service.dart';
import 'package:sirega_app/modulos/3_registro_evento/presentation/pantallas/resultado_evento_screen.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

class ConfirmacionEventoScreen extends StatefulWidget {
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
  State<ConfirmacionEventoScreen> createState() => _ConfirmacionEventoScreenState();
}

class _ConfirmacionEventoScreenState extends State<ConfirmacionEventoScreen> {
  bool _isLoading = false;

  Map<String, dynamic> _getEventTypeDetails() {
    switch (widget.tipoEvento) {
      case TipoEvento.vacuna:
        return {'title': 'Vacunación', 'icon': Icons.vaccines, 'color': Colors.green};
      case TipoEvento.desparasitante:
        return {'title': 'Desparasitación', 'icon': Icons.bug_report, 'color': Colors.orange};
      case TipoEvento.tratamiento:
        return {'title': 'Tratamiento', 'icon': Icons.medical_services, 'color': Colors.blue};
      case TipoEvento.revisionVeterinaria:
        return {'title': 'Revisión Veterinaria', 'icon': Icons.science, 'color': Colors.teal};
      case TipoEvento.castracion:
        return {'title': 'Castración', 'icon': Icons.cut, 'color': Colors.purple};
      default:
        return {'title': 'Evento', 'icon': Icons.event, 'color': Colors.grey};
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
        notas: widget.notas,
      );

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => ResultadoEventoScreen(animalCount: widget.animalesIds.length),
        ),
        (route) => route.isFirst,
      );
    } catch (e) {
      if (!mounted) return;

      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar el evento: ${e.toString()}'),
          backgroundColor: Colors.red,
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
      backgroundColor: Colors.grey[50],
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
                    primaryColor.withAlpha(200),
                    primaryColor,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(50),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(eventDetails['icon'], size: 32, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Resumen del Evento',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          eventDetails['title'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
            Text(
              'Datos del Evento',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildSummaryRow('Producto', widget.producto, Icons.inventory_2),
                    _buildSummaryRow('Fecha', DateFormat('dd/MM/yyyy').format(widget.fecha), Icons.calendar_today),
                    if (widget.dosis != null)
                      _buildSummaryRow('Dosis', '${widget.dosis} ${widget.unidadDosis ?? ''}', Icons.medical_information),
                    if (widget.veterinario != null && widget.veterinario!.isNotEmpty)
                      _buildSummaryRow('Veterinario', widget.veterinario!, Icons.person),
                    if (widget.notas != null && widget.notas!.isNotEmpty)
                      _buildSummaryRow('Notas', widget.notas!, Icons.notes, maxLines: 3),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Animales Seleccionados
            Text(
              'Animales Seleccionados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: primaryColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.pets, color: primaryColor, size: 32),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.animalesIds.length}',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          widget.animalesIds.length == 1 ? 'Animal' : 'Animales',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
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
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _guardarEvento,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey[300],
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.check_circle, size: 24),
                label: Text(
                  _isLoading ? 'Guardando...' : 'Confirmar y Guardar',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, IconData icon, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: Colors.grey[700]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
