import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/presentation/forms/animal_form/controllers/animal_form_controller.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/image_picker_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/siniga_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/basic_info_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/additional_fields_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/nfc_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/health_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/reproduction_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/location_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/production_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/vaccines_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/medical_events_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/offspring_form_section.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/form_section_card.dart';
import 'package:sirega_app/presentation/forms/animal_form/helpers/animal_save_helper.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

/// Pantalla para editar un animal existente con interfaz completa de tabs
/// Idéntica a AgregarAnimalScreen pero con datos pre-cargados del animal
class EditarAnimalScreen extends StatefulWidget {
  final Animal animal;

  const EditarAnimalScreen({
    super.key,
    required this.animal,
  });

  @override
  State<EditarAnimalScreen> createState() => _EditarAnimalScreenState();
}

class _EditarAnimalScreenState extends State<EditarAnimalScreen>
    with SingleTickerProviderStateMixin {
  late AnimalFormController _formController;
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  // Estado de validación por tab
  bool _generalCompleto = false;
  bool _hasUnsavedChanges = false;

  @override
  void initState() {
    super.initState();
    // Inicializar el controlador en modo edición con el animal existente
    _formController = AnimalFormController(
      isEditMode: true,
      animalOriginal: widget.animal,
    );
    _tabController = TabController(length: 4, vsync: this);

    // Escuchar cambios del controlador para actualizar badges y detectar cambios sin guardar
    _formController.addListener(_actualizarEstadoTabs);

    // Escuchar cambios de tab para actualizar la UI
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    // Solo actualizar si el widget sigue montado
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Remover listeners ANTES de hacer dispose de los controllers
    _tabController.removeListener(_onTabChanged);
    _formController.removeListener(_actualizarEstadoTabs);

    // Ahora es seguro hacer dispose
    _tabController.dispose();
    _formController.dispose();

    super.dispose();
  }

  void _actualizarEstadoTabs() {
    if (!mounted) return;
    setState(() {
      // Verificar si los campos básicos están completos
      _generalCompleto = _formController.isFormValid;
      // Solo marcar cambios después de la carga inicial
      if (_formController.initialLoadComplete) {
        _hasUnsavedChanges = true;
      }
    });
  }

  void _navegarATab(int index) {
    if (!mounted) return;

    // Verificar que el índice es válido
    if (index < 0 || index >= _tabController.length) {
      debugPrint('Índice de tab inválido: $index');
      return;
    }

    // Navegar después del frame actual para evitar conflictos
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _tabController.index != index) {
        _tabController.animateTo(index);
      }
    });
  }

  Future<bool> _onWillPop() async {
    if (!_hasUnsavedChanges) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('¿Descartar cambios?'),
        content: const Text('Tienes cambios sin guardar. ¿Estás seguro de que quieres salir?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.surface,
            ),
            child: const Text('Descartar'),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: !_hasUnsavedChanges,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (!mounted) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: ChangeNotifierProvider.value(
        value: _formController,
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Editar Vacuno',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.surface,
                  ),
                ),
                Text(
                  widget.animal.nombre,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.surface,
                  ),
                ),
              ],
            ),
            centerTitle: false,
            elevation: 0,
            backgroundColor: theme.primaryColor,
            foregroundColor: AppColors.surface,
            iconTheme: const IconThemeData(color: AppColors.surface),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: AppColors.surface),
              onPressed: () async {
                if (_hasUnsavedChanges) {
                  if (!mounted) return;
                  final shouldPop = await _onWillPop();
                  if (shouldPop && context.mounted) {
                    Navigator.of(context).pop();
                  }
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
            actions: [
              if (_hasUnsavedChanges)
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.warning,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Sin guardar',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.surface,
                      ),
                    ),
                  ),
                ),
            ],
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 0,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.surface.withValues(alpha: 0.2),
              ),
              dividerColor: Colors.transparent,
              labelColor: AppColors.surface,
              unselectedLabelColor: AppColors.surface.withValues(alpha: 0.7),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              tabs: const [
                _TabItem(icon: Icons.info_outline_rounded, label: 'General'),
                _TabItem(icon: Icons.favorite_outline_rounded, label: 'Salud'),
                _TabItem(icon: Icons.child_care_rounded, label: 'Reproducción'),
                _TabItem(icon: Icons.trending_up_rounded, label: 'Producción'),
              ],
            ),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                // Indicador de progreso
                _buildProgressIndicator(),

                // Contenido de los tabs
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildGeneralTab(),
                      _buildSaludTab(),
                      _buildReproduccionTab(),
                      _buildProduccionTab(),
                    ],
                  ),
                ),

                // Botón de actualizar
                _buildUpdateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: _generalCompleto ? AppColors.success.withValues(alpha: 0.05) : AppColors.surface,
        border: Border(
          bottom: BorderSide(
            color: _generalCompleto
                ? AppColors.success.withValues(alpha: 0.2)
                : AppColors.divider,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              _generalCompleto ? Icons.check_circle : Icons.info_outline,
              key: ValueKey(_generalCompleto),
              size: 18,
              color: _generalCompleto ? AppColors.success : AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: 12,
                color: _generalCompleto ? AppColors.success : AppColors.textSecondary,
                fontWeight: _generalCompleto ? FontWeight.w500 : FontWeight.normal,
                height: 1.3,
              ),
              child: Text(
                _generalCompleto
                    ? 'Campos requeridos completados. Puedes agregar más información en las otras pestañas.'
                    : 'Complete los campos requeridos en la pestaña General',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralTab() {
    return ListView(
      key: const PageStorageKey('general_tab'),
      padding: const EdgeInsets.all(16),
      children: [
        const FormSectionCard(
          title: 'Foto del Animal',
          icon: Icons.image,
          child: ImagePickerSection(),
        ),
        const SizedBox(height: 16),
        const FormSectionCard(
          title: 'Identificación SINIGA',
          icon: Icons.tag,
          isRequired: true,
          child: SinigaFormSection(),
        ),
        const SizedBox(height: 16),
        const FormSectionCard(
          title: 'Información Básica',
          icon: Icons.pets,
          isRequired: true,
          child: BasicInfoFormSection(),
        ),
        const SizedBox(height: 16),
        const FormSectionCard(
          title: 'Información Adicional',
          icon: Icons.description,
          child: AdditionalFieldsFormSection(),
        ),
        const SizedBox(height: 16),
        const FormSectionCard(
          title: 'Ubicación',
          icon: Icons.location_on,
          child: LocationFormSection(),
        ),
        const SizedBox(height: 16),
        const FormSectionCard(
          title: 'Chip NFC',
          icon: Icons.nfc,
          isRequired: true,
          child: NfcSection(),
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildSaludTab() {
    return ListView(
      key: const PageStorageKey('salud_tab'),
      padding: const EdgeInsets.all(16),
      children: [
        const FormSectionCard(
          title: 'Estado de Salud',
          icon: Icons.favorite,
          child: HealthFormSection(),
        ),
        const SizedBox(height: 16),
        const FormSectionCard(
          title: 'Vacunas',
          icon: Icons.vaccines,
          child: VaccinesFormSection(),
        ),
        const SizedBox(height: 16),
        const FormSectionCard(
          title: 'Eventos Médicos',
          icon: Icons.medical_services,
          child: MedicalEventsFormSection(),
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildReproduccionTab() {
    return ListView(
      key: const PageStorageKey('reproduccion_tab'),
      padding: const EdgeInsets.all(16),
      children: [
        const FormSectionCard(
          title: 'Estado Reproductivo',
          icon: Icons.child_care,
          child: ReproductionFormSection(),
        ),
        const SizedBox(height: 16),
        const FormSectionCard(
          title: 'Historial de Partos',
          icon: Icons.pregnant_woman,
          child: OffspringFormSection(),
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildProduccionTab() {
    return ListView(
      key: const PageStorageKey('produccion_tab'),
      padding: const EdgeInsets.all(16),
      children: [
        const ProductionFormSection(),
        const SizedBox(height: 80),
      ],
    );
  }





  Widget _buildUpdateButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: _actualizarAnimal,
          icon: const Icon(Icons.check_circle, size: 24),
          label: const Text(
            'Actualizar Animal',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: AppColors.success,
            foregroundColor: AppColors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
          ),
        ),
      ),
    );
  }

  Future<void> _actualizarAnimal() async {
    // Validar el formulario
    if (!(_formKey.currentState?.validate() ?? false)) {
      _mostrarMensaje('Por favor complete todos los campos requeridos', esError: true);
      _navegarATab(0); // Volver al tab General
      return;
    }

    // Validaciones adicionales del controlador
    if (!_formController.isFormValid) {
      if (!_formController.sinigaIsValid) {
        _mostrarMensaje('El ID SINIGA no es válido', esError: true);
        _navegarATab(0);
      } else if (_formController.nfcId == null || _formController.nfcId!.isEmpty) {
        _mostrarMensaje('Debe leer el chip NFC', esError: true);
        _navegarATab(0);
      }
      return;
    }

    try {
      // Obtener el servicio Isar
      if (!mounted) return;
      final isarService = RepositoryProvider.of<IsarService>(context);

      // Construir el objeto Animal actualizado desde el controlador
      final animalActualizado = _formController.buildAnimal();

      // PASO 1: Guardar el animal actualizado primero
      await isarService.guardarAnimal(animalActualizado);

      // PASO 2: Guardar registros relacionados y actualizar campos calculados
      final saveHelper = AnimalSaveHelper(
        isarService: isarService,
        formController: _formController,
      );
      await saveHelper.guardarRegistrosRelacionados(animalActualizado);

      // Resetear flag de cambios antes de mostrar el diálogo
      if (mounted) {
        setState(() {
          _hasUnsavedChanges = false;
        });

        // Mostrar diálogo de éxito
        await _mostrarDialogoExito();

        // Regresar a la pantalla anterior con el animal actualizado
        // La pantalla de detalles recargará automáticamente los datos
        if (mounted) {
          Navigator.pop(context, animalActualizado);
        }
      }
    } catch (e) {
      if (mounted) {
        _mostrarMensaje('Error al actualizar: $e', esError: true);
      }
    }
  }

  /// Muestra un diálogo de éxito que se cierra automáticamente
  Future<void> _mostrarDialogoExito() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        // Auto-cerrar el diálogo después de 1.5 segundos
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (dialogContext.mounted) {
            Navigator.of(dialogContext).pop();
          }
        });

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: AppColors.success,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '¡Animal Actualizado!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Los cambios se guardaron correctamente',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _mostrarMensaje(String mensaje, {required bool esError}) {
    if (!mounted) return;
    final scaffoldMessenger = ScaffoldMessenger.maybeOf(context);
    if (scaffoldMessenger == null) return;
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              esError ? Icons.error : Icons.check_circle,
              color: AppColors.surface,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(mensaje)),
          ],
        ),
        backgroundColor: esError ? AppColors.error : AppColors.success,
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TabItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 48,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}
