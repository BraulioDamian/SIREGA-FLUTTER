import 'package:flutter/material.dart';

/// Widget reutilizable para items de NativeDropdown con icono + texto.
///
/// Uso:
/// ```dart
/// NativeDropdown<EstadoSalud>(
///   itemBuilder: (context, estado) => DropdownItemTile(
///     icon: estado.icon,
///     color: estado.color,
///     text: estado.displayName,
///   ),
/// )
/// ```
class DropdownItemTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const DropdownItemTile({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
