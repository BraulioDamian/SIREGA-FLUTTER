import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/models/form_dtos.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para registrar partos y crías
/// Permite llevar un historial de descendencia del animal
class OffspringFormSection extends StatelessWidget {
  const OffspringFormSection({super.key});

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
                // Lista de partos/crías
                if (controller.birthRecords.isEmpty)
                  _buildEmptyState(isMobile)
                else
                  ...controller.birthRecords.asMap().entries.map((entry) {
                    final index = entry.key;
                    final parto = entry.value;
                    return _buildOffspringCard(
                      context,
                      controller,
                      parto,
                      index,
                      isMobile,
                    );
                  }),

                SizedBox(height: isMobile ? 12 : 16),

                // Botón para agregar parto
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        _mostrarDialogoAgregarParto(context, controller),
                    icon: const Icon(Icons.child_care),
                    label: const Text('Registrar Parto'),
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
              Icons.pregnant_woman,
              size: isMobile ? 40 : 48,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: isMobile ? 8 : 12),
            Text(
              'Sin partos registrados',
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

  Widget _buildOffspringCard(
    BuildContext context,
    AnimalFormController controller,
    BirthRecord parto,
    int index,
    bool isMobile,
  ) {
    final idCria = parto.offspringId;
    final date = parto.date;
    final sexoCria = parto.offspringSex;
    final pesoKg = parto.weightKg;
    final notes = parto.notes;

    final color = sexoCria == Sexo.macho ? Colors.blue : Colors.pink;
    final icon = sexoCria == Sexo.macho ? Icons.male : Icons.female;

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
            // Icono del sex
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withAlpha(26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 12),

            // Información del parto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (idCria != null)
                    Text(
                      idCria,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: isMobile ? 14 : 15,
                        color: color,
                      ),
                    ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Nacimiento: ${_formatDate(date)}',
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  if (pesoKg != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.monitor_weight,
                          size: 12,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Peso al nacer: ${pesoKg.toStringAsFixed(1)} kg',
                          style: TextStyle(
                            fontSize: isMobile ? 11 : 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (notes != null && notes.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      notes,
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
              onPressed: () => controller.removeBirthRecord(index),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDialogoAgregarParto(
    BuildContext context,
    AnimalFormController controller,
  ) {
    final idCriaController = TextEditingController();
    final pesoController = TextEditingController();
    final notasController = TextEditingController();
    DateTime fechaSeleccionada = DateTime.now();
    Sexo sexoSeleccionado = Sexo.hembra;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.child_care, color: Colors.purple),
              SizedBox(width: 12),
              Expanded(
                child: Text('Registrar Parto', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ID de la cría
                TextField(
                  controller: idCriaController,
                  decoration: const InputDecoration(
                    labelText: 'ID de la Cría (opcional)',
                    hintText: 'Ej: Ternero #234',
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 16),

                // Sexo de la cría
                DropdownButtonFormField<Sexo>(
                  initialValue: sexoSeleccionado,
                  decoration: const InputDecoration(
                    labelText: 'Sexo de la Cría',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: Sexo.hembra, child: Text('Hembra')),
                    DropdownMenuItem(value: Sexo.macho, child: Text('Macho')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => sexoSeleccionado = value);
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Fecha de nacimiento
                ListTile(
                  title: const Text('Fecha de Nacimiento'),
                  subtitle: Text(_formatDate(fechaSeleccionada)),
                  leading: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: fechaSeleccionada,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      locale: const Locale('es', 'ES'),
                    );
                    if (date != null) {
                      setState(() => fechaSeleccionada = date);
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                const SizedBox(height: 16),

                // Peso al nacer
                TextField(
                  controller: pesoController,
                  decoration: const InputDecoration(
                    labelText: 'Peso al Nacer (kg) - opcional',
                    hintText: 'Ej: 35.5',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                const SizedBox(height: 16),

                // Notas
                TextField(
                  controller: notasController,
                  decoration: const InputDecoration(
                    labelText: 'Notas (opcional)',
                    hintText: 'Observaciones del parto',
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
                controller.addBirthRecord(
                  BirthRecord(
                    date: fechaSeleccionada,
                    offspringId: idCriaController.text.trim().isEmpty
                        ? null
                        : idCriaController.text.trim(),
                    offspringSex: sexoSeleccionado,
                    weightKg: double.tryParse(pesoController.text.trim()),
                    notes: notasController.text.trim().isEmpty
                        ? null
                        : notasController.text.trim(),
                  ),
                );

                Navigator.pop(context);
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
}
