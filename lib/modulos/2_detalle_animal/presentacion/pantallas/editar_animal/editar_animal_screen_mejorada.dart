import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/pantallas/editar_animal/widgets/custom_dropdown.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/pantallas/editar_animal/widgets/custom_text_field.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/pantallas/editar_animal/widgets/edit_form_section.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/pantallas/editar_animal/widgets/tab_progress_indicator.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

class EditarAnimalScreen extends StatefulWidget {
  final Animal animal;

  const EditarAnimalScreen({super.key, required this.animal});

  @override
  State<EditarAnimalScreen> createState() => _EditarAnimalScreenState();
}

class _EditarAnimalScreenState extends State<EditarAnimalScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final _formKey = GlobalKey<FormState>();
  
  // Controllers para Información Básica
  late TextEditingController _nombreController;
  late TextEditingController _idAreteVisualController;
  late TextEditingController _idAreteNFCController;
  late TextEditingController _numeroHerradoController;
  late TextEditingController _razaController;
  late TextEditingController _colorPelajeController;
  late TextEditingController _senasParticularesController;
  
  // Controllers para Peso
  late TextEditingController _pesoNacimientoController;
  late TextEditingController _pesoActualController;
  
  // Controllers para Ubicación
  late TextEditingController _zonaActualController;
  
  // Controllers para SINIGA
  late TextEditingController _sinigaEspecieController;
  late TextEditingController _sinigaEstadoClaveController;
  late TextEditingController _sinigaNumeroNacionalController;

  // Valores de estado
  late Sexo _sexoSeleccionado;
  late EstadoAnimal _estadoSeleccionado;
  late EstadoSalud _estadoSaludSeleccionado;
  late DateTime _fechaNacimiento;
  EstadoReproductivo? _estadoReproductivo;
  File? _nuevaFotoPerfil;
  bool _gestante = false;
  bool _isLoading = false;
  bool _hasUnsavedChanges = false;
  
  // Validación por tab
  final Map<int, bool> _tabValidation = {
    0: true,  // General
    1: true,  // Salud
    2: true,  // Reproducción
    3: true,  // Ubicación
  };

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _loadAnimalData();
    _setupAnimations();
  }

  void _initializeControllers() {
    _tabController = TabController(length: 4, vsync: this);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();

    // Información Básica
    _nombreController = TextEditingController();
    _idAreteVisualController = TextEditingController();
    _idAreteNFCController = TextEditingController();
    _numeroHerradoController = TextEditingController();
    _razaController = TextEditingController();
    _colorPelajeController = TextEditingController();
    _senasParticularesController = TextEditingController();
    
    // Peso
    _pesoNacimientoController = TextEditingController();
    _pesoActualController = TextEditingController();
    
    // Ubicación
    _zonaActualController = TextEditingController();
    
    // SINIGA
    _sinigaEspecieController = TextEditingController();
    _sinigaEstadoClaveController = TextEditingController();
    _sinigaNumeroNacionalController = TextEditingController();
  }

  void _loadAnimalData() {
    final animal = widget.animal;
    
    // Cargar datos básicos
    _nombreController.text = animal.nombre;
    _idAreteVisualController.text = animal.idAreteVisual ?? '';
    _idAreteNFCController.text = animal.idAreteNFC ?? '';
    _numeroHerradoController.text = animal.numeroHerrado ?? '';
    _razaController.text = animal.raza;
    _colorPelajeController.text = animal.colorPelaje ?? '';
    _senasParticularesController.text = animal.senasParticulares ?? '';
    
    // Cargar peso
    _pesoNacimientoController.text = animal.pesoNacimiento?.toString() ?? '';
    _pesoActualController.text = animal.pesoActual?.toString() ?? '';
    
    // Cargar ubicación
    _zonaActualController.text = animal.zonaActual ?? '';
    
    // Cargar SINIGA
    if (animal.siniigaId != null) {
      _sinigaEspecieController.text = animal.siniigaId!.especie ?? '';
      _sinigaEstadoClaveController.text = animal.siniigaId!.estadoClave ?? '';
      _sinigaNumeroNacionalController.text = animal.siniigaId!.numeroNacional ?? '';
    }

    // Cargar estados
    _sexoSeleccionado = animal.sexo;
    _estadoSeleccionado = animal.estado;
    _estadoSaludSeleccionado = animal.estadoSalud;
    _fechaNacimiento = animal.fechaNacimiento;
    _estadoReproductivo = animal.estadoReproductivo;
    _gestante = animal.gestante;

    _addChangeListeners();
  }

  void _addChangeListeners() {
    final controllers = [
      _nombreController,
      _idAreteVisualController,
      _idAreteNFCController,
      _numeroHerradoController,
      _razaController,
      _colorPelajeController,
      _senasParticularesController,
      _pesoNacimientoController,
      _pesoActualController,
      _zonaActualController,
      _sinigaEspecieController,
      _sinigaEstadoClaveController,
      _sinigaNumeroNacionalController,
    ];
    
    for (var controller in controllers) {
      controller.addListener(_onFieldChanged);
    }
  }

  void _onFieldChanged() {
    if (!_hasUnsavedChanges) {
      setState(() {
        _hasUnsavedChanges = true;
      });
    }
  }

  void _setupAnimations() {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        HapticFeedback.selectionClick();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    
    // Dispose controllers
    _nombreController.dispose();
    _idAreteVisualController.dispose();
    _idAreteNFCController.dispose();
    _numeroHerradoController.dispose();
    _razaController.dispose();
    _colorPelajeController.dispose();
    _senasParticularesController.dispose();
    _pesoNacimientoController.dispose();
    _pesoActualController.dispose();
    _zonaActualController.dispose();
    _sinigaEspecieController.dispose();
    _sinigaEstadoClaveController.dispose();
    _sinigaNumeroNacionalController.dispose();
    
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaNacimiento,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      locale: const Locale('es', 'MX'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != _fechaNacimiento) {
      setState(() {
        _fechaNacimiento = picked;
        _hasUnsavedChanges = true;
      });
      HapticFeedback.mediumImpact();
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Seleccionar foto',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.camera_alt, color: Colors.blue),
                ),
                title: const Text('Tomar foto'),
                subtitle: const Text('Usar cámara'),
                onTap: () {
                  Navigator.pop(context, ImageSource.camera);
                  HapticFeedback.selectionClick();
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.photo_library, color: Colors.green),
                ),
                title: const Text('Seleccionar de galería'),
                subtitle: const Text('Elegir foto existente'),
                onTap: () {
                  Navigator.pop(context, ImageSource.gallery);
                  HapticFeedback.selectionClick();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );

    if (source == null) return;

    final XFile? image = await picker.pickImage(
      source: source,
      maxHeight: 1024,
      maxWidth: 1024,
      imageQuality: 85,
    );

    if (image != null) {
      setState(() {
        _nuevaFotoPerfil = File(image.path);
        _hasUnsavedChanges = true;
      });
      HapticFeedback.mediumImpact();
    }
  }

  bool _validateCurrentTab() {
    final currentIndex = _tabController.index;
    
    // Validar según el tab actual
    if (currentIndex == 0) {
      // Tab General: validar campos requeridos
      return _nombreController.text.isNotEmpty && _razaController.text.isNotEmpty;
    }
    
    return true;
  }

  void _nextTab() {
    if (_tabController.index < _tabController.length - 1) {
      if (_validateCurrentTab()) {
        _tabController.animateTo(_tabController.index + 1);
        HapticFeedback.selectionClick();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Completa los campos requeridos antes de continuar'),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
    }
  }

  void _previousTab() {
    if (_tabController.index > 0) {
      _tabController.animateTo(_tabController.index - 1);
      HapticFeedback.selectionClick();
    }
  }

  Future<void> _saveChanges() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Por favor corrige los errores en el formulario'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final animalActualizado = widget.animal
        ..nombre = _nombreController.text
        ..idAreteVisual = _idAreteVisualController.text.isEmpty ? null : _idAreteVisualController.text
        ..idAreteNFC = _idAreteNFCController.text.isEmpty ? null : _idAreteNFCController.text
        ..numeroHerrado = _numeroHerradoController.text.isEmpty ? null : _numeroHerradoController.text
        ..raza = _razaController.text
        ..colorPelaje = _colorPelajeController.text.isEmpty ? null : _colorPelajeController.text
        ..senasParticulares = _senasParticularesController.text.isEmpty ? null : _senasParticularesController.text
        ..pesoNacimiento = double.tryParse(_pesoNacimientoController.text)
        ..pesoActual = double.tryParse(_pesoActualController.text)
        ..zonaActual = _zonaActualController.text.isEmpty ? null : _zonaActualController.text
        ..sexo = _sexoSeleccionado
        ..estado = _estadoSeleccionado
        ..estadoSalud = _estadoSaludSeleccionado
        ..fechaNacimiento = _fechaNacimiento
        ..estadoReproductivo = _estadoReproductivo
        ..gestante = _gestante;

      // TODO: Manejar la subida de la nueva foto si existe
      // TODO: Guardar datos de SINIGA

      if (!mounted) return;
      context.read<CattleDetailBloc>().add(UpdateAnimal(animalActualizado));

      HapticFeedback.heavyImpact();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text('Animal actualizado correctamente'),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(seconds: 2),
        ),
      );

      Navigator.pop(context, animalActualizado);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text('Error al actualizar: $e')),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<bool> _onWillPop() async {
    if (!_hasUnsavedChanges) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: const [
            Icon(Icons.warning_amber_rounded, color: Colors.orange),
            SizedBox(width: 12),
            Text('¿Descartar cambios?'),
          ],
        ),
        content: const Text(
          'Tienes cambios sin guardar. ¿Estás seguro de que quieres salir?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
              HapticFeedback.mediumImpact();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
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
    return PopScope(
      canPop: !_hasUnsavedChanges,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: _buildAppBar(),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TabProgressIndicator(
                  currentTab: _tabController.index,
                  totalTabs: 4,
                  tabNames: const ['General', 'Salud', 'Reproducción', 'Ubicación'],
                  tabIcons: const [
                    Icons.pets,
                    Icons.favorite,
                    Icons.child_care,
                    Icons.location_on,
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildGeneralTab(),
                      _buildHealthTab(),
                      _buildReproductionTab(),
                      _buildLocationTab(),
                    ],
                  ),
                ),
                _buildBottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Editar Animal',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            widget.animal.nombre,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
          ),
        ],
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        onPressed: () async {
          if (_hasUnsavedChanges) {
            final shouldPop = await _onWillPop();
            if (shouldPop && mounted) {
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange.shade700,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.edit, size: 14, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    'Sin guardar',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Botón Anterior
            if (_tabController.index > 0)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _previousTab,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Anterior'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            
            if (_tabController.index > 0) const SizedBox(width: 12),
            
            // Botón Siguiente o Guardar
            Expanded(
              flex: _tabController.index == 0 ? 1 : 1,
              child: _tabController.index < 3
                  ? ElevatedButton.icon(
                      onPressed: _nextTab,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Siguiente'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  : ElevatedButton.icon(
                      onPressed: _hasUnsavedChanges && !_isLoading ? _saveChanges : null,
                      icon: _isLoading
                          ? Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(2.0),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(Icons.save),
                      label: Text(_isLoading ? 'Guardando...' : 'Guardar'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: _hasUnsavedChanges
                            ? Colors.green
                            : Colors.grey.shade400,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // Los widgets de tabs se mantienen en la siguiente parte...
  
  Widget _buildGeneralTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Foto de perfil
          Center(
            child: Stack(
              children: [
                Hero(
                  tag: 'animal_photo_${widget.animal.id}',
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: _nuevaFotoPerfil != null
                          ? FileImage(_nuevaFotoPerfil!)
                          : (widget.animal.fotoPerfilUrl != null && widget.animal.fotoPerfilUrl!.isNotEmpty
                              ? FileImage(File(widget.animal.fotoPerfilUrl!))
                              : null) as ImageProvider?,
                      child: (_nuevaFotoPerfil == null && widget.animal.fotoPerfilUrl == null)
                          ? Icon(Icons.pets, size: 60, color: Colors.grey[600])
                          : null,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Material(
                    elevation: 4,
                    shape: const CircleBorder(),
                    color: Theme.of(context).primaryColor,
                    child: InkWell(
                      onTap: _pickImage,
                      customBorder: const CircleBorder(),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Información Básica
          EditFormSection(
            title: 'Información Básica',
            icon: Icons.info_outline,
            children: [
              CustomTextField(
                controller: _nombreController,
                label: 'Nombre *',
                icon: Icons.pets,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es requerido';
                  }
                  if (value.length < 2) {
                    return 'El nombre debe tener al menos 2 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _idAreteVisualController,
                      label: 'Arete Visual',
                      icon: Icons.tag,
                      helperText: 'Identificador visual',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      controller: _idAreteNFCController,
                      label: 'Arete NFC',
                      icon: Icons.nfc,
                      readOnly: true,
                      enabled: false,
                      helperText: 'Escaneado por NFC',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _numeroHerradoController,
                label: 'Número de Herrado',
                icon: Icons.format_list_numbered,
                helperText: 'Número de identificación del herrado',
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Características Físicas
          EditFormSection(
            title: 'Características Físicas',
            icon: Icons.category,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomDropdown<Sexo>(
                      value: _sexoSeleccionado,
                      label: 'Sexo *',
                      icon: Icons.wc,
                      items: Sexo.values,
                      getDisplayName: (sexo) => sexo.name[0].toUpperCase() + sexo.name.substring(1),
                      getIcon: (sexo) => sexo == Sexo.macho ? Icons.male : Icons.female,
                      getColor: (sexo) => sexo == Sexo.macho ? Colors.blue : Colors.pink,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _sexoSeleccionado = value;
                            _hasUnsavedChanges = true;
                            if (value == Sexo.macho) {
                              _estadoReproductivo = null;
                              _gestante = false;
                            }
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      controller: _razaController,
                      label: 'Raza *',
                      icon: Icons.pets,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'La raza es requerida';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _selectDate(context),
                borderRadius: BorderRadius.circular(12),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Fecha de Nacimiento *',
                    prefixIcon: Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_fechaNacimiento.day.toString().padLeft(2, '0')}/${_fechaNacimiento.month.toString().padLeft(2, '0')}/${_fechaNacimiento.year}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.edit_calendar, color: Theme.of(context).primaryColor, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _colorPelajeController,
                label: 'Color del Pelaje',
                icon: Icons.palette,
                helperText: 'Ej: Negro, Café, Blanco, Pinto',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _senasParticularesController,
                label: 'Señas Particulares',
                icon: Icons.info_outline,
                maxLines: 3,
                helperText: 'Marcas, cicatrices, o características únicas',
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Peso
          EditFormSection(
            title: 'Información de Peso',
            icon: Icons.monitor_weight,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _pesoNacimientoController,
                      label: 'Peso al Nacer',
                      icon: Icons.scale,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      suffixText: 'kg',
                      helperText: 'Peso inicial',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      controller: _pesoActualController,
                      label: 'Peso Actual',
                      icon: Icons.monitor_weight,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      suffixText: 'kg',
                      helperText: 'Peso más reciente',
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 80), // Espacio para el botón flotante
        ],
      ),
    );
  }

  Widget _buildHealthTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          EditFormSection(
            title: 'Estado de Salud',
            icon: Icons.favorite,
            children: [
              CustomDropdown<EstadoSalud>(
                value: _estadoSaludSeleccionado,
                label: 'Estado de Salud',
                icon: Icons.health_and_safety,
                items: EstadoSalud.values,
                getDisplayName: (estado) => estado.name[0].toUpperCase() + estado.name.substring(1),
                getIcon: _getHealthIcon,
                getColor: _getHealthColor,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _estadoSaludSeleccionado = value;
                      _hasUnsavedChanges = true;
                    });
                    HapticFeedback.selectionClick();
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomDropdown<EstadoAnimal>(
                value: _estadoSeleccionado,
                label: 'Estado del Animal',
                icon: Icons.pets,
                items: EstadoAnimal.values,
                getDisplayName: (estado) => estado.name[0].toUpperCase() + estado.name.substring(1),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _estadoSeleccionado = value;
                      _hasUnsavedChanges = true;
                    });
                    HapticFeedback.selectionClick();
                  }
                },
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Información adicional de salud
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Los eventos sanitarios y vacunas se gestionan en la sección de Eventos del animal',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildReproductionTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (_sexoSeleccionado == Sexo.hembra) ...[
            EditFormSection(
              title: 'Estado Reproductivo',
              icon: Icons.pregnant_woman,
              children: [
                CustomDropdown<EstadoReproductivo>(
                  value: _estadoReproductivo,
                  label: 'Estado Reproductivo',
                  icon: Icons.child_care,
                  items: EstadoReproductivo.values,
                  getDisplayName: (estado) => estado.name[0].toUpperCase() + estado.name.substring(1),
                  onChanged: (value) {
                    setState(() {
                      _estadoReproductivo = value;
                      _hasUnsavedChanges = true;
                    });
                    HapticFeedback.selectionClick();
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: SwitchListTile(
                    title: const Text('Gestante'),
                    subtitle: const Text('Indica si el animal está en gestación'),
                    value: _gestante,
                    onChanged: (value) {
                      setState(() {
                        _gestante = value;
                        _hasUnsavedChanges = true;
                      });
                      HapticFeedback.selectionClick();
                    },
                    secondary: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _gestante ? Colors.green.shade50 : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.pregnant_woman,
                        color: _gestante ? Colors.green : Colors.grey,
                      ),
                    ),
                    activeThumbColor: Colors.green,
                  ),
                ),
              ],
            ),
          ] else ...[
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Información Reproductiva',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Esta sección solo aplica para animales hembra',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
          
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildLocationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          EditFormSection(
            title: 'Ubicación Actual',
            icon: Icons.location_on,
            children: [
              CustomTextField(
                controller: _zonaActualController,
                label: 'Zona / Potrero Actual',
                icon: Icons.map_outlined,
                helperText: 'Ej: Potrero A, Corral 1, Zona Norte',
              ),
              
              const SizedBox(height: 24),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.place, color: Colors.amber.shade700, size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Geolocalización',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber.shade900,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Próximamente: Podrás registrar la ubicación GPS del animal',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.amber.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Color _getHealthColor(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return Colors.green;
      case EstadoSalud.enfermo:
        return Colors.orange;
      case EstadoSalud.critico:
        return Colors.red;
      case EstadoSalud.convaleciente:
        return Colors.blue;
      case EstadoSalud.enTratamiento:
        return Colors.purple;
      case EstadoSalud.enObservacion:
        return Colors.grey;
    }
  }

  IconData _getHealthIcon(EstadoSalud estado) {
    switch (estado) {
      case EstadoSalud.sano:
        return Icons.check_circle;
      case EstadoSalud.enfermo:
        return Icons.sick;
      case EstadoSalud.critico:
        return Icons.warning_amber_rounded;
      case EstadoSalud.convaleciente:
        return Icons.health_and_safety;
      case EstadoSalud.enTratamiento:
        return Icons.medical_services;
      case EstadoSalud.enObservacion:
        return Icons.visibility;
    }
  }
}
