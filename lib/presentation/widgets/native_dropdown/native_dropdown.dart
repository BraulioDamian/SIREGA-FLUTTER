import 'package:flutter/material.dart';
import 'dart:async';

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

class _NativeDropdownState<T> extends State<NativeDropdown<T>> 
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _fieldKey = GlobalKey();
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _fadeAnimation;
  bool _isDisposed = false;

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
    
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
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
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _isOpen || _isDisposed) return;
      
      _overlayEntry = _createOverlay();
      Overlay.of(context).insert(_overlayEntry!);
      _animationController.forward();
      setState(() {
        _isOpen = true;
      });
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
  }

  OverlayEntry _createOverlay() {
    final renderBox = _fieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return OverlayEntry(builder: (_) => const SizedBox.shrink());
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Barrier removed for consistency. Dropdown closes on focus change.
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height),
            child: AnimatedBuilder(
              animation: _expandAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _expandAnimation.value,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 250 * _expandAnimation.value,
                        maxWidth: size.width,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
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
    super.dispose();
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
  late Animation<double> _fadeAnimation;
  bool _isDisposed = false;

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
    
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
    
    _filteredItems = widget.items.take(50).toList();
    widget.controller.addListener(_onSearchChanged);
    widget.focusNode.addListener(_onFocusChanged);
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (!mounted || _isDisposed) return;
      
      final searchTerm = widget.controller.text.toLowerCase();
      
      _isUpdating = true;
      
      setState(() {
        if (searchTerm.isEmpty) {
          _filteredItems = List<T>.from(widget.items.take(50));
        } else {
          _filteredItems = List<T>.from(
            widget.items.where((item) {
              return widget.displayStringForOption(item)
                  .toLowerCase()
                  .contains(searchTerm);
            }).take(50)
          );
        }
      });
      
      if (_isOpen && mounted && !_isDisposed) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && _isOpen && !_isDisposed) {
            _updateOverlay();
          }
          _isUpdating = false;
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
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _isOpen || _isDisposed) return;
      
      _overlayEntry = _createOverlay();
      if (_overlayEntry != null) {
        Overlay.of(context).insert(_overlayEntry!);
        _animationController.forward();
        setState(() {
          _isOpen = true;
        });
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
  }

  void _updateOverlay() {
    if (!_isOpen || _isUpdating || _isDisposed) return;
    
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

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Barrier removed for consistency. Dropdown closes on focus change.
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height),
            child: AnimatedBuilder(
              animation: _expandAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _expandAnimation.value.clamp(0.0, 1.0),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAlias,
                    animationDuration: Duration.zero,
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 250 * _expandAnimation.value,
                        maxWidth: size.width,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
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
    super.dispose();
  }
}