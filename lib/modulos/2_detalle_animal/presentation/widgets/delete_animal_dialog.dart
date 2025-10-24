import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/bloc/cattle_detail_bloc.dart';

class DeleteAnimalDialog extends StatefulWidget {
  final Animal animal;
  
  const DeleteAnimalDialog({super.key, required this.animal});

  @override
  State<DeleteAnimalDialog> createState() => _DeleteAnimalDialogState();
}

class _DeleteAnimalDialogState extends State<DeleteAnimalDialog> {
  bool _isPermanentDelete = false;
  bool _isConfirmed = false;
  final TextEditingController _confirmController = TextEditingController();
  
  @override
  void dispose() {
    _confirmController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.warning_rounded,
              color: Colors.red.shade600,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Eliminar Animal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.animal.nombre,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.orange.shade700),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Esta acción no se puede deshacer',
                      style: TextStyle(
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Opciones de eliminación
            Text(
              'Tipo de eliminación:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 12),
            
            // Opción 1: Marcar como muerto/vendido
            InkWell(
              onTap: () {
                setState(() {
                  _isPermanentDelete = false;
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: !_isPermanentDelete ? Colors.blue.shade50 : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: !_isPermanentDelete ? Colors.blue.shade300 : Colors.grey.shade300,
                    width: !_isPermanentDelete ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      !_isPermanentDelete 
                        ? Icons.radio_button_checked 
                        : Icons.radio_button_unchecked,
                      color: !_isPermanentDelete ? Colors.blue : Colors.grey,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Marcar como inactivo',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'El animal se marcará como muerto/vendido pero se conservará en los registros históricos',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Opción 2: Eliminar permanentemente
            InkWell(
              onTap: () {
                setState(() {
                  _isPermanentDelete = true;
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _isPermanentDelete ? Colors.red.shade50 : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _isPermanentDelete ? Colors.red.shade300 : Colors.grey.shade300,
                    width: _isPermanentDelete ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      _isPermanentDelete 
                        ? Icons.radio_button_checked 
                        : Icons.radio_button_unchecked,
                      color: _isPermanentDelete ? Colors.red : Colors.grey,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Eliminar permanentemente',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Se eliminarán todos los datos del animal de forma permanente',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Campo de confirmación para eliminación permanente
            if (_isPermanentDelete) ...[
              const SizedBox(height: 20),
              Text(
                'Para confirmar, escribe "ELIMINAR":',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _confirmController,
                onChanged: (value) {
                  setState(() {
                    _isConfirmed = value.toUpperCase() == 'ELIMINAR';
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Escribe ELIMINAR',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red.shade500, width: 2),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.red),
                  suffixIcon: _isConfirmed
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            Navigator.pop(context);
          },
          child: Text(
            'Cancelar',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        ElevatedButton(
          onPressed: (_isPermanentDelete && !_isConfirmed) 
              ? null 
              : () {
                  HapticFeedback.heavyImpact();
                  
                  if (_isPermanentDelete) {
                    // Eliminar permanentemente
                    context.read<CattleDetailBloc>().add(
                      DeleteAnimalPermanently(widget.animal.id),
                    );
                  } else {
                    // Solo marcar como inactivo
                    context.read<CattleDetailBloc>().add(
                      DeactivateAnimal(widget.animal),
                    );
                  }
                  
                  Navigator.pop(context);
                  
                  // Mostrar confirmación
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _isPermanentDelete 
                          ? 'Animal eliminado permanentemente'
                          : 'Animal marcado como inactivo',
                      ),
                      backgroundColor: _isPermanentDelete ? Colors.red : Colors.orange,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isPermanentDelete ? Colors.red : Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            _isPermanentDelete ? 'Eliminar Permanentemente' : 'Marcar como Inactivo',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
