import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/presentation/forms/animal_form/animal_form.dart';
import 'package:sirega_app/presentation/forms/animal_form/controllers/animal_form_controller.dart';

/// Pantalla para editar un animal existente
/// Reutiliza el mismo formulario AnimalForm pero en modo edición
class EditarAnimalScreen extends StatefulWidget {
  final Animal animal;
  
  const EditarAnimalScreen({
    super.key,
    required this.animal,
  });

  @override
  State<EditarAnimalScreen> createState() => _EditarAnimalScreenState();
}

class _EditarAnimalScreenState extends State<EditarAnimalScreen> {
  late AnimalFormController _formController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Inicializar el controlador en modo edición con el animal existente
    _formController = AnimalFormController(
      isEditMode: true,
      animalOriginal: widget.animal,
    );
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
          onSave: _actualizarAnimal,
          saveButtonText: 'Actualizar Animal',
          showValidationSummary: true,
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Editar ${widget.animal.nombre}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 2,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      actions: [
        // Opción para eliminar el animal
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: _mostrarDialogoEliminar,
          tooltip: 'Eliminar animal',
        ),
      ],
    );
  }

  Future<void> _actualizarAnimal() async {
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

      // Si cambió el NFC, verificar que no esté duplicado
      if (_formController.nfcId != widget.animal.idAreteNFC) {
        final existente = await isarService.obtenerAnimalPorNfc(_formController.nfcId!);
        if (existente != null && existente.id != widget.animal.id) {
          _mostrarMensaje('Ya existe otro animal con ese chip NFC', esError: true);
          return;
        }
      }

      // Construir el objeto Animal actualizado
      final animalActualizado = _formController.buildAnimal();
      // Mantener el mismo ID
      animalActualizado.id = widget.animal.id;

      // Actualizar en la base de datos
      await isarService.actualizarAnimal(animalActualizado);

      if (mounted) {
        _mostrarMensaje('Animal actualizado exitosamente', esError: false);
        // Regresar a la pantalla anterior con resultado exitoso
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        _mostrarMensaje('Error al actualizar: $e', esError: true);
      }
    }
  }

  void _mostrarDialogoEliminar() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar Animal'),
          content: Text(
            '¿Está seguro de que desea eliminar a ${widget.animal.nombre}?\n\n'
            'Esta acción no se puede deshacer.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _eliminarAnimal();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _eliminarAnimal() async {
    try {
      final isarService = RepositoryProvider.of<IsarService>(context);
      await isarService.eliminarAnimal(widget.animal.id);
      
      if (mounted) {
        _mostrarMensaje('Animal eliminado exitosamente', esError: false);
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        _mostrarMensaje('Error al eliminar: $e', esError: true);
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
