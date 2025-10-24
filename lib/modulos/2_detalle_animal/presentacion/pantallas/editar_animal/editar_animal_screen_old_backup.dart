import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentacion/pantallas/editar_animal/widgets/edit_form_section.dart';
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
  late AnimationController _saveButtonController;
  late Animation<double> _saveButtonScale;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nombreController;
  late TextEditingController _idAreteVisualController;
  late TextEditingController _idAreteNFCController;
  late TextEditingController _numeroHerradoController;
  late TextEditingController _razaController;
  late TextEditingController _colorPelajeController;
  late TextEditingController _senasParticularesController;
  late TextEditingController _pesoNacimientoController;
  late TextEditingController _pesoActualController;
  late TextEditingController _zonaActualController;

  late Sexo _sexoSeleccionado;
  late EstadoAnimal _estadoSeleccionado;
  late EstadoSalud _estadoSaludSeleccionado;
  late DateTime _fechaNacimiento;
  EstadoReproductivo? _estadoReproductivo;
  File? _nuevaFotoPerfil;
  bool _gestante = false;
  bool _isLoading = false;
  bool _hasUnsavedChanges = false;

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
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();

    _nombreController = TextEditingController();
    _idAreteVisualController = TextEditingController();
    _idAreteNFCController = TextEditingController();
    _numeroHerradoController = TextEditingController();
    _razaController = TextEditingController();
    _colorPelajeController = TextEditingController();
    _senasParticularesController = TextEditingController();
    _pesoNacimientoController = TextEditingController();
    _pesoActualController = TextEditingController();
    _zonaActualController = TextEditingController();
  }

  void _loadAnimalData() {
    final animal = widget.animal;
    _nombreController.text = animal.nombre;
    _idAreteVisualController.text = animal.idAreteVisual ?? '';
    _idAreteNFCController.text = animal.idAreteNFC ?? '';
    _numeroHerradoController.text = animal.numeroHerrado ?? '';
    _razaController.text = animal.raza;
    _colorPelajeController.text = animal.colorPelaje ?? '';
    _senasParticularesController.text = animal.senasParticulares ?? '';
    _pesoNacimientoController.text = animal.pesoNacimiento?.toString() ?? '';
    _pesoActualController.text = animal.pesoActual?.toString() ?? '';
    _zonaActualController.text = animal.zonaActual ?? '';

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
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
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
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaNacimiento,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
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
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
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
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blue),
              title: const Text('Tomar foto'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: const Text('Seleccionar de galería'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            const SizedBox(height: 20),
          ],
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
    }
  }

  Future<void> _saveChanges() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

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

      if (!mounted) return;
      context.read<CattleDetailBloc>().add(UpdateAnimal(animalActualizado));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Animal actualizado correctamente'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );

      Navigator.pop(context, animalActualizado);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al actualizar: $e'),
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
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
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
                _buildTabBar(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
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
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        if (_hasUnsavedChanges)
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Sin guardar',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor: Theme.of(context).primaryColor,
        indicatorWeight: 3,
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        tabs: const [
          Tab(text: 'General'),
          Tab(text: 'Salud'),
          Tab(text: 'Reproducción'),
          Tab(text: 'Ubicación'),
        ],
      ),
    );
  }

  Widget _buildGeneralTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _nuevaFotoPerfil != null
                      ? FileImage(_nuevaFotoPerfil!)
                      : (widget.animal.fotoPerfilUrl != null && widget.animal.fotoPerfilUrl!.isNotEmpty
                          ? FileImage(File(widget.animal.fotoPerfilUrl!))
                          : null) as ImageProvider?,
                  child: (_nuevaFotoPerfil == null && widget.animal.fotoPerfilUrl == null)
                      ? Icon(Icons.pets, size: 50, color: Colors.grey[600])
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                      onPressed: _pickImage,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          EditFormSection(
            title: 'Información Básica',
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: _inputDecoration('Nombre', Icons.pets),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es requerido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _idAreteVisualController,
                      decoration: _inputDecoration('Arete Visual', Icons.tag),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _idAreteNFCController,
                      decoration: _inputDecoration('Arete NFC', Icons.nfc),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _numeroHerradoController,
                decoration: _inputDecoration('Número de Herrado', Icons.format_list_numbered),
              ),
            ],
          ),
          const SizedBox(height: 24),
          EditFormSection(
            title: 'Características',
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<Sexo>(
                      initialValue: _sexoSeleccionado,
                      decoration: _inputDecoration('Sexo', Icons.wc),
                      items: Sexo.values.map((sexo) {
                        return DropdownMenuItem(
                          value: sexo,
                          child: Text(sexo.name[0].toUpperCase() + sexo.name.substring(1)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _sexoSeleccionado = value;
                          _hasUnsavedChanges = true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _razaController,
                      decoration: _inputDecoration('Raza', Icons.category),
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
                child: InputDecorator(
                  decoration: _inputDecoration('Fecha de Nacimiento', Icons.calendar_today),
                  child: Text(
                    '${_fechaNacimiento.day}/${_fechaNacimiento.month}/${_fechaNacimiento.year}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _colorPelajeController,
                decoration: _inputDecoration('Color del Pelaje', Icons.palette),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _senasParticularesController,
                decoration: _inputDecoration('Señas Particulares', Icons.info_outline),
                maxLines: 3,
              ),
            ],
          ),
          const SizedBox(height: 24),
          EditFormSection(
            title: 'Peso',
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _pesoNacimientoController,
                      decoration: _inputDecoration('Peso al Nacer (kg)', Icons.scale),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _pesoActualController,
                      decoration: _inputDecoration('Peso Actual (kg)', Icons.monitor_weight),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],
          ),
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
            children: [
              DropdownButtonFormField<EstadoSalud>(
                initialValue: _estadoSaludSeleccionado,
                decoration: _inputDecoration('Estado de Salud', _getHealthIcon(_estadoSaludSeleccionado)),
                items: EstadoSalud.values.map((estado) {
                  return DropdownMenuItem(
                    value: estado,
                    child: Row(
                      children: [
                        Icon(_getHealthIcon(estado), color: _getHealthColor(estado)),
                        const SizedBox(width: 8),
                        Text(estado.name[0].toUpperCase() + estado.name.substring(1)),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _estadoSaludSeleccionado = value;
                    _hasUnsavedChanges = true;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<EstadoAnimal>(
                initialValue: _estadoSeleccionado,
                decoration: _inputDecoration('Estado del Animal', Icons.pets),
                items: EstadoAnimal.values.map((estado) {
                  return DropdownMenuItem(
                    value: estado,
                    child: Text(estado.name[0].toUpperCase() + estado.name.substring(1)),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _estadoSeleccionado = value;
                    _hasUnsavedChanges = true;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReproductionTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          EditFormSection(
            title: 'Estado Reproductivo',
            children: [
              if (_sexoSeleccionado == Sexo.hembra) ...[
                DropdownButtonFormField<EstadoReproductivo>(
                  initialValue: _estadoReproductivo,
                  decoration: _inputDecoration('Estado Reproductivo', Icons.pregnant_woman),
                  items: EstadoReproductivo.values.map((estado) {
                    return DropdownMenuItem(
                      value: estado,
                      child: Text(estado.name[0].toUpperCase() + estado.name.substring(1)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _estadoReproductivo = value;
                      _hasUnsavedChanges = true;
                    });
                  },
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Gestante'),
                  value: _gestante,
                  onChanged: (value) {
                    setState(() {
                      _gestante = value;
                      _hasUnsavedChanges = true;
                    });
                  },
                  secondary: const Icon(Icons.check_circle_outline),
                  activeThumbColor: Theme.of(context).primaryColor,
                ),
              ] else ...[
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('No aplica para machos o castrados.'),
                )
              ]
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: EditFormSection(
        title: 'Ubicación',
        children: [
          TextFormField(
            controller: _zonaActualController,
            decoration: _inputDecoration('Zona / Potrero Actual', Icons.map_outlined),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _hasUnsavedChanges && !_isLoading ? _saveChanges : null,
            icon: _isLoading
                ? Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(2.0),
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                : const Icon(Icons.save),
            label: Text(_isLoading ? 'Guardando...' : 'Guardar Cambios'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: Colors.white,
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
        return Icons.check_circle_outline;
      case EstadoSalud.enfermo:
        return Icons.sick_outlined;
      case EstadoSalud.critico:
        return Icons.warning_amber_rounded;
      case EstadoSalud.convaleciente:
        return Icons.health_and_safety_outlined;
      case EstadoSalud.enTratamiento:
        return Icons.medical_services_outlined;
      case EstadoSalud.enObservacion:
        return Icons.visibility_outlined;
    }
  }
}
