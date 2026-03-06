import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

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
              color: AppColors.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.warning_rounded,
              color: AppColors.error,
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
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
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
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: AppColors.warning),
                  const SizedBox(width: 12),
                  Expanded(
                    child: const Text(
                      'Esta acción no se puede deshacer',
                      style: TextStyle(
                        color: AppColors.warning,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Opciones de eliminación
            const Text(
              'Tipo de eliminación:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
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
                  color: !_isPermanentDelete ? AppColors.info.withValues(alpha: 0.1) : AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: !_isPermanentDelete ? AppColors.info : AppColors.divider,
                    width: !_isPermanentDelete ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      !_isPermanentDelete 
                        ? Icons.radio_button_checked 
                        : Icons.radio_button_unchecked,
                      color: !_isPermanentDelete ? AppColors.info : AppColors.textHint,
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
                          const Text(
                            'El animal se marcará como muerto/vendido pero se conservará en los registros históricos',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
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
                  color: _isPermanentDelete ? AppColors.error.withValues(alpha: 0.1) : AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _isPermanentDelete ? AppColors.error : AppColors.divider,
                    width: _isPermanentDelete ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      _isPermanentDelete 
                        ? Icons.radio_button_checked 
                        : Icons.radio_button_unchecked,
                      color: _isPermanentDelete ? AppColors.error : AppColors.textHint,
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
                          const Text(
                            'Se eliminarán todos los datos del animal de forma permanente',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
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
              const Text(
                'Para confirmar, escribe "ELIMINAR":',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.error,
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
                    borderSide: const BorderSide(color: AppColors.error),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.error, width: 2),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline, color: AppColors.error),
                  suffixIcon: _isConfirmed
                      ? const Icon(Icons.check_circle, color: AppColors.success)
                      : null,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.error,
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
          child: const Text(
            'Cancelar',
            style: TextStyle(color: AppColors.textSecondary),
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
                      backgroundColor: _isPermanentDelete ? AppColors.error : AppColors.warning,
                      behavior: SnackBarBehavior.fixed,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isPermanentDelete ? AppColors.error : AppColors.warning,
            foregroundColor: AppColors.surface,
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
