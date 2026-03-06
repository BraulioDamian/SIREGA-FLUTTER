import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/nucleo/modelos/evento_sanitario_model.dart';
import 'package:sirega_app/nucleo/modelos/produccion_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
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

  // Estado del tutorial de swipe
  bool _mostrarTutorialSwipe = true;

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

    // Ocultar tutorial de swipe después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _mostrarTutorialSwipe = false;
        });
      }
    });
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
      _hasUnsavedChanges = true;
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.surface, width: 3),
                  ),
                ),
                child: Row(
                  children: [
                    _buildDynamicTab(0, 'General', Icons.info),
                    _buildDynamicTab(1, 'Salud', Icons.favorite),
                    _buildDynamicTab(2, 'Reproducción', Icons.child_care),
                    _buildDynamicTab(3, 'Producción', Icons.show_chart),
                  ],
                ),
              ),
            ),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                // Indicador de progreso
                _buildProgressIndicator(),

                // Contenido de los tabs con indicador de swipe
                Expanded(
                  child: Stack(
                    children: [
                      TabBarView(
                        controller: _tabController,
                        children: [
                          _buildGeneralTab(),
                          _buildSaludTab(),
                          _buildReproduccionTab(),
                          _buildProduccionTab(),
                        ],
                      ),
                      // Indicador de swipe a la derecha (solo en primeros 3 tabs)
                      if (_tabController.index < 3)
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 80,
                          child: AnimatedOpacity(
                            opacity: _mostrarTutorialSwipe ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 500),
                            child: _buildSwipeIndicator(),
                          ),
                        ),
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

  /// Widget de tab dinámico con efecto acordeón sincronizado con el swipe
  Widget _buildDynamicTab(int index, String label, IconData icon) {
    return AnimatedBuilder(
      animation: _tabController.animation!,
      builder: (context, child) {
        // Calcular qué tan "activo" está este tab basado en la animación
        final animationValue = _tabController.animation!.value;
        final distance = (animationValue - index).abs();
        final activation = (1.0 - distance.clamp(0.0, 1.0));

        // Usar flex con números más grandes para transiciones más suaves
        final flexValue = (100 + (activation * 200)).round();

        return Expanded(
          flex: flexValue,
          child: GestureDetector(
            onTap: () {
              if (mounted && _tabController.index != index) {
                _tabController.animateTo(index);
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
              padding: EdgeInsets.symmetric(
                horizontal: 8 + (activation * 4),
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.surface.withValues(alpha: activation * 0.1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: activation > 0.3
                    ? [
                        BoxShadow(
                          color: AppColors.textPrimary.withValues(alpha: activation * 0.1),
                          blurRadius: 4 * activation,
                          offset: Offset(0, 2 * activation),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 1.0 + (activation * 0.1),
                    child: Icon(
                      icon,
                      size: 22,
                      color: Color.lerp(
                        AppColors.surface.withValues(alpha: 0.7),
                        AppColors.surface,
                        activation,
                      ),
                    ),
                  ),
                  ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: activation,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Opacity(
                          opacity: activation,
                          child: Text(
                            label,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.surface,
                            ),
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionCard(
          'Foto del Animal',
          Icons.image,
          const ImagePickerSection(),
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Identificación SINIGA',
          Icons.tag,
          const SinigaFormSection(),
          isRequired: true,
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Información Básica',
          Icons.pets,
          const BasicInfoFormSection(),
          isRequired: true,
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Información Adicional',
          Icons.description,
          const AdditionalFieldsFormSection(),
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Chip NFC',
          Icons.nfc,
          const NfcSection(),
          isRequired: true,
        ),
        const SizedBox(height: 80), // Espacio para los botones
      ],
    );
  }

  Widget _buildSaludTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          'Actualice el estado de salud, vacunas y eventos médicos del animal.',
          AppColors.info,
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Estado de Salud',
          Icons.favorite,
          const HealthFormSection(),
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Vacunas',
          Icons.vaccines,
          const VaccinesFormSection(),
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Eventos Médicos',
          Icons.medical_services,
          const MedicalEventsFormSection(),
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildReproduccionTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          'Actualice el estado reproductivo e historial de partos del animal.',
          AppColors.secondary,
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Estado Reproductivo',
          Icons.child_care,
          const ReproductionFormSection(),
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Historial de Partos',
          Icons.pregnant_woman,
          const OffspringFormSection(),
        ),
        const SizedBox(height: 16),

        _buildSectionCard(
          'Ubicación',
          Icons.location_on,
          const LocationFormSection(),
        ),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildProduccionTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoBanner(
          'Actualice los datos de peso y producción del animal.',
          AppColors.warning,
        ),
        const SizedBox(height: 16),

        const ProductionFormSection(),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildInfoBanner(String message, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.06),
            color.withValues(alpha: 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.info_rounded,
              color: color,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                message,
                style: TextStyle(
                  color: color.withValues(alpha: 0.9),
                  fontSize: 13,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, IconData icon, Widget child, {bool isRequired = false}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isRequired)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Requerido',
                      style: TextStyle(
                        color: AppColors.warning,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSwipeIndicator() {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          bottomLeft: Radius.circular(60),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.swipe,
            color: Theme.of(context).primaryColor,
            size: 60,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            width: 120,
            child: ClipRect(
              child: _SwipeAnimation(
                primaryColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Desliza\npara\ncontinuar',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
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

      // PASO 2: Guardar los registros relacionados
      // Guardar vacunas como eventos sanitarios
      await _guardarVacunas(isarService, animalActualizado);

      // Guardar eventos médicos
      await _guardarEventosMedicos(isarService, animalActualizado);

      // Guardar historial de partos
      await _guardarHistorialPartos(isarService, animalActualizado);

      // Guardar pesajes
      await _guardarPesajes(isarService, animalActualizado);

      // Guardar producción de leche
      await _guardarProduccionLeche(isarService, animalActualizado);

      // PASO 3: Actualizar campos calculados del animal basados en los registros
      await _actualizarCamposCalculados(isarService, animalActualizado);

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

  /// Guarda las vacunas como eventos sanitarios en la base de datos
  Future<void> _guardarVacunas(IsarService isarService, dynamic animal) async {
    for (final nombreVacuna in _formController.vacunasAplicadas) {
      final evento = EventoSanitario()
        ..tipo = TipoEvento.vacuna
        ..fecha = _formController.fechasVacunas[nombreVacuna] ?? DateTime.now()
        ..nombreProducto = nombreVacuna
        ..notas = null
        ..prioridad = Prioridad.media;

      await isarService.guardarEvento(evento, animal);
    }
  }

  /// Guarda los eventos médicos en la base de datos
  Future<void> _guardarEventosMedicos(IsarService isarService, dynamic animal) async {
    for (final eventoData in _formController.eventosMedicos) {
      final tipoStr = eventoData['tipo'] as String;

      // Convertir el string del tipo a enum
      TipoEvento tipo;
      switch (tipoStr) {
        case 'desparasitacion':
          tipo = TipoEvento.desparasitante;
          break;
        case 'tratamiento':
          tipo = TipoEvento.tratamiento;
          break;
        case 'diagnostico':
          tipo = TipoEvento.revisionVeterinaria;
          break;
        case 'cirugia':
          tipo = TipoEvento.castracion; // Usamos castracion como proxy para cirugía
          break;
        default:
          tipo = TipoEvento.tratamiento;
      }

      final evento = EventoSanitario()
        ..tipo = tipo
        ..fecha = eventoData['fecha'] as DateTime
        ..nombreProducto = eventoData['producto'] as String
        ..notas = eventoData['notas'] as String?
        ..prioridad = Prioridad.media;

      await isarService.guardarEvento(evento, animal);
    }
  }

  /// Guarda el historial de partos como registros de producción
  Future<void> _guardarHistorialPartos(IsarService isarService, dynamic animal) async {
    for (final partoData in _formController.registrosPartos) {
      final sexoCria = partoData['sexoCria'] as Sexo?;
      final notasOriginales = partoData['notas'] as String?;

      // Construir notas incluyendo el sexo si existe
      String? notasCompletas = notasOriginales;
      if (sexoCria != null) {
        final sexoStr = sexoCria == Sexo.macho ? 'Macho' : 'Hembra';
        notasCompletas = notasOriginales != null
            ? 'Sexo: $sexoStr. $notasOriginales'
            : 'Sexo: $sexoStr';
      }

      final registro = RegistroProduccion()
        ..tipo = 'Parto'
        ..fecha = partoData['fecha'] as DateTime
        ..idCria = partoData['idCria'] as String?
        ..pesoKg = partoData['pesoKg'] as double?
        ..notas = notasCompletas;

      await isarService.guardarRegistroProduccion(registro, animal);
    }
  }

  /// Guarda los pesajes como registros de producción
  Future<void> _guardarPesajes(IsarService isarService, dynamic animal) async {
    for (final pesajeData in _formController.registrosPesajes) {
      final registro = RegistroProduccion()
        ..tipo = 'Pesaje'
        ..fecha = pesajeData['fecha'] as DateTime
        ..pesoKg = pesajeData['peso'] as double
        ..notas = pesajeData['notas'] as String?;

      await isarService.guardarRegistroProduccion(registro, animal);
    }
  }

  /// Guarda la producción de leche como registros de producción
  Future<void> _guardarProduccionLeche(IsarService isarService, dynamic animal) async {
    for (final produccionData in _formController.registrosProduccionLeche) {
      final registro = RegistroProduccion()
        ..tipo = 'Producción de Leche'
        ..fecha = produccionData['fecha'] as DateTime
        ..litrosPorDia = produccionData['litros'] as double
        ..notas = produccionData['notas'] as String?;

      await isarService.guardarRegistroProduccion(registro, animal);
    }
  }

  /// Actualiza los campos calculados del animal basados en los registros de producción
  Future<void> _actualizarCamposCalculados(IsarService isarService, Animal animal) async {
    // Obtener todos los registros de producción del animal
    final registros = await isarService.obtenerProduccionPorAnimal(animal.id);

    // Filtrar pesajes y producción de leche
    final pesajes = registros.where((r) => r.tipo == 'Pesaje').toList();
    final produccionLeche = registros.where((r) => r.tipo == 'Producción de Leche').toList();

    // Actualizar último pesaje
    if (pesajes.isNotEmpty) {
      // Ordenar por fecha descendente para obtener el más reciente
      pesajes.sort((a, b) => b.fecha.compareTo(a.fecha));
      final ultimoPesaje = pesajes.first;

      animal.pesoActual = ultimoPesaje.pesoKg;
      animal.fechaUltimoPesaje = ultimoPesaje.fecha;
    }

    // Calcular promedio de leche diario y total
    if (produccionLeche.isNotEmpty) {
      double totalLeche = 0;
      for (final registro in produccionLeche) {
        totalLeche += registro.litrosPorDia ?? 0;
      }

      animal.produccionLecheTotal = totalLeche;
      animal.promedioLecheDiario = totalLeche / produccionLeche.length;
    }

    // Actualizar número de partos
    final partos = registros.where((r) => r.tipo == 'Parto').toList();
    if (partos.isNotEmpty) {
      animal.numeroPartos = partos.length;

      // Actualizar fecha último parto
      partos.sort((a, b) => b.fecha.compareTo(a.fecha));
      animal.fechaUltimoParto = partos.first.fecha;
    }

    // Guardar el animal con los campos actualizados
    await isarService.guardarAnimal(animal);
  }

  void _mostrarMensaje(String mensaje, {required bool esError}) {
    if (!mounted) return;

    try {
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
    } catch (e) {
      debugPrint('No se pudo mostrar mensaje: $mensaje');
    }
  }
}

/// Widget separado para la animación de swipe
/// Maneja su propio lifecycle para evitar problemas con el widget padre
class _SwipeAnimation extends StatefulWidget {
  final Color primaryColor;

  const _SwipeAnimation({required this.primaryColor});

  @override
  State<_SwipeAnimation> createState() => _SwipeAnimationState();
}

class _SwipeAnimationState extends State<_SwipeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final double offsetX = 12 - (_animation.value * 24);
        return Transform.translate(
          offset: Offset(offsetX, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chevron_left,
                color: widget.primaryColor,
                size: 38,
              ),
              Icon(
                Icons.chevron_left,
                color: widget.primaryColor.withValues(alpha: 0.7),
                size: 38,
              ),
              Icon(
                Icons.chevron_left,
                color: widget.primaryColor.withValues(alpha: 0.5),
                size: 38,
              ),
            ],
          ),
        );
      },
    );
  }
}
