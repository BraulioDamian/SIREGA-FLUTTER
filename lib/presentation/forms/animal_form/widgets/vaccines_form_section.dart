import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para registrar vacunas del animal
/// Diseño intuitivo con checklist de vacunas comunes
class VaccinesFormSection extends StatelessWidget {
  const VaccinesFormSection({super.key});

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
                // Lista de vacunas comunes con checkboxes
                Text(
                      'Vacunas Aplicadas',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: isMobile ? 8 : 12),

                    // Vacunas periódicas (requieren fecha)
                    _buildVaccineCheckbox(
                      context,
                      controller,
                      'Fiebre Aftosa',
                      Icons.vaccines,
                      Colors.blue,
                      esPeriodica: true,
                    ),
                    _buildVaccineCheckbox(
                      context,
                      controller,
                      'Rabia',
                      Icons.vaccines,
                      Colors.red,
                      esPeriodica: true,
                    ),
                    _buildVaccineCheckbox(
                      context,
                      controller,
                      'Clostridiosis',
                      Icons.vaccines,
                      Colors.purple,
                      esPeriodica: true,
                    ),

                    const SizedBox(height: 12),
                    Text(
                      'Vacunas de Aplicación Única',
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Vacunas únicas (no requieren fecha)
                    _buildVaccineCheckbox(
                      context,
                      controller,
                      'Brucelosis',
                      Icons.vaccines,
                      Colors.pink,
                      esPeriodica: false,
                    ),
                    _buildVaccineCheckbox(
                      context,
                      controller,
                      'Carbunco',
                      Icons.vaccines,
                      Colors.orange,
                      esPeriodica: false,
                    ),
                    _buildVaccineCheckbox(
                      context,
                      controller,
                      'IBR/DVB',
                      Icons.vaccines,
                      Colors.green,
                      esPeriodica: false,
                    ),

                    SizedBox(height: isMobile ? 12 : 16),

                    // Botón para agregar otra vacuna
                    OutlinedButton.icon(
                      onPressed: () => _mostrarDialogoVacunaPersonalizada(context, controller),
                      icon: const Icon(Icons.add),
                      label: const Text('Agregar otra vacuna'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColor,
                      ),
                    ),

                    // Mostrar vacunas personalizadas
                    if (controller.vacunasPersonalizadas.isNotEmpty) ...[
                      SizedBox(height: isMobile ? 12 : 16),
                      ...controller.vacunasPersonalizadas.map((vacuna) {
                        return _buildVaccineCheckbox(
                          context,
                          controller,
                          vacuna,
                          Icons.vaccines,
                          Colors.teal,
                          esPersonalizada: true,
                        );
                      }),
                    ],
                  ],
                );
          },
        );
      },
    );
  }



  Widget _buildVaccineCheckbox(
    BuildContext context,
    AnimalFormController controller,
    String nombreVacuna,
    IconData icon,
    Color color, {
    bool esPersonalizada = false,
    bool esPeriodica = false,
  }) {
    final isChecked = controller.vacunasAplicadas.contains(nombreVacuna);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isChecked ? color.withAlpha(26) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isChecked ? color : Colors.grey.shade300,
          width: isChecked ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: esPeriodica && isChecked
            ? () => _mostrarDialogoFechaVacuna(context, controller, nombreVacuna)
            : null,
        borderRadius: BorderRadius.circular(12),
        child: CheckboxListTile(
          value: isChecked,
          onChanged: (bool? value) {
            if (value == true) {
              controller.agregarVacuna(nombreVacuna);
              // Solo mostrar diálogo de fecha si es vacuna periódica
              if (esPeriodica) {
                _mostrarDialogoFechaVacuna(context, controller, nombreVacuna);
              }
            } else {
              controller.removerVacuna(nombreVacuna);
            }
          },
          title: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                nombreVacuna,
                style: TextStyle(
                  fontWeight: isChecked ? FontWeight.w600 : FontWeight.normal,
                  color: isChecked ? color : Colors.black87,
                ),
              ),
            ),
            if (esPersonalizada)
              IconButton(
                icon: const Icon(Icons.delete_outline, size: 20),
                onPressed: () {
                  controller.eliminarVacunaPersonalizada(nombreVacuna);
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
          ],
        ),
        subtitle: (esPeriodica && controller.fechasVacunas[nombreVacuna] != null)
            ? Text(
                'Última aplicación: ${_formatDate(controller.fechasVacunas[nombreVacuna]!)}',
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              )
            : (esPeriodica && isChecked)
                ? Text(
                    'Toca para agregar fecha',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                : null,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoFechaVacuna(
    BuildContext context,
    AnimalFormController controller,
    String nombreVacuna,
  ) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: const Locale('es', 'ES'),
      helpText: 'Fecha de aplicación',
      cancelText: 'Omitir',
      confirmText: 'Guardar',
    ).then((fecha) {
      if (fecha != null) {
        controller.setFechaVacuna(nombreVacuna, fecha);
      }
    });
  }

  void _mostrarDialogoVacunaPersonalizada(
    BuildContext context,
    AnimalFormController controller,
  ) {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: const [
            Icon(Icons.vaccines, color: Colors.teal),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Agregar Vacuna',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Nombre de la vacuna',
            hintText: 'Ej: Leptospirosis',
            border: OutlineInputBorder(),
          ),
          textCapitalization: TextCapitalization.words,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              final nombre = textController.text.trim();
              if (nombre.isNotEmpty) {
                controller.agregarVacunaPersonalizada(nombre);
                Navigator.pop(context);
                // Automáticamente agregar y mostrar fecha
                controller.agregarVacuna(nombre);
                _mostrarDialogoFechaVacuna(context, controller, nombre);
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
