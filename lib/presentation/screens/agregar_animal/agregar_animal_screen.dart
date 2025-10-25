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

  // Estado del tutorial de swipe
  bool _mostrarTutorialSwipe = true;

  @override
  void initState() {
    super.initState();
    _formController = AnimalFormController(isEditMode: false);
    _tabController = TabController(length: 4, vsync: this);

    // Escuchar cambios del controlador para actualizar badges
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
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text(
            'Registrar Vacuno',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 3),
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

              // Solo botón de registrar
              _buildRegisterButton(),
            ],
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
                color: Colors.white.withAlpha((activation * 26).round()),
                borderRadius: BorderRadius.circular(8),
                boxShadow: activation > 0.3
                    ? [
                        BoxShadow(
                          color: Colors.black.withAlpha((activation * 20).round()),
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
                        Colors.white.withAlpha(179),
                        Colors.white,
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
                              color: Colors.white,
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
        color: _generalCompleto ? Colors.green.withAlpha(13) : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: _generalCompleto
                ? Colors.green.withAlpha(51)
                : Colors.grey.withAlpha(26),
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
              color: _generalCompleto ? Colors.green : Colors.grey[600],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: 12,
                color: _generalCompleto ? Colors.green.shade700 : Colors.grey[700],
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
          'Registre el estado de salud, vacunas y eventos médicos del animal. Esta información es opcional.',
          Colors.blue,
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
          'Registre el estado reproductivo e historial de partos del animal. Esta información es opcional.',
          Colors.pink,
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
          'Registre el peso inicial del animal. Los datos de producción láctea se agregarán mediante eventos.',
          Colors.orange,
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
            color.withAlpha(15),
            color.withAlpha(25),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withAlpha(40),
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withAlpha(30),
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
                  color: color.withAlpha(230),
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
                    color: Theme.of(context).primaryColor.withAlpha(26), // withOpacity(0.1)
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
                      color: Colors.orange.withAlpha(26), // withOpacity(0.1)
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Requerido',
                      style: TextStyle(
                        color: Colors.orange,
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
        color: Theme.of(context).primaryColor.withAlpha(38),
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

  Widget _buildRegisterButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13), // withOpacity(0.05)
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
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
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
      final existente = await isarService.obtenerAnimalPorNfc(_formController.nfcId!);
      if (existente != null) {
        _mostrarMensaje('Ya existe un animal con ese chip NFC', esError: true);
        return;
      }

      // Construir el objeto Animal desde el controlador
      final nuevoAnimal = _formController.buildAnimal();

      // Guardar en la base de datos
      await isarService.guardarAnimal(nuevoAnimal);

      // Guardar vacunas como eventos sanitarios
      await _guardarVacunas(isarService, nuevoAnimal);

      // Guardar eventos médicos
      await _guardarEventosMedicos(isarService, nuevoAnimal);

      // Guardar historial de partos
      await _guardarHistorialPartos(isarService, nuevoAnimal);

      // Guardar pesajes
      await _guardarPesajes(isarService, nuevoAnimal);

      // Guardar producción de leche
      await _guardarProduccionLeche(isarService, nuevoAnimal);

      // Actualizar campos calculados del animal basados en los registros
      await _actualizarCamposCalculados(isarService, nuevoAnimal);

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
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(mensaje)),
            ],
          ),
          backgroundColor: esError ? Colors.red : Colors.green,
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
                color: widget.primaryColor.withAlpha(179),
                size: 38,
              ),
              Icon(
                Icons.chevron_left,
                color: widget.primaryColor.withAlpha(128),
                size: 38,
              ),
            ],
          ),
        );
      },
    );
  }
}
