import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/models/production_model.dart';
import 'package:sirega_app/core/services/isar_service.dart';
import 'package:sirega_app/features/animal_detail/presentation/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/features/animal_detail/presentation/screens/cattle_detail_screen.dart';

/// Diálogos de registro rápido directamente desde la pantalla de detalle.
/// Evita tener que entrar a "Editar Animal" para agregar un pesaje, parto, etc.
class QuickAddDialogs {
  QuickAddDialogs._();

  // ───────────────── PESAJE ─────────────────

  static void mostrarRegistroPesaje(BuildContext context, Animal animal) {
    final pesoController = TextEditingController();
    final notasController = TextEditingController();
    DateTime fechaSeleccionada = DateTime.now();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => _BottomSheetWrapper(
          title: 'Registrar Pesaje',
          icon: Icons.monitor_weight_rounded,
          color: Colors.lightBlue,
          onSave: () async {
            final peso = double.tryParse(pesoController.text.trim());
            if (peso == null || peso <= 0) {
              _mostrarError(ctx, 'Ingresa un peso válido');
              return;
            }
            final registro = ProductionRecord()
              ..tipo = ProductionType.weight
              ..date = fechaSeleccionada
              ..pesoKg = peso
              ..notes = notasController.text.trim().isEmpty
                  ? null
                  : notasController.text.trim();

            final isarService = RepositoryProvider.of<IsarService>(ctx);
            await isarService.saveProductionRecord(registro, animal);

            // Actualizar peso actual en el animal
            animal.currentWeight = peso;
            animal.lastWeighDate = fechaSeleccionada;
            await isarService.saveAnimal(animal);

            if (ctx.mounted) Navigator.pop(ctx);
            if (context.mounted) {
              _mostrarExito(context, 'Pesaje registrado');
              context.read<CattleDetailBloc>().add(LoadCattleDetail(animal.id));
            }
          },
          children: [
            _buildFechaSelector(
              ctx,
              fechaSeleccionada,
              (date) => setState(() => fechaSeleccionada = date),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: pesoController,
              label: 'Peso (kg)',
              icon: Icons.monitor_weight_outlined,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              autofocus: true,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: notasController,
              label: 'Notas (opcional)',
              icon: Icons.notes_rounded,
            ),
          ],
        ),
      ),
    );
  }

  // ───────────────── PRODUCCIÓN DE LECHE ─────────────────

  static void mostrarRegistroLeche(BuildContext context, Animal animal) {
    final litrosController = TextEditingController();
    final notasController = TextEditingController();
    DateTime fechaSeleccionada = DateTime.now();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => _BottomSheetWrapper(
          title: 'Producción de Leche',
          icon: Icons.water_drop_rounded,
          color: Colors.teal,
          onSave: () async {
            final litros = double.tryParse(litrosController.text.trim());
            if (litros == null || litros <= 0) {
              _mostrarError(ctx, 'Ingresa una cantidad válida');
              return;
            }
            final registro = ProductionRecord()
              ..tipo = ProductionType.milk
              ..date = fechaSeleccionada
              ..litrosPorDia = litros
              ..notes = notasController.text.trim().isEmpty
                  ? null
                  : notasController.text.trim();

            final isarService = RepositoryProvider.of<IsarService>(ctx);
            await isarService.saveProductionRecord(registro, animal);

            if (ctx.mounted) Navigator.pop(ctx);
            if (context.mounted) {
              _mostrarExito(context, 'Producción registrada');
              context.read<CattleDetailBloc>().add(LoadCattleDetail(animal.id));
            }
          },
          children: [
            _buildFechaSelector(
              ctx,
              fechaSeleccionada,
              (date) => setState(() => fechaSeleccionada = date),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: litrosController,
              label: 'Litros por día',
              icon: Icons.water_drop_outlined,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              autofocus: true,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: notasController,
              label: 'Notas (opcional)',
              icon: Icons.notes_rounded,
            ),
          ],
        ),
      ),
    );
  }

  // ───────────────── REGISTRO DE PARTO ─────────────────

  static void mostrarRegistroParto(BuildContext context, Animal animal) {
    final nombreCriaController = TextEditingController(
      text: 'Cría de ${animal.name}',
    );
    final pesoController = TextEditingController();
    final notasController = TextEditingController();
    DateTime fechaSeleccionada = DateTime.now();
    Sexo sexoSeleccionado = Sexo.hembra;
    bool guardando = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => _BottomSheetWrapper(
          title: 'Registrar Parto',
          icon: Icons.child_care_rounded,
          color: Colors.pink,
          onSave: guardando
              ? () {}
              : () async {
                  final name = nombreCriaController.text.trim();
                  if (name.isEmpty) {
                    _mostrarError(ctx, 'Ingresa un name para la cría');
                    return;
                  }

                  setState(() => guardando = true);

                  try {
                    final isarService = RepositoryProvider.of<IsarService>(ctx);
                    final pesoNac = double.tryParse(pesoController.text.trim());

                    // 1. Crear el animal (la cría)
                    final cria = Animal()
                      ..name = name
                      ..sex = sexoSeleccionado
                      ..breed = animal.breed
                      ..birthDate = fechaSeleccionada
                      ..birthWeight = pesoNac
                      ..currentWeight = pesoNac
                      ..estado = EstadoAnimal.activo
                      ..healthStatus = EstadoSalud.sano;

                    // Guardar cría y enlazar dam en una sola transacción
                    await animal.herd.load();
                    await IsarService.isar.writeTxn(() async {
                      await IsarService.isar.animals.put(cria);
                      cria.dam.value = animal;
                      await cria.dam.save();
                      // Heredar hato de la dam
                      if (animal.herd.value != null) {
                        cria.herd.value = animal.herd.value;
                        await cria.herd.save();
                      }
                    });

                    // 2. Crear registro de produccion (parto) en la dam
                    final registro = ProductionRecord()
                      ..tipo = ProductionType.birth
                      ..date = fechaSeleccionada
                      ..idCria = cria.id.toString()
                      ..pesoKg = pesoNac
                      ..sexoCria = sexoSeleccionado
                      ..notes = [
                        'Nombre: $name',
                        if (notasController.text.trim().isNotEmpty)
                          notasController.text.trim(),
                      ].join('. ');

                    await isarService.saveProductionRecord(registro, animal);

                    // 3. Actualizar estadísticas de la dam
                    animal.calvingCount += 1;
                    animal.offspringCount += 1;
                    animal.lastCalvingDate = fechaSeleccionada;
                    await isarService.saveAnimal(animal);

                    if (ctx.mounted) Navigator.pop(ctx);
                    if (context.mounted) {
                      _mostrarExitoConAccion(
                        context,
                        'Parto registrado — cría creada',
                        'Ver cría',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (_) => CattleDetailBloc(
                                  isarService:
                                      RepositoryProvider.of<IsarService>(
                                        context,
                                      ),
                                )..add(LoadCattleDetail(cria.id)),
                                child: CattleDetailScreen(id: cria.id),
                              ),
                            ),
                          );
                        },
                      );
                      context.read<CattleDetailBloc>().add(
                        LoadCattleDetail(animal.id),
                      );
                    }
                  } catch (e) {
                    if (ctx.mounted) {
                      setState(() => guardando = false);
                      _mostrarError(ctx, 'Error al registrar parto');
                    }
                  }
                },
          children: [
            _buildFechaSelector(
              ctx,
              fechaSeleccionada,
              (date) => setState(() => fechaSeleccionada = date),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: nombreCriaController,
              label: 'Nombre de la cría',
              icon: Icons.pets_rounded,
              autofocus: false,
            ),
            const SizedBox(height: 12),
            // Sexo de la cría — toggle con colores
            _buildSexoSelector(
              sexoSeleccionado,
              (s) => setState(() => sexoSeleccionado = s),
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: pesoController,
              label: 'Peso al nacer (kg, opcional)',
              icon: Icons.monitor_weight_outlined,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: notasController,
              label: 'Notas (opcional)',
              icon: Icons.notes_rounded,
            ),
            if (guardando) ...[
              const SizedBox(height: 16),
              const Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
    );
  }

  // ───────────────── HELPERS ─────────────────

  static Widget _buildSexoSelector(
    Sexo selected,
    ValueChanged<Sexo> onChanged,
  ) {
    return Row(
      children: [
        Expanded(
          child: _SexoOption(
            label: 'Hembra',
            icon: Icons.female_rounded,
            color: Colors.pink,
            isSelected: selected == Sexo.hembra,
            onTap: () => onChanged(Sexo.hembra),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _SexoOption(
            label: 'Macho',
            icon: Icons.male_rounded,
            color: Colors.blue,
            isSelected: selected == Sexo.macho,
            onTap: () => onChanged(Sexo.macho),
          ),
        ),
      ],
    );
  }

  static Widget _buildFechaSelector(
    BuildContext context,
    DateTime date,
    ValueChanged<DateTime> onChanged,
  ) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          locale: const Locale('es', 'MX'),
        );
        if (picked != null) onChanged(picked);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_rounded,
              size: 20,
              color: AppColors.primary,
            ),
            const SizedBox(width: 10),
            Text(
              '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              'Cambiar',
              style: TextStyle(fontSize: 13, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool autofocus = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autofocus: autofocus,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
      ),
    );
  }

  static void _mostrarError(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void _mostrarExito(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.surface, size: 20),
            const SizedBox(width: 8),
            Text(mensaje),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void _mostrarExitoConAccion(
    BuildContext context,
    String mensaje,
    String actionLabel,
    VoidCallback onAction,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.surface, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(mensaje)),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: actionLabel,
          textColor: AppColors.surface,
          onPressed: onAction,
        ),
      ),
    );
  }
}

// ───────────────── BOTTOM SHEET WRAPPER ─────────────────

class _BottomSheetWrapper extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onSave;
  final List<Widget> children;

  const _BottomSheetWrapper({
    required this.title,
    required this.icon,
    required this.color,
    required this.onSave,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: color, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Content
              ...children,
              const SizedBox(height: 24),
              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onSave,
                  icon: const Icon(Icons.save_rounded, size: 20),
                  label: const Text(
                    'Guardar',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: color,
                    foregroundColor: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ───────────────── SEXO OPTION TOGGLE ─────────────────

class _SexoOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _SexoOption({
    required this.label,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected
            ? color.withValues(alpha: 0.12)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? color : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: isSelected ? color : Colors.grey.shade500,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? color : Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
