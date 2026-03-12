import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/presentation/forms/animal_form/controllers/animal_form_controller.dart';
import 'package:sirega_app/presentation/forms/animal_form/widgets/form_section_card.dart';
import 'package:sirega_app/presentation/forms/animal_form/helpers/animal_save_helper.dart';
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
import 'package:provider/provider.dart';

/// Pantalla mejorada para agregar un nuevo animal
/// Organizada en tabs similar a la pantalla de detalle
class AgregarAnimalScreen extends StatefulWidget {
  const AgregarAnimalScreen({super.key});

  @override
  State<AgregarAnimalScreen> createState() => _AgregarAnimalScreenState();
}

class _AgregarAnimalScreenState extends State<AgregarAnimalScreen>
    with SingleTickerProviderStateMixin {
  late AnimalFormController _formController;
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  // Estado de validación por tab
  bool _generalCompleto = false;

  @override
  void initState() {
    super.initState();
    _formController = AnimalFormController(isEditMode: false);
    _tabController = TabController(length: 4, vsync: this);

    // Escuchar cambios del controlador para actualizar badges
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider.value(
      value: _formController,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(
            'Registrar Vacuno',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.surface,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: theme.primaryColor,
          foregroundColor: AppColors.surface,
          iconTheme: const IconThemeData(color: AppColors.surface),
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

              // Solo botón de registrar
              _buildRegisterButton(),
            ],
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
        color: _generalCompleto ? AppColors.success.withAlpha(13) : AppColors.surface,
        border: Border(
          bottom: BorderSide(
            color: _generalCompleto
                ? AppColors.success.withAlpha(51)
                : AppColors.border.withAlpha(26),
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



  Widget _buildRegisterButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withAlpha(13),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: _guardarAnimal,
          icon: const Icon(Icons.check_circle, size: 24),
          label: const Text(
            'Registrar Animal',
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

  Future<void> _guardarAnimal() async {
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
      final isarService = RepositoryProvider.of<IsarService>(context);

      // Verificar si ya existe un animal con ese NFC
      final existente = await isarService.getAnimalByNfc(_formController.nfcId!);
      if (existente != null) {
        _mostrarMensaje('Ya existe un animal con ese chip NFC', esError: true);
        return;
      }

      // Construir el objeto Animal desde el controlador
      final nuevoAnimal = _formController.buildAnimal();

      // Guardar en la base de datos
      await isarService.saveAnimal(nuevoAnimal);

      // Guardar registros relacionados y actualizar campos calculados
      final saveHelper = AnimalSaveHelper(
        isarService: isarService,
        formController: _formController,
      );
      await saveHelper.saveRelatedRecords(nuevoAnimal);

      if (mounted) {
        _mostrarMensaje('Animal registrado exitosamente', esError: false);
        // Regresar a la pantalla anterior con resultado exitoso
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        _mostrarMensaje('Error al guardar: $e', esError: true);
      }
    }
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
