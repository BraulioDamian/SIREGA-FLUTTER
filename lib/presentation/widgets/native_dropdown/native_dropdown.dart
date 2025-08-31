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
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    
    // Si hay selección inicial, establecer el texto
    if (widget.initialSelection != null) {
      widget.controller.text = widget.displayStringForOption(widget.initialSelection as T);
    }
    
    widget.focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (!widget.focusNode.hasFocus && _isOpen) {
      _hideOverlay();
    }
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _hideOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    if (_isOpen || !widget.enabled) return;
    
    // Dar foco al campo para mantener consistencia
    widget.focusNode.requestFocus();
    
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
    // Quitar el foco cuando se cierra
    widget.focusNode.unfocus();
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Capa invisible para detectar clicks fuera del dropdown
          Positioned.fill(
            child: GestureDetector(
              onTap: _hideOverlay,
              behavior: HitTestBehavior.opaque,
              child: Container(color: Colors.transparent),
            ),
          ),
          // El dropdown en sí
          Positioned(
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
                          widget.controller.text = widget.displayStringForOption(item);
                          _hideOverlay();
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        validator: widget.validator,
        onTap: widget.readOnly && widget.enabled ? _toggleDropdown : null,
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
          suffixIcon: GestureDetector(
            onTap: widget.enabled ? _toggleDropdown : null,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: _isOpen ? 0.5 : 0,
              child: const Icon(Icons.arrow_drop_down),
            ),
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
class NativeSearchableDropdown<T extends Object> extends StatefulWidget {
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
  State<NativeSearchableDropdown<T>> createState() => 
      _NativeSearchableDropdownState<T>();
}

class _NativeSearchableDropdownState<T extends Object> extends State<NativeSearchableDropdown<T>> {
  bool _isOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<T> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items.take(50).toList();
    widget.controller.addListener(_onSearchChanged);
    widget.focusNode.addListener(_onFocusChanged);
  }

  void _onSearchChanged() {
    final searchTerm = widget.controller.text.toLowerCase();
    setState(() {
      if (searchTerm.isEmpty) {
        _filteredItems = widget.items.take(50).toList();
      } else {
        _filteredItems = widget.items.where((item) {
          return widget.displayStringForOption(item)
              .toLowerCase()
              .contains(searchTerm);
        }).take(50).toList();
      }
    });
    
    // Actualizar el overlay si está abierto
    if (_isOpen) {
      _updateOverlay();
    }
  }

  void _onFocusChanged() {
    if (widget.focusNode.hasFocus && !_isOpen) {
      _showOverlay();
    } else if (!widget.focusNode.hasFocus && _isOpen) {
      // Delay para permitir clicks en items
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!widget.focusNode.hasFocus) {
          _hideOverlay();
        }
      });
    }
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _hideOverlay();
      widget.focusNode.unfocus();
    } else {
      widget.focusNode.requestFocus();
      _showOverlay();
    }
  }

  void _showOverlay() {
    if (_isOpen || !widget.enabled) return;
    
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

  void _updateOverlay() {
    _overlayEntry?.remove();
    if (_isOpen) {
      _overlayEntry = _createOverlay();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Capa invisible para detectar clicks fuera
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _hideOverlay();
                widget.focusNode.unfocus();
              },
              behavior: HitTestBehavior.opaque,
              child: Container(color: Colors.transparent),
            ),
          ),
          // El dropdown con búsqueda
          Positioned(
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
                  child: _filteredItems.isEmpty
                      ? Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.search_off,
                                color: Colors.grey.shade400,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'No se encontraron resultados',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: _filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = _filteredItems[index];
                            return InkWell(
                              onTap: () {
                                widget.onSelected(item);
                                widget.controller.text = 
                                    widget.displayStringForOption(item);
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
                                      child: Text(
                                        widget.displayStringForOption(item),
                                      ),
                                    ),
                            );
                          },
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        validator: widget.validator,
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
          suffixIcon: GestureDetector(
            onTap: widget.enabled ? _toggleDropdown : null,
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: _isOpen ? 0.5 : 0,
              child: const Icon(Icons.arrow_drop_down),
            ),
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
    widget.controller.removeListener(_onSearchChanged);
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }
}
