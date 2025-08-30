import 'package:flutter/material.dart';

/// Widget de dropdown nativo reutilizable que usa Autocomplete de Flutter
/// Reemplaza al CustomTypeAheadDropdown que usaba flutter_typeahead
class NativeDropdown<T> extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final IconData? prefixIcon;
  final String? helperText;
  final List<T> items;
  final String Function(T) displayStringForOption;
  final void Function(T) onSelected;
  final Widget Function(BuildContext, T)? itemBuilder;
  final bool readOnly;
  final bool enabled;
  final String? Function(String?)? validator;
  final T? initialSelection;

  const NativeDropdown({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.prefixIcon,
    this.helperText,
    required this.items,
    required this.displayStringForOption,
    required this.onSelected,
    this.itemBuilder,
    this.readOnly = false,
    this.enabled = true,
    this.validator,
    this.initialSelection,
  });

  @override
  State<NativeDropdown<T>> createState() => _NativeDropdownState<T>();
}

class _NativeDropdownState<T> extends State<NativeDropdown<T>> {
  late TextEditingController _fieldController;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _fieldController = widget.controller;
    
    // Si hay selección inicial, establecer el texto
    if (widget.initialSelection != null) {
      _fieldController.text = widget.displayStringForOption(widget.initialSelection as T);
    }
    
    widget.focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (widget.focusNode.hasFocus && !widget.readOnly) {
      _showOverlay();
    } else {
      _hideOverlay();
    }
  }

  void _showOverlay() {
    if (_isOpen) return;
    
    _overlayEntry = _createOverlay();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
    });
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isOpen = false;
    });
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return InkWell(
                    onTap: () {
                      widget.onSelected(item);
                      _fieldController.text = widget.displayStringForOption(item);
                      _hideOverlay();
                      widget.focusNode.unfocus();
                    },
                    child: widget.itemBuilder != null
                        ? widget.itemBuilder!(context, item)
                        : Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Text(widget.displayStringForOption(item)),
                          ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: _fieldController,
        focusNode: widget.focusNode,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        validator: widget.validator,
        onTap: widget.readOnly ? () {
          if (widget.enabled) {
            if (_isOpen) {
              _hideOverlay();
            } else {
              _showOverlay();
            }
          }
        } : null,
        decoration: InputDecoration(
          labelText: widget.labelText,
          helperText: widget.helperText,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: AnimatedRotation(
            duration: const Duration(milliseconds: 200),
            turns: _isOpen ? 0.5 : 0,
            child: const Icon(Icons.arrow_drop_down),
          ),
          enabled: widget.enabled,
          fillColor: widget.enabled ? null : Colors.grey.shade100,
          filled: !widget.enabled,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hideOverlay();
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }
}

/// Widget de Autocomplete nativo de Flutter para búsqueda
class NativeSearchableDropdown<T extends Object> extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final IconData? prefixIcon;
  final String? helperText;
  final List<T> items;
  final String Function(T) displayStringForOption;
  final void Function(T) onSelected;
  final Widget Function(BuildContext, T)? itemBuilder;
  final bool enabled;
  final String? Function(String?)? validator;

  const NativeSearchableDropdown({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.prefixIcon,
    this.helperText,
    required this.items,
    required this.displayStringForOption,
    required this.onSelected,
    this.itemBuilder,
    this.enabled = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return RawAutocomplete<T>(
          textEditingController: controller,
          focusNode: focusNode,
          displayStringForOption: displayStringForOption,
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return items.take(50);
            }
            final searchTerm = textEditingValue.text.toLowerCase();
            return items.where((item) {
              return displayStringForOption(item)
                  .toLowerCase()
                  .contains(searchTerm);
            }).take(50);
          },
          onSelected: onSelected,
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              enabled: enabled,
              validator: validator,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
              decoration: InputDecoration(
                labelText: labelText,
                helperText: helperText,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                enabled: enabled,
                fillColor: enabled ? null : Colors.grey.shade100,
                filled: !enabled,
              ),
            );
          },
          optionsViewBuilder: (
            BuildContext context,
            AutocompleteOnSelected<T> onSelected,
            Iterable<T> options,
          ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: constraints.maxWidth,
                  constraints: const BoxConstraints(maxHeight: 250),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final option = options.elementAt(index);
                      return InkWell(
                        onTap: () => onSelected(option),
                        child: itemBuilder != null
                            ? itemBuilder!(context, option)
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Text(displayStringForOption(option)),
                              ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
