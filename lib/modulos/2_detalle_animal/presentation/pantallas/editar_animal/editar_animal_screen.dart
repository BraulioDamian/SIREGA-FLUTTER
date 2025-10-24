import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/presentation/forms/animal_form/animal_form.dart';
import 'package:sirega_app/presentation/forms/animal_form/controllers/animal_form_controller.dart';

/// Pantalla para editar un animal existente con formulario completo
/// Reutiliza AnimalForm con campos extendidos (salud, reproducción, ubicación)
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
  bool _hasUnsavedChanges = false;

  @override
  void initState() {
    super.initState();
    // Inicializar el controlador en modo edición con el animal existente
    _formController = AnimalFormController(
      isEditMode: true,
      animalOriginal: widget.animal,
    );

    // Escuchar cambios en el formulario
    _formController.addListener(_onFormChanged);
  }

  void _onFormChanged() {
    if (!_hasUnsavedChanges) {
      setState(() {
        _hasUnsavedChanges = true;
      });
    }
  }

  @override
  void dispose() {
    _formController.removeListener(_onFormChanged);
    _formController.dispose();
    super.dispose();
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
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (!mounted) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: AnimalForm(
            controller: _formController,
            onSave: _actualizarAnimal,
            saveButtonText: 'Actualizar Animal',
            showValidationSummary: false,
            showExtendedFields: true, // Mostrar todos los campos adicionales
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
      // Construir el objeto Animal actualizado
      final animalActualizado = _formController.buildAnimal();

      // Emitir evento para actualizar
      if (!mounted) return;
      context.read<CattleDetailBloc>().add(UpdateAnimal(animalActualizado));

      _mostrarMensaje('Animal actualizado correctamente', esError: false);

      // Resetear flag de cambios
      setState(() {
        _hasUnsavedChanges = false;
      });

      // Regresar a la pantalla anterior con resultado exitoso
      Navigator.pop(context, animalActualizado);
    } catch (e) {
      if (!mounted) return;
      _mostrarMensaje('Error al actualizar: $e', esError: true);
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
