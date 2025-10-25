import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para datos de producción y peso
/// Permite registrar historial de pesajes y producción de leche
class ProductionFormSection extends StatelessWidget {
  const ProductionFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalFormController>(
      builder: (context, controller, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Sección de Peso
                  Card(
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWeightHeader(context, isMobile),
                        SizedBox(height: isMobile ? 8 : 12),
                        _buildWeightDescription(context, isMobile),
                        SizedBox(height: isMobile ? 12 : 16),

                        // Peso al Nacer
                        TextFormField(
                          controller: controller.pesoNacimientoController,
                          decoration: _inputDecoration('Peso al Nacer (kg)', Icons.scale, context: context),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                          ],
                        ),

                        SizedBox(height: isMobile ? 12 : 16),

                        // Lista de pesajes registrados
                        if (controller.registrosPesajes.isEmpty)
                          _buildEmptyState(isMobile, 'Sin pesajes registrados', Icons.monitor_weight)
                        else
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 400),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.registrosPesajes.length,
                              itemBuilder: (context, index) {
                                final pesaje = controller.registrosPesajes[index];
                                return _buildPesajeCard(context, controller, pesaje, index, isMobile);
                              },
                            ),
                          ),

                        SizedBox(height: isMobile ? 12 : 16),

                        // Botón para agregar pesaje
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => _mostrarDialogoAgregarPesaje(context, controller),
                            icon: const Icon(Icons.add),
                            label: const Text('Registrar Pesaje'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Sección de Producción de Leche
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMilkHeader(context, isMobile),
                        SizedBox(height: isMobile ? 8 : 12),
                        _buildMilkDescription(context, isMobile),
                        SizedBox(height: isMobile ? 12 : 16),

                        // Lista de registros de producción de leche
                        if (controller.registrosProduccionLeche.isEmpty)
                          _buildEmptyState(isMobile, 'Sin producción de leche registrada', Icons.opacity)
                        else
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 400),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.registrosProduccionLeche.length,
                              itemBuilder: (context, index) {
                                final produccion = controller.registrosProduccionLeche[index];
                                return _buildProduccionLecheCard(context, controller, produccion, index, isMobile);
                              },
                            ),
                          ),

                        SizedBox(height: isMobile ? 12 : 16),

                        // Botón para agregar producción de leche
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => _mostrarDialogoAgregarProduccionLeche(context, controller),
                            icon: const Icon(Icons.add),
                            label: const Text('Registrar Producción de Leche'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            );
          },
        );
      },
    );
  }

  Widget _buildWeightHeader(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Icon(
          Icons.monitor_weight,
          color: Theme.of(context).primaryColor,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Control de Peso',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeightDescription(BuildContext context, bool isMobile) {
    return Text(
      'Registro de pesajes y evolución del peso',
      style: TextStyle(
        fontSize: isMobile ? 12 : 14,
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget _buildMilkHeader(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Icon(
          Icons.opacity,
          color: Theme.of(context).primaryColor,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Producción de Leche',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMilkDescription(BuildContext context, bool isMobile) {
    return Text(
      'Registro diario de producción láctea',
      style: TextStyle(
        fontSize: isMobile ? 12 : 14,
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget _buildEmptyState(bool isMobile, String message, IconData icon) {
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
              icon,
              size: isMobile ? 40 : 48,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: isMobile ? 8 : 12),
            Text(
              message,
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

  Widget _buildPesajeCard(
    BuildContext context,
    AnimalFormController controller,
    Map<String, dynamic> pesaje,
    int index,
    bool isMobile,
  ) {
    final fecha = pesaje['fecha'] as DateTime;
    final peso = pesaje['peso'] as double;
    final notas = pesaje['notas'] as String?;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withAlpha(77)),
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
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.monitor_weight, color: Colors.green, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${peso.toStringAsFixed(1)} kg',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile ? 14 : 15,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 12, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Text(
                        'Fecha: ${_formatDate(fecha)}',
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  if (notas != null && notas.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      notas,
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
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
              onPressed: () => controller.eliminarRegistroPesaje(index),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProduccionLecheCard(
    BuildContext context,
    AnimalFormController controller,
    Map<String, dynamic> produccion,
    int index,
    bool isMobile,
  ) {
    final fecha = produccion['fecha'] as DateTime;
    final litros = produccion['litros'] as double;
    final notas = produccion['notas'] as String?;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withAlpha(77)),
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
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.opacity, color: Colors.blue, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${litros.toStringAsFixed(1)} L/día',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile ? 14 : 15,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 12, color: Colors.grey.shade500),
                      const SizedBox(width: 4),
                      Text(
                        'Fecha: ${_formatDate(fecha)}',
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  if (notas != null && notas.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      notas,
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
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
              onPressed: () => controller.eliminarRegistroProduccionLeche(index),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDialogoAgregarPesaje(
    BuildContext context,
    AnimalFormController controller,
  ) {
    final pesoController = TextEditingController();
    final notasController = TextEditingController();
    DateTime fechaSeleccionada = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.monitor_weight, color: Colors.green),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Registrar Pesaje',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Fecha del pesaje
                ListTile(
                  title: const Text('Fecha del Pesaje'),
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

                // Peso
                TextField(
                  controller: pesoController,
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    hintText: 'Ej: 450.5',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  autofocus: true,
                ),
                const SizedBox(height: 16),

                // Notas
                TextField(
                  controller: notasController,
                  decoration: const InputDecoration(
                    labelText: 'Notas (opcional)',
                    hintText: 'Observaciones del pesaje',
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
                final peso = double.tryParse(pesoController.text.trim());
                if (peso != null && peso > 0) {
                  controller.agregarRegistroPesaje({
                    'fecha': fechaSeleccionada,
                    'peso': peso,
                    'notas': notasController.text.trim().isEmpty
                        ? null
                        : notasController.text.trim(),
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDialogoAgregarProduccionLeche(
    BuildContext context,
    AnimalFormController controller,
  ) {
    final litrosController = TextEditingController();
    final notasController = TextEditingController();
    DateTime fechaSeleccionada = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.opacity, color: Colors.blue),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Registrar Producción de Leche',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Fecha de producción
                ListTile(
                  title: const Text('Fecha de Producción'),
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

                // Litros producidos
                TextField(
                  controller: litrosController,
                  decoration: const InputDecoration(
                    labelText: 'Litros por día',
                    hintText: 'Ej: 18.5',
                    border: OutlineInputBorder(),
                    suffixText: 'L/día',
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  autofocus: true,
                ),
                const SizedBox(height: 16),

                // Notas
                TextField(
                  controller: notasController,
                  decoration: const InputDecoration(
                    labelText: 'Notas (opcional)',
                    hintText: 'Observaciones de la producción',
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
                final litros = double.tryParse(litrosController.text.trim());
                if (litros != null && litros > 0) {
                  controller.agregarRegistroProduccionLeche({
                    'fecha': fechaSeleccionada,
                    'litros': litros,
                    'notas': notasController.text.trim().isEmpty
                        ? null
                        : notasController.text.trim(),
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  InputDecoration _inputDecoration(String label, IconData icon, {BuildContext? context}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: context != null ? Theme.of(context).primaryColor : Colors.blue,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}
