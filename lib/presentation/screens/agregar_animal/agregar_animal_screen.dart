import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/presentation/forms/animal_form/animal_form.dart';
import 'package:sirega_app/presentation/forms/animal_form/controllers/animal_form_controller.dart';

/// Pantalla para agregar un nuevo animal
/// Usa el formulario reutilizable AnimalForm
class AgregarAnimalScreen extends StatefulWidget {
  const AgregarAnimalScreen({super.key});

  @override
  State<AgregarAnimalScreen> createState() => _AgregarAnimalScreenState();
}

class _AgregarAnimalScreenState extends State<AgregarAnimalScreen> {
  late AnimalFormController _formController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Inicializar el controlador en modo creación
    _formController = AnimalFormController(isEditMode: false);
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Form(
        key: _formKey,
        child: AnimalForm(
          controller: _formController,
          onSave: _guardarAnimal,
          saveButtonText: 'Registrar Animal',
          showValidationSummary: true,
        ),
      ),
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

  Future<void> _guardarAnimal() async {
    // Validar el formulario
    if (!(_formKey.currentState?.validate() ?? false)) {
      _mostrarMensaje('Por favor complete todos los campos requeridos', esError: true);
      return;
    }

    // Validaciones adicionales del controlador
    if (!_formController.isFormValid) {
      if (!_formController.sinigaIsValid) {
        _mostrarMensaje('El ID SINIGA no es válido', esError: true);
      } else if (_formController.nfcId == null || _formController.nfcId!.isEmpty) {
        _mostrarMensaje('Debe leer el chip NFC', esError: true);
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
    
    ScaffoldMessenger.of(context).showSnackBar(
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
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
