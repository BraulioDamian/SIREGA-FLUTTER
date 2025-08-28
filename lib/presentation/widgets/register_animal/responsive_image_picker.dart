import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ResponsiveImagePicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onImageTap;
  final double? size;

  const ResponsiveImagePicker({
    super.key,
    required this.imageFile,
    required this.onImageTap,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarRadius = size ?? _getResponsiveRadius(screenWidth);
    
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
            backgroundColor: Colors.grey[200],
            child: imageFile == null
                ? Icon(
                    Icons.pets, 
                    size: avatarRadius * 0.8, 
                    color: Colors.grey[600],
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: onImageTap,
              child: CircleAvatar(
                radius: avatarRadius * 0.25,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.camera_alt, 
                  color: Colors.white, 
                  size: avatarRadius * 0.25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getResponsiveRadius(double screenWidth) {
    if (screenWidth < 600) return 60.0; // Móvil
    if (screenWidth < 1024) return 80.0; // Tablet
    return 100.0; // Desktop
  }
}

class ImageSourceBottomSheet extends StatelessWidget {
  final Function(ImageSource) onSourceSelected;

  const ImageSourceBottomSheet({
    super.key,
    required this.onSourceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Seleccionar fuente de imagen',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blue),
              title: const Text('Cámara'),
              subtitle: const Text('Tomar una nueva foto'),
              onTap: () {
                Navigator.of(context).pop();
                onSourceSelected(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: const Text('Galería'),
              subtitle: const Text('Seleccionar desde galería'),
              onTap: () {
                Navigator.of(context).pop();
                onSourceSelected(ImageSource.gallery);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  static Future<void> pickImage(
    BuildContext context,
    ImageSource source,
    Function(File) onImageSelected,
  ) async {
    final perm = source == ImageSource.camera ? Permission.camera : Permission.photos;
    var status = await perm.status;

    if (status.isDenied) {
      status = await perm.request();
    }

    if (status.isGranted) {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        onImageSelected(File(pickedFile.path));
      }
    } else if (status.isPermanentlyDenied) {
      _showPermissionDialog(context);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permiso denegado')),
        );
      }
    }
  }

  static void _showPermissionDialog(BuildContext context) {
    if (!context.mounted) return;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Permiso requerido'),
        content: const Text(
          'Para usar esta función, necesitas habilitar el permiso en la configuración de la aplicación.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
            child: const Text('Abrir configuración'),
          ),
        ],
      ),
    );
  }

  static void showImageSourceActionSheet(
    BuildContext context,
    Function(ImageSource) onSourceSelected,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ImageSourceBottomSheet(
        onSourceSelected: onSourceSelected,
      ),
    );
  }
}
