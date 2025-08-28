import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/siniga_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/presentation/widgets/register_animal/register_animal_widgets.dart';

// Import necesario para las clases State

// Mixin global para manejar todos los dropdowns
mixin GlobalDropdownManager {
  void closeAllDropdowns();
}

class RegisterAnimalScreen extends StatefulWidget {
  const RegisterAnimalScreen({super.key});

  @override
  State<RegisterAnimalScreen> createState() => _RegisterAnimalScreenState();
}

class _RegisterAnimalScreenState extends State<RegisterAnimalScreen> 
    with GlobalDropdownManager {
  final _formKey = GlobalKey<FormState>();
  
  // Referencias a widgets con dropdowns
  final _sinigaFormKey = GlobalKey<ResponsiveSinigaFormState>();
  final _basicInfoFormKey = GlobalKey<ResponsiveBasicInfoFormState>();
  
  // Estado del formulario
  File? _imageFile;
  String _nombre = '';
  RazaBovina? _razaSeleccionada;
  DateTime? _fechaNacimiento;
  Sexo _sexo = Sexo.hembra;
  
  // Estado SINIGA y NFC
  SinigaId? _sinigaId;
  bool _sinigaIsValid = false;
  String? _nfcId;
  
  // Estado UI
  bool _isLoading = false;
  
  // Referencias a widgets
  final GlobalKey<ResponsiveNfcSectionState> _nfcSectionKey = GlobalKey();

  @override
  void closeAllDropdowns() {
    // Cerrar todos los dropdowns en todos los widgets
    _sinigaFormKey.currentState?.closeDropdowns();
    _basicInfoFormKey.currentState?.closeDropdowns();
    
    // Cerrar también cualquier foco activo
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildResponsiveBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Registrar Vacuno',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 2,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
    );
  }

  Widget _buildResponsiveBody(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isMobile = screenWidth < 600;
        final isTablet = screenWidth >= 600 && screenWidth < 1024;
        // Removed unused isDesktop variable
        
        // Responsive padding
        EdgeInsets padding;
        if (isMobile) {
          padding = const EdgeInsets.all(16);
        } else if (isTablet) {
          padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 24);
        } else {
          // Desktop - contenido centrado con máximo ancho
          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.all(32),
              child: _buildFormContent(),
            ),
          );
        }

        return SingleChildScrollView(
          padding: padding,
          child: _buildFormContent(),
        );
      },
    );
  }

  Widget _buildFormContent() {
    final canSave = _sinigaIsValid && _nfcId != null && _nfcId!.isNotEmpty;
    
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Selector de imagen responsivo
          ResponsiveImagePicker(
            imageFile: _imageFile,
            onImageTap: _showImageSourceOptions,
          ),
          const SizedBox(height: 24),
          
          // Formulario SINIGA responsivo con auto-selección y manejo de foco
          ResponsiveSinigaForm(
            key: _sinigaFormKey,
            onSinigaChanged: _onSinigaChanged,
            onEstadoCodeChanged: _onEstadoCodeChanged,
            onCloseAllDropdowns: closeAllDropdowns, // Pasar callback global
          ),
          const SizedBox(height: 24),
          
          // Información básica responsiva con manejo de foco
          ResponsiveBasicInfoForm(
            key: _basicInfoFormKey,
            onNombreChanged: _onNombreChanged,
            onRazaChanged: _onRazaChanged,
            onFechaChanged: _onFechaChanged,
            onSexoChanged: _onSexoChanged,
            initialSexo: _sexo,
            onCloseAllDropdowns: closeAllDropdowns, // Pasar callback global
          ),
          const SizedBox(height: 24),
          
          // Sección NFC responsiva
          ResponsiveNfcSection(
            key: _nfcSectionKey,
            onNfcIdChanged: _onNfcIdChanged,
            currentSinigaId: _sinigaId,
            sinigaIsValid: _sinigaIsValid,
          ),
          const SizedBox(height: 24),
          
          // Resumen de validación
          ValidationSummary(
            sinigaValid: _sinigaIsValid,
            nfcValid: _nfcId != null && _nfcId!.isNotEmpty,
          ),
          
          // Botón de guardado responsivo
          ResponsiveSaveButton(
            canSave: canSave,
            isLoading: _isLoading,
            onPressed: _save,
          ),
        ],
      ),
    );
  }

  // Callbacks para manejar cambios en los formularios
  void _onSinigaChanged(SinigaId? sinigaId, bool isValid) {
    setState(() {
      _sinigaId = sinigaId;
      _sinigaIsValid = isValid;
    });
  }

  void _onEstadoCodeChanged(String estadoCodigo) {
    // Lógica adicional si es necesaria cuando cambia el código del estado
    debugPrint('Estado seleccionado automáticamente: $estadoCodigo');
  }

  void _onNombreChanged(String nombre) {
    _nombre = nombre;
  }

  void _onRazaChanged(RazaBovina? raza) {
    _razaSeleccionada = raza;
  }

  void _onFechaChanged(DateTime? fecha) {
    _fechaNacimiento = fecha;
  }

  void _onSexoChanged(Sexo sexo) {
    setState(() {
      _sexo = sexo;
    });
  }

  void _onNfcIdChanged(String? nfcId) {
    setState(() {
      _nfcId = nfcId;
    });
  }

  // Manejo de imagen
  void _showImageSourceOptions() {
    ImagePickerService.showImageSourceActionSheet(
      context,
      (source) => ImagePickerService.pickImage(
        context,
        source,
        (image) => setState(() => _imageFile = image),
      ),
    );
  }

  // Lógica de guardado optimizada
  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    
    // Validaciones finales
    if (_nfcId == null || _nfcId!.isEmpty) {
      _showErrorSnackBar('Debe leer el chip NFC');
      return;
    }

    if (!_sinigaIsValid || _sinigaId == null) {
      _showErrorSnackBar('El ID SINIGA no es válido');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final isarService = RepositoryProvider.of<IsarService>(context);

      // Verificar duplicados
      final existente = await isarService.obtenerAnimalPorNfc(_nfcId!);
      if (existente != null) {
        _showErrorSnackBar('Ya existe un animal con ese NFC');
        return;
      }

      // Crear nuevo animal
      final nuevoAnimal = Animal()
        ..nombre = _nombre.trim().isNotEmpty ? _nombre.trim() : 'Sin nombre'
        ..raza = _razaSeleccionada?.nombre ?? 'Sin especificar'
        ..sexo = _sexo
        ..fechaNacimiento = _fechaNacimiento ?? DateTime.now()
        ..idAreteNFC = _nfcId
        ..siniigaId = _sinigaId
        ..fotoPerfilUrl = _imageFile?.path;

      // Guardar
      await isarService.guardarAnimal(nuevoAnimal);
      
      if (mounted) {
        _showSuccessSnackBar('Animal registrado exitosamente');
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Error al guardar: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showErrorSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}