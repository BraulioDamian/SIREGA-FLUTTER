import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/modulos/2_detalle_animal/presentation/bloc/cattle_detail_bloc.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

/// Shows the "more options" bottom sheet (print, QR, archive, delete).
void showMoreOptionsSheet(
  BuildContext context,
  Animal animal, {
  required VoidCallback onPrint,
  required VoidCallback onQR,
  required VoidCallback onArchive,
  required VoidCallback onDelete,
}) {
  HapticFeedback.mediumImpact();
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (modalContext) => Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _handle(),
          _OptionTile(
            icon: Icons.print_rounded,
            title: 'Imprimir ficha',
            color: AppColors.info,
            onTap: () {
              Navigator.pop(modalContext);
              onPrint();
            },
          ),
          _OptionTile(
            icon: Icons.qr_code_rounded,
            title: 'Generar código QR',
            color: AppColors.secondary,
            onTap: () {
              Navigator.pop(modalContext);
              onQR();
            },
          ),
          _OptionTile(
            icon: Icons.archive_rounded,
            title: 'Archivar',
            color: AppColors.textHint,
            onTap: () {
              Navigator.pop(modalContext);
              onArchive();
            },
          ),
          const Divider(height: 1),
          _OptionTile(
            icon: Icons.delete_rounded,
            title: 'Eliminar',
            color: AppColors.error,
            onTap: () {
              Navigator.pop(modalContext);
              onDelete();
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}

/// Shows the image source picker (camera / gallery).
void showImageSourceSheet(
  BuildContext context,
  Animal animal,
  CattleDetailBloc bloc,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (modalContext) => Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _handle(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Actualizar foto de ${animal.nombre}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _ImageOption(
            icon: Icons.camera_alt_rounded,
            title: 'Tomar foto',
            color: AppColors.primary,
            onTap: () async {
              Navigator.pop(modalContext);
              await _pickAndSaveImage(ImageSource.camera, animal, bloc);
            },
          ),
          _ImageOption(
            icon: Icons.photo_library_rounded,
            title: 'Elegir de galería',
            color: AppColors.secondary,
            onTap: () async {
              Navigator.pop(modalContext);
              await _pickAndSaveImage(ImageSource.gallery, animal, bloc);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}

// ── Private helpers ─────────────────────────────────────────────────────────

Widget _handle() {
  return Container(
    width: 50,
    height: 5,
    margin: const EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      color: AppColors.divider,
      borderRadius: BorderRadius.circular(3),
    ),
  );
}

Future<void> _pickAndSaveImage(
  ImageSource source,
  Animal animal,
  CattleDetailBloc bloc,
) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: source,
    maxWidth: 1024,
    maxHeight: 1024,
    imageQuality: 85,
  );

  if (image != null) {
    bloc.add(UpdateAnimalPhoto(animal, File(image.path)));
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _OptionTile({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: color == AppColors.error
                      ? AppColors.error
                      : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _ImageOption({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
