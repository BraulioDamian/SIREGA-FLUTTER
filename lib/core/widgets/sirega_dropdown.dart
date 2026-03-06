import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class SiregaDropdown<T> extends StatelessWidget {
  final String label;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Widget? prefixIcon;

  const SiregaDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.hint,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.xs),
          DropdownButtonFormField<T>(
            initialValue: value,
            items: items,
            onChanged: onChanged,
            validator: validator,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: hint ?? 'Seleccione $label',
              prefixIcon: prefixIcon,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            dropdownColor: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ],
      ),
    );
  }
}
