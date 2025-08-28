// lib/presentation/widgets/shared/custom_typeahead_dropdown.dart

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

/// Widget reutilizable y robusto para TypeAhead Dropdowns
class CustomTypeAheadDropdown<T> extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final IconData? prefixIcon;
  final String? helperText;
  final bool isOpen;
  final VoidCallback onTap;
  final List<T> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T) onSelected;
  final bool readOnly;
  final double maxHeight;
  final Widget? emptyBuilder;
  final bool enabled;

  const CustomTypeAheadDropdown({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.prefixIcon,
    this.helperText,
    required this.isOpen,
    required this.onTap,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSelected,
    this.readOnly = true,
    this.maxHeight = 250,
    this.emptyBuilder,
    this.enabled = true,
  });

  @override
  State<CustomTypeAheadDropdown<T>> createState() =>
      _CustomTypeAheadDropdownState<T>();
}

class _CustomTypeAheadDropdownState<T> extends State<CustomTypeAheadDropdown<T>> {
  DateTime? _lastTap;
  bool _isProcessing = false;

  void _handleTap() {
    if (!widget.enabled || _isProcessing) return;

    final now = DateTime.now();
    if (_lastTap != null && now.difference(_lastTap!).inMilliseconds < 300) {
      return;
    }

    _lastTap = now;
    _isProcessing = true;

    FocusManager.instance.primaryFocus?.unfocus();
    
    const delay = Duration(milliseconds: 150);

    Future.delayed(delay, () {
      if (mounted) {
        widget.onTap();
        _isProcessing = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _handleTap(),
      behavior: HitTestBehavior.opaque,
      child: IgnorePointer(
        ignoring: true, 
        child: TypeAheadField<T>(
          controller: widget.controller,
          focusNode: widget.focusNode,
          builder: (context, controller, focusNode) {
            return TextFormField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: widget.labelText,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
                helperText: widget.helperText,
                suffixIcon: AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: widget.isOpen ? 0.5 : 0,
                  child: const Icon(Icons.arrow_drop_down),
                ),
                enabled: widget.enabled,
                fillColor: widget.enabled ? null : Colors.grey.shade100,
                filled: !widget.enabled,
              ),
              readOnly: widget.readOnly,
            );
          },
          suggestionsCallback: widget.suggestionsCallback,
          itemBuilder: widget.itemBuilder,
          onSelected: (item) {
            widget.onSelected(item);
            Future.delayed(const Duration(milliseconds: 50), () {
              widget.focusNode.unfocus();
            });
          },
          decorationBuilder: (context, child) {
            return Material(
              type: MaterialType.card,
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                constraints: BoxConstraints(maxHeight: widget.maxHeight),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: child,
              ),
            );
          },
          offset: const Offset(0, 4),
          hideOnEmpty: widget.emptyBuilder == null,
          hideOnError: true,
          hideOnLoading: false,
          hideOnSelect: true,
          emptyBuilder: widget.emptyBuilder != null
              ? (context) => widget.emptyBuilder!
              : (context) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}