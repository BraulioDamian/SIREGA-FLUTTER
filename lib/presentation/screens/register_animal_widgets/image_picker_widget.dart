import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ResponsiveImagePicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onImagePick;

  const ResponsiveImagePicker({
    super.key,
    this.imageFile,
    required this.onImagePick,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final radius = screenWidth < 600 ? 60.0 : 80.0;
    final iconSize = screenWidth < 600 ? 60.0 : 80.0;
    final cameraIconSize = screenWidth < 600 ? 20.0 : 24.0;
    final cameraRadius = screenWidth < 600 ? 20.0 : 24.0;

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
            child: imageFile == null
                ? Icon(Icons.pets, size: iconSize, color: Colors.grey)
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: onImagePick,
              child: CircleAvatar(
                radius: cameraRadius,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt, 
                  color: Colors.white, 
                  size: cameraIconSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Seleccionar imagen',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Cámara'),
            onTap: () {
              Navigator.of(context).pop();
              onSourceSelected(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Galería'),
            onTap: () {
              Navigator.of(context).pop();
              onSourceSelected(ImageSource.gallery);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
