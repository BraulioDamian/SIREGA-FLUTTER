import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';

/// Premium animal card for the selection screen.
/// Shows photo, name, arete SINIIGA (prominent), quick info row,
/// and an NFC shield badge when the animal was scanned.
class AnimalSelectionCard extends StatelessWidget {
  final Animal animal;
  final bool isSelected;
  final bool isNfcScanned;
  final Color accentColor;
  final ValueChanged<bool> onChanged;

  const AnimalSelectionCard({
    super.key,
    required this.animal,
    required this.isSelected,
    required this.isNfcScanned,
    required this.accentColor,
    required this.onChanged,
  });

  String get _sexoLabel {
    switch (animal.sexo) {
      case _:
        final s = animal.sexo.name;
        return s[0].toUpperCase() + s.substring(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isSelected),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withValues(alpha: 0.06)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? accentColor : AppColors.divider,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.textPrimary.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // ── Photo ──
            _buildPhoto(context),
            const SizedBox(width: 12),

            // ── Info ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + NFC badge
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          animal.nombre,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isNfcScanned) _buildNfcBadge(),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Arete SINIIGA — prominent
                  Row(
                    children: [
                      Icon(Icons.label_outlined, size: 14, color: accentColor),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          animal.idSinigaParaMostrar,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: accentColor,
                            fontFamily: 'monospace',
                            letterSpacing: 0.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Quick info: Raza • Sexo • Edad
                  Text(
                    '${animal.raza} • $_sexoLabel • ${animal.getEdadFormateada()}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // ── Checkbox ──
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isSelected ? accentColor : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? accentColor : AppColors.divider,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check_rounded, size: 18, color: AppColors.surface)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto(BuildContext context) {
    final photoPath = (animal.fotoPerfilUrl != null && animal.fotoPerfilUrl!.isNotEmpty)
        ? animal.fotoPerfilUrl!
        : (animal.fotoUrl != null && animal.fotoUrl!.isNotEmpty)
            ? animal.fotoUrl!
            : null;
    final hasPhoto = photoPath != null && File(photoPath).existsSync();

    final photoContainer = Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: accentColor.withValues(alpha: 0.1),
        border: Border.all(
          color: isSelected
              ? accentColor.withValues(alpha: 0.4)
              : AppColors.divider.withValues(alpha: 0.5),
          width: 1.5,
        ),
        image: hasPhoto
            ? DecorationImage(
                image: FileImage(File(photoPath)),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: !hasPhoto
          ? Icon(Icons.pets_rounded, size: 26, color: accentColor)
          : null,
    );

    if (!hasPhoto) return photoContainer;

    return GestureDetector(
      onTap: () => _showPhotoPreview(context, photoPath),
      child: photoContainer,
    );
  }

  void _showPhotoPreview(BuildContext context, String photoPath) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black87,
      barrierDismissible: true,
      barrierLabel: 'Cerrar foto',
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.85, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  // Top bar
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                animal.nombre,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.label_outlined, size: 14, color: Colors.white70),
                                  const SizedBox(width: 4),
                                  Text(
                                    animal.idSinigaParaMostrar,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
                        ),
                      ],
                    ),
                  ),
                  // Photo
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InteractiveViewer(
                            minScale: 1.0,
                            maxScale: 5.0,
                            child: Image.file(
                              File(photoPath),
                              fit: BoxFit.contain,
                              errorBuilder: (_, error, stackTrace) => Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: accentColor.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(Icons.broken_image_rounded, size: 64, color: accentColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Ultra-visible ID Badge
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withValues(alpha: 0.4),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      animal.idSinigaParaMostrar,
                      style: const TextStyle(
                        color: AppColors.surface,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'monospace',
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  // Info
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '${animal.raza} • $_sexoLabel • ${animal.getEdadFormateada()}',
                      style: const TextStyle(color: Colors.white60, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNfcBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.info.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.info.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.verified_rounded, size: 12, color: AppColors.info),
          const SizedBox(width: 3),
          Text(
            'NFC',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.info,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
