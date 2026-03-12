import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/core/models/vaccines_catalog.dart';
import '../controllers/animal_form_controller.dart';

/// Sección del formulario para registrar vacunas del animal
/// Usa el catálogo de vacunas bovinas para separar periódicas y de aplicación única
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
                // ── Vacunas Periódicas ──
                Text(
                  'Vacunas con Refuerzo Periódico',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Requieren reaplicación según calendario',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: isMobile ? 8 : 12),

                ...CatalogoVacunas.periodicas.map(
                  (vacuna) =>
                      _buildVaccineCheckbox(context, controller, vacuna),
                ),

                const SizedBox(height: 16),

                // ── Vacunas de Aplicación Única ──
                Text(
                  'Vacunas de Aplicación Única',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Se aplican una sola vez en la vida del animal',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 8),

                ...CatalogoVacunas.unicas.map(
                  (vacuna) =>
                      _buildVaccineCheckbox(context, controller, vacuna),
                ),

                SizedBox(height: isMobile ? 12 : 16),

                // ── Vacunas personalizadas ──
                OutlinedButton.icon(
                  onPressed: () =>
                      _mostrarDialogoVacunaPersonalizada(context, controller),
                  icon: const Icon(Icons.add),
                  label: const Text('Agregar otra vacuna'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                ),

                if (controller.vacunasPersonalizadas.isNotEmpty) ...[
                  SizedBox(height: isMobile ? 12 : 16),
                  ...controller.vacunasPersonalizadas.map((name) {
                    return _buildVaccineCheckboxCustom(
                      context,
                      controller,
                      name,
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
    VacunaInfo vacuna,
  ) {
    final isChecked = controller.vacunasAplicadas.contains(vacuna.name);
    final esPeriodica = !vacuna.esAplicacionUnica;
    final color = vacuna.color;

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
            ? () => _mostrarDialogoFechaVacuna(context, controller, vacuna.name)
            : null,
        borderRadius: BorderRadius.circular(12),
        child: CheckboxListTile(
          value: isChecked,
          onChanged: (bool? value) {
            if (value == true) {
              controller.agregarVacuna(vacuna.name);
              if (esPeriodica) {
                _mostrarDialogoFechaVacuna(context, controller, vacuna.name);
              }
            } else {
              controller.removerVacuna(vacuna.name);
            }
          },
          title: Row(
            children: [
              Icon(vacuna.icono, color: color, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vacuna.name,
                      style: TextStyle(
                        fontWeight: isChecked
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: isChecked ? color : Colors.black87,
                      ),
                    ),
                    Text(
                      vacuna.intervaloTexto,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          subtitle: _buildSubtitle(
            controller,
            vacuna,
            isChecked,
            esPeriodica,
            color,
          ),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget? _buildSubtitle(
    AnimalFormController controller,
    VacunaInfo vacuna,
    bool isChecked,
    bool esPeriodica,
    Color color,
  ) {
    final fechaAplicacion = controller.fechasVacunas[vacuna.name];

    if (esPeriodica && fechaAplicacion != null) {
      final proxima = vacuna.proximaAplicacion(fechaAplicacion);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aplicada: ${_formatDate(fechaAplicacion)}',
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (proxima != null)
            Text(
              'Próximo refuerzo: ${_formatDate(proxima)}',
              style: TextStyle(
                fontSize: 12,
                color: _estaVencida(proxima)
                    ? Colors.red
                    : Colors.grey.shade600,
                fontWeight: _estaVencida(proxima)
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
        ],
      );
    }

    if (esPeriodica && isChecked) {
      return Text(
        'Toca para agregar date de última aplicación',
        style: TextStyle(
          fontSize: 11,
          color: Colors.grey.shade600,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    if (vacuna.esAplicacionUnica && isChecked) {
      return Text(
        'Registrada ✓',
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    if (vacuna.edadRecomendada != null && !isChecked) {
      return Text(
        vacuna.edadRecomendada!,
        style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
      );
    }

    return null;
  }

  Widget _buildVaccineCheckboxCustom(
    BuildContext context,
    AnimalFormController controller,
    String name,
  ) {
    final isChecked = controller.vacunasAplicadas.contains(name);
    const color = Colors.teal;

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
      child: CheckboxListTile(
        value: isChecked,
        onChanged: (bool? value) {
          if (value == true) {
            controller.agregarVacuna(name);
            _mostrarDialogoFechaVacuna(context, controller, name);
          } else {
            controller.removerVacuna(name);
          }
        },
        title: Row(
          children: [
            const Icon(Icons.vaccines, color: color, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: isChecked ? FontWeight.w600 : FontWeight.normal,
                  color: isChecked ? color : Colors.black87,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, size: 20),
              onPressed: () => controller.eliminarVacunaPersonalizada(name),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        subtitle: controller.fechasVacunas[name] != null
            ? Text(
                'Aplicada: ${_formatDate(controller.fechasVacunas[name]!)}',
                style: const TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              )
            : null,
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  bool _estaVencida(DateTime date) => date.isBefore(DateTime.now());

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
    ).then((date) {
      if (date != null) {
        controller.setFechaVacuna(nombreVacuna, date);
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
        title: const Row(
          children: [
            Icon(Icons.vaccines, color: Colors.teal),
            SizedBox(width: 12),
            Expanded(
              child: Text('Agregar Vacuna', style: TextStyle(fontSize: 18)),
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
              final name = textController.text.trim();
              if (name.isNotEmpty) {
                controller.agregarVacunaPersonalizada(name);
                Navigator.pop(context);
                controller.agregarVacuna(name);
                _mostrarDialogoFechaVacuna(context, controller, name);
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
