import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

class ImagePickerSection extends StatelessWidget {
  const ImagePickerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalFormController>(
      builder: (context, controller, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final isMobile = screenWidth < 600;
            final isTablet = screenWidth >= 600 && screenWidth < 1024;

            // Tamaño responsivo del contenedor
            double containerSize;
            if (isMobile) {
              containerSize = screenWidth * 0.35;
            } else if (isTablet) {
              containerSize = 150;
            } else {
              containerSize = 180;
            }

            return Center(
              child: GestureDetector(
                onTap: () => _showImageSourceOptions(context, controller),
                child: Container(
                  width: containerSize,
                  height: containerSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.background,
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.3),
                      width: 2,
                    ),
                    image: controller.imageFile != null
                        ? DecorationImage(
                            image: FileImage(controller.imageFile!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: controller.imageFile == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: isMobile ? 32 : 40,
                              color: AppColors.textSecondary,
                            ),
                            SizedBox(height: isMobile ? 4 : 8),
                            Text(
                              'Agregar Foto',
                              style: TextStyle(
                                fontSize: isMobile ? 12 : 14,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      : null,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showImageSourceOptions(
    BuildContext context,
    AnimalFormController controller,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const Text(
                    'Seleccionar imagen',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildImageOption(
                        context,
                        icon: Icons.camera_alt,
                        label: 'Cámara',
                        onTap: () {
                          Navigator.pop(context);
                          _pickImage(context, controller, ImageSource.camera);
                        },
                      ),
                      _buildImageOption(
                        context,
                        icon: Icons.photo_library,
                        label: 'Galería',
                        onTap: () {
                          Navigator.pop(context);
                          _pickImage(context, controller, ImageSource.gallery);
                        },
                      ),
                      if (controller.imageFile != null)
                        _buildImageOption(
                          context,
                          icon: Icons.delete,
                          label: 'Eliminar',
                          color: AppColors.error,
                          onTap: () {
                            Navigator.pop(context);
                            controller.setImageFile(null);
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: (color ?? Theme.of(context).primaryColor).withValues(
                  alpha: 0.1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: color ?? Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color ?? AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(
    BuildContext context,
    AnimalFormController controller,
    ImageSource source,
  ) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        controller.setImageFile(File(image.path));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al seleccionar imagen: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}
