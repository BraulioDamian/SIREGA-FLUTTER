import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

/// Widget de dropdown nativo reutilizable con animaciones suaves
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
  /// Altura máxima del menú desplegable.
  final double maxMenuHeight;
  /// Alignment usado en Scrollable.ensureVisible (0 = top). Default: 0.02 para subir un poco más.
  final double scrollAlignment;

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
  this.maxMenuHeight = 320,
  this.scrollAlignment = 0.02,
  });

  @override
  State<NativeDropdown<T>> createState() => _NativeDropdownState<T>();
}

class _NativeDropdownState<T> extends State<NativeDropdown<T>> 
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _fieldKey = GlobalKey();
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isDisposed = false;
  ScrollPosition? _scrollPosition; // posicion de scroll para cierre
  double? _openScrollOffset; // offset al abrir
  bool _scrollAttached = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );
    
    if (widget.initialSelection != null) {
      widget.controller.text = widget.displayStringForOption(widget.initialSelection as T);
    }
    
    widget.focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (mounted) {
      setState(() {}); // Re-render to update helper text color
    }
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
    if (_isOpen || !widget.enabled || _isDisposed) return;

    widget.focusNode.requestFocus();

    // Ensure the field is visible and has space for the dropdown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _isDisposed) return;

      final context = _fieldKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          alignment: widget.scrollAlignment.clamp(0.0, 1.0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
        ).then((_) {
          // After scrolling, create and show the overlay
          if (!mounted || _isOpen || _isDisposed) return;
          _overlayEntry = _createOverlay();
          Overlay.of(this.context).insert(_overlayEntry!);
          _animationController.forward();
          setState(() {
            _isOpen = true;
          });
          _attachScrollListener();
        });
      } else {
        // Fallback for when context is not available
        if (!mounted || _isOpen || _isDisposed) return;
        _overlayEntry = _createOverlay();
        Overlay.of(this.context).insert(_overlayEntry!);
        _animationController.forward();
        setState(() {
          _isOpen = true;
        });
  _attachScrollListener();
      }
    });
  }

  void _hideOverlay() {
    if (!_isOpen || _isDisposed) return;
    
    if (_animationController.isAnimating) {
      _animationController.stop();
    }
    
    _animationController.reverse().then((_) {
      if (!_isDisposed && _overlayEntry != null) {
        _overlayEntry?.remove();
        _overlayEntry = null;
        if (mounted) {
          setState(() {
            _isOpen = false;
          });
        }
      }
    });
  _detachScrollListener();
    
    widget.focusNode.unfocus();
  }

  void _hideOverlayImmediately() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    if (mounted) {
      setState(() {
        _isOpen = false;
      });
    }
  _detachScrollListener();
  }

  OverlayEntry _createOverlay() {
    final renderBox = _fieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return OverlayEntry(builder: (_) => const SizedBox.shrink());
  final size = renderBox.size;
  final fieldOffset = renderBox.localToGlobal(Offset.zero);
  final screenSize = MediaQuery.of(context).size;
  final spaceAbove = fieldOffset.dy;
  final spaceBelow = screenSize.height - (fieldOffset.dy + size.height);
  // Altura deseada (puede ser menor que maxMenuHeight según ítems)
  final desiredHeight = math.min(widget.items.length * 52.0, widget.maxMenuHeight).toDouble();
  final openUp = spaceBelow < desiredHeight && spaceAbove > spaceBelow;
  final effectiveHeight = desiredHeight;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Barrier removed for consistency. Dropdown closes on focus change.
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: openUp ? Offset(0.0, -effectiveHeight.toDouble()) : Offset(0.0, size.height),
            child: AnimatedBuilder(
              animation: _expandAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _expandAnimation.value,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(openUp ? 8 : 0),
                      bottom: Radius.circular(openUp ? 0 : 8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: effectiveHeight * _expandAnimation.value,
                        maxWidth: size.width,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(openUp ? 8 : 0),
                          bottom: Radius.circular(openUp ? 0 : 8),
                        ),
                        border: Border.all(
                          color: Theme.of(context).primaryColor.withAlpha((255 * 0.2).round()),
                          width: 1,
                        ),
                      ),
                      child: widget.items.isEmpty
                          ? Container(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'No hay opciones disponibles',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            )
                          : ClipRect(
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                shrinkWrap: true,
                                itemCount: widget.items.length,
                                itemBuilder: (context, index) {
                                  if (index >= widget.items.length) {
                                    return const SizedBox.shrink();
                                  }
                                  final item = widget.items[index];
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: Offset(0, -0.1 * (index + 1).clamp(0, 5)),
                                      end: Offset.zero,
                                    ).animate(
                                      CurvedAnimation(
                                        parent: _animationController,
                                        curve: Interval(
                                          (index * 0.05).clamp(0.0, 0.5),
                                          ((index * 0.05) + 0.5).clamp(0.5, 1.0),
                                          curve: Curves.easeOut,
                                        ),
                                      ),
                                    ),
                                    child: InkWell(
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
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final helperStyle = theme.inputDecorationTheme.helperStyle ?? theme.textTheme.bodySmall;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: TextFormField(
            key: _fieldKey,
            controller: widget.controller,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            enabled: widget.enabled,
            validator: widget.validator,
            onTap: widget.readOnly && widget.enabled ? _toggleDropdown : null,
            decoration: InputDecoration(
              labelText: widget.labelText,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.primaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: _isOpen
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.primaryColor.withAlpha((255 * 0.5).round()),
                        width: 2,
                      ),
                    )
                  : null,
              prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
              suffixIcon: GestureDetector(
                onTap: widget.enabled ? _toggleDropdown : null,
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: _isOpen ? 0.5 : 0,
                  curve: Curves.easeInOut,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: widget.enabled 
                        ? (_isOpen ? theme.primaryColor : null)
                        : Colors.grey,
                  ),
                ),
              ),
              enabled: widget.enabled,
              fillColor: widget.enabled ? null : Colors.grey.shade100,
              filled: !widget.enabled,
            ),
          ),
        ),
        if (widget.helperText != null && widget.helperText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4.0),
            child: Text(
              widget.helperText!,
              style: helperStyle?.copyWith(color: widget.focusNode.hasFocus ? theme.primaryColor : null),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    widget.focusNode.removeListener(_onFocusChanged);
    _hideOverlayImmediately();
    _animationController.dispose();
    _detachScrollListener();
    super.dispose();
  }

  void _attachScrollListener() {
    if (_scrollAttached || !mounted) return;
    final scrollableState = Scrollable.of(context);
  _scrollPosition = scrollableState.position;
  _openScrollOffset = _scrollPosition!.pixels;
  _scrollPosition!.addListener(_onScrollChange);
  _scrollAttached = true;
  }

  void _detachScrollListener() {
    if (_scrollAttached && _scrollPosition != null) {
      _scrollPosition!.removeListener(_onScrollChange);
    }
    _scrollAttached = false;
    _scrollPosition = null;
    _openScrollOffset = null;
  }

  void _onScrollChange() {
    if (!_isOpen || _scrollPosition == null || _openScrollOffset == null) return;
    // Cierra si hubo desplazamiento perceptible (>4 px)
    if ((_scrollPosition!.pixels - _openScrollOffset!).abs() > 4) {
      _hideOverlay();
    }
  }
}

/// Widget de Autocomplete nativo con búsqueda y animaciones
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
  final T? initialSelection;
  final double maxMenuHeight;
  final double scrollAlignment;

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
    this.initialSelection,
  this.maxMenuHeight = 340,
  this.scrollAlignment = 0.02,
  });

  @override
  State<NativeSearchableDropdown<T>> createState() => 
      _NativeSearchableDropdownState<T>();
}

class _NativeSearchableDropdownState<T extends Object> extends State<NativeSearchableDropdown<T>>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  OverlayEntry? _overlayEntry;
  List<T> _filteredItems = [];
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _fieldKey = GlobalKey();
  Timer? _debounceTimer;
  bool _isUpdating = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isDisposed = false;
  ScrollPosition? _scrollPosition; // para detectar scroll
  double? _openScrollOffset;
  bool _scrollAttached = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeInCubic,
    );
    
    if (widget.initialSelection != null) {
      widget.controller.text = widget.displayStringForOption(widget.initialSelection as T);
    }
    
  _filteredItems = List<T>.from(widget.items);
    widget.controller.addListener(_onSearchChanged);
    widget.focusNode.addListener(_onFocusChanged);
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    
  _debounceTimer = Timer(const Duration(milliseconds: 180), () {
      if (!mounted || _isDisposed) return;
      
      final searchTerm = widget.controller.text.toLowerCase();
      
      _isUpdating = true;
      
      setState(() {
        if (searchTerm.isEmpty) {
          _filteredItems = List<T>.from(widget.items);
        } else {
          _filteredItems = List<T>.from(
            widget.items.where((item) {
              return widget.displayStringForOption(item)
                  .toLowerCase()
                  .contains(searchTerm);
            })
          );
        }
      });
      
      if (_isOpen && mounted && !_isDisposed) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _isUpdating = false; // liberar antes de intentar actualizar
          if (mounted && _isOpen && !_isDisposed) {
            _updateOverlay();
          }
        });
      } else {
        _isUpdating = false;
      }
    });
  }

  void _onFocusChanged() {
    if (mounted) {
      setState(() {}); // Re-render to update helper text color
    }
    if (widget.focusNode.hasFocus && !_isOpen) {
      _showOverlay();
    } else if (!widget.focusNode.hasFocus && _isOpen) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (!widget.focusNode.hasFocus && mounted && !_isDisposed) {
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
    if (_isOpen || !widget.enabled || _isUpdating || _isDisposed) return;

    // Ensure the field is visible and has space for the dropdown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _isDisposed) return;

      final context = _fieldKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          alignment: widget.scrollAlignment.clamp(0.0, 1.0),
          duration: const Duration(milliseconds: 320),
          curve: Curves.easeOutCubic,
        ).then((_) {
          // After scrolling, create and show the overlay
          if (!mounted || _isOpen || _isDisposed) return;
          _overlayEntry = _createOverlay();
          if (_overlayEntry != null) {
            Overlay.of(this.context).insert(_overlayEntry!);
            _animationController.forward();
            setState(() {
              _isOpen = true;
            });
            _attachScrollListener();
          }
        });
      } else {
        // Fallback for when context is not available
        if (!mounted || _isOpen || _isDisposed) return;
        _overlayEntry = _createOverlay();
        if (_overlayEntry != null) {
          Overlay.of(this.context).insert(_overlayEntry!);
          _animationController.forward();
          setState(() {
            _isOpen = true;
          });
          _attachScrollListener();
        }
      }
    });
  }

  void _hideOverlay() {
    if (!_isOpen || _isDisposed) return;
    
    _debounceTimer?.cancel();
    
    if (_animationController.isAnimating) {
      _animationController.stop();
    }
    
    _animationController.reverse().then((_) {
      if (!_isDisposed) {
        _overlayEntry?.remove();
        _overlayEntry = null;
        if (mounted) {
          setState(() {
            _isOpen = false;
            _isUpdating = false;
          });
        }
      }
    });
  _detachScrollListener();
  }

  void _hideOverlayImmediately() {
    _debounceTimer?.cancel();
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    if (mounted) {
      setState(() {
        _isOpen = false;
        _isUpdating = false;
      });
    }
  _detachScrollListener();
  }

  void _updateOverlay() {
    if (!_isOpen || _isDisposed) return;
    
    _overlayEntry?.remove();
    _overlayEntry = null;
    
    if (mounted && _isOpen && !_isDisposed) {
      _overlayEntry = _createOverlay();
      if (_overlayEntry != null) {
        Overlay.of(context).insert(_overlayEntry!);
      }
    }
  }

  OverlayEntry _createOverlay() {
    final renderBox = _fieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return OverlayEntry(builder: (_) => const SizedBox.shrink());
    final size = renderBox.size;
    final itemsCopy = List<T>.from(_filteredItems);
    final fieldOffset = renderBox.localToGlobal(Offset.zero);
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;
    final keyboardHeight = mediaQuery.viewInsets.bottom; // altura del teclado
    final topPadding = mediaQuery.padding.top;
    final spaceAbove = fieldOffset.dy - topPadding; // espacio útil arriba
    final spaceBelowAvailable = screenSize.height - keyboardHeight - (fieldOffset.dy + size.height);
    // Altura deseada basada en items (52 aprox por fila)
  // Estimación de altura: si sólo hay un ítem damos más espacio (multi‑línea / badges, etc.)
  final double perItemBase = itemsCopy.length == 1 ? 90.0 : 52.0;
  final desiredHeight = math.min(itemsCopy.length * perItemBase, widget.maxMenuHeight).toDouble();
    // Determinar si conviene abrir hacia arriba (cuando abajo no cabe por teclado)
    bool openUp = spaceBelowAvailable < desiredHeight && spaceAbove > spaceBelowAvailable;
    if (spaceBelowAvailable < 120 && spaceAbove > spaceBelowAvailable + 40) {
      openUp = true; // heurística extra cuando el espacio abajo es muy pequeño
    }
    final availableHeight = openUp
        ? math.max(0, spaceAbove - 8)
        : math.max(0, spaceBelowAvailable - 8);
    double effectiveHeight = math.min(desiredHeight, availableHeight).clamp(0, widget.maxMenuHeight).toDouble();
    // Permitir que se vea aunque sea una fracción de un item si el teclado ocupa casi todo
    const double minPixelsVisible = 36; // muestra parte de un item para indicar scroll
    if (effectiveHeight > 0 && effectiveHeight < minPixelsVisible) {
      effectiveHeight = math.min(minPixelsVisible, desiredHeight);
    }
    
  // itemsCopy ya definido arriba

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Barrier removed for consistency. Dropdown closes on focus change.
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: openUp ? Offset(0.0, -effectiveHeight) : Offset(0.0, size.height),
            child: AnimatedBuilder(
              animation: _expandAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _expandAnimation.value.clamp(0.0, 1.0),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(openUp ? 8 : 0),
                      bottom: Radius.circular(openUp ? 0 : 8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    animationDuration: Duration.zero,
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: effectiveHeight * _expandAnimation.value,
                        maxWidth: size.width,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(openUp ? 8 : 0),
                          bottom: Radius.circular(openUp ? 0 : 8),
                        ),
                        border: Border.all(
                          color: Theme.of(context).primaryColor.withAlpha((255 * 0.2).round()),
                          width: 1,
                        ),
                      ),
                      child: itemsCopy.isEmpty
                          ? SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, -0.1),
                                end: Offset.zero,
                              ).animate(_expandAnimation),
                              child: Container(
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
                              ),
                            )
                          : ClipRect(
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: itemsCopy.length,
                                itemBuilder: (context, index) {
                                  if (index >= itemsCopy.length) {
                                    return const SizedBox.shrink();
                                  }
                                  
                                  final item = itemsCopy[index];
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: Offset(0, -0.1 * (index + 1).clamp(0, 5)),
                                      end: Offset.zero,
                                    ).animate(
                                      CurvedAnimation(
                                        parent: _animationController,
                                        curve: Interval(
                                          (index * 0.1).clamp(0.0, 0.5),
                                          ((index * 0.1) + 0.5).clamp(0.5, 1.0),
                                          curve: Curves.easeOut,
                                        ),
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        if (!mounted || _isDisposed) return;
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
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final helperStyle = theme.inputDecorationTheme.helperStyle ?? theme.textTheme.bodySmall;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: TextFormField(
            key: _fieldKey,
            controller: widget.controller,
            focusNode: widget.focusNode,
            enabled: widget.enabled,
            validator: widget.validator,
            decoration: InputDecoration(
              labelText: widget.labelText,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.primaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: _isOpen
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.primaryColor.withAlpha((255 * 0.5).round()),
                        width: 2,
                      ),
                    )
                  : null,
              prefixIcon: widget.prefixIcon != null 
                  ? AnimatedRotation(
                      duration: const Duration(milliseconds: 300),
                      turns: _isOpen ? 0.1 : 0,
                      child: Icon(widget.prefixIcon),
                    )
                  : null,
              suffixIcon: GestureDetector(
                onTap: widget.enabled ? _toggleDropdown : null,
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 350),
                  turns: _isOpen ? 0.5 : 0,
                  curve: Curves.easeInOutBack,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: widget.enabled 
                        ? (_isOpen ? theme.primaryColor : null)
                        : Colors.grey,
                  ),
                ),
              ),
              enabled: widget.enabled,
              fillColor: widget.enabled ? null : Colors.grey.shade100,
              filled: !widget.enabled,
            ),
          ),
        ),
        if (widget.helperText != null && widget.helperText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4.0),
            child: Text(
              widget.helperText!,
              style: helperStyle?.copyWith(color: widget.focusNode.hasFocus ? theme.primaryColor : null),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    _debounceTimer?.cancel();
    widget.controller.removeListener(_onSearchChanged);
    widget.focusNode.removeListener(_onFocusChanged);
    _hideOverlayImmediately();
    _animationController.dispose();
    _detachScrollListener();
    super.dispose();
  }

  void _attachScrollListener() {
    if (_scrollAttached || !mounted) return;
    final scrollableState = Scrollable.of(context);
  _scrollPosition = scrollableState.position;
  _openScrollOffset = _scrollPosition!.pixels;
  _scrollPosition!.addListener(_onScrollChange);
  _scrollAttached = true;
  }

  void _detachScrollListener() {
    if (_scrollAttached && _scrollPosition != null) {
      _scrollPosition!.removeListener(_onScrollChange);
    }
    _scrollAttached = false;
    _scrollPosition = null;
    _openScrollOffset = null;
  }

  void _onScrollChange() {
    if (!_isOpen || _scrollPosition == null || _openScrollOffset == null) return;
    if ((_scrollPosition!.pixels - _openScrollOffset!).abs() > 4) {
      _hideOverlay();
    }
  }
}