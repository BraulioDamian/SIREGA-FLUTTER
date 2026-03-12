import 'package:flutter/material.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

/// Dose input field with an integrated unit popup button suffix.
/// Shows the current unit (e.g. "ml ▼") and opens a popup to change it.
class DosisConUnidadField extends StatefulWidget {
  final TextEditingController controller;
  final String selectedUnit;
  final Color accentColor;
  final ValueChanged<String> onUnitChanged;
  final InputDecoration? baseDecoration;

  const DosisConUnidadField({
    super.key,
    required this.controller,
    required this.selectedUnit,
    required this.accentColor,
    required this.onUnitChanged,
    this.baseDecoration,
  });

  @override
  State<DosisConUnidadField> createState() => _DosisConUnidadFieldState();
}

class _DosisConUnidadFieldState extends State<DosisConUnidadField> {
  bool _isMenuOpen = false;

  static const _units = ['ml', 'mg', 'cc', 'unidades', 'gotas'];

  @override
  Widget build(BuildContext context) {
    final decoration =
        (widget.baseDecoration ??
                InputDecoration(
                  labelText: 'Dosis',
                  hintText: '0.0',
                  prefixIcon: Icon(
                    Icons.science_outlined,
                    color: widget.accentColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.divider),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.divider),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: widget.accentColor, width: 2),
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ))
            .copyWith(
              suffixIcon: PopupMenuButton<String>(
                onSelected: (value) {
                  widget.onUnitChanged(value);
                  setState(() => _isMenuOpen = false);
                },
                onOpened: () => setState(() => _isMenuOpen = true),
                onCanceled: () => setState(() => _isMenuOpen = false),
                offset: const Offset(0, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                color: AppColors.surface,
                itemBuilder: (context) => _units
                    .map(
                      (unit) => PopupMenuItem<String>(
                        value: unit,
                        child: Row(
                          children: [
                            if (widget.selectedUnit == unit)
                              Icon(
                                Icons.check_rounded,
                                size: 18,
                                color: widget.accentColor,
                              )
                            else
                              const SizedBox(width: 18),
                            const SizedBox(width: 8),
                            Text(
                              unit,
                              style: TextStyle(
                                fontWeight: widget.selectedUnit == unit
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: widget.selectedUnit == unit
                                    ? widget.accentColor
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: widget.accentColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.selectedUnit,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: widget.accentColor,
                        ),
                      ),
                      const SizedBox(width: 4),
                      AnimatedRotation(
                        turns: _isMenuOpen ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18,
                          color: widget.accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

    return TextFormField(
      controller: widget.controller,
      decoration: decoration,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value != null &&
            value.isNotEmpty &&
            double.tryParse(value) == null) {
          return 'Número inválido';
        }
        return null;
      },
    );
  }
}
