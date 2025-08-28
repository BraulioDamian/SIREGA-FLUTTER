// lib/presentation/mixins/dropdown_manager_mixin.dart

import 'package:flutter/material.dart';

/// Un mixin para gestionar el estado y el foco de múltiples dropdowns en un StatefulWidget.
mixin DropdownManagerMixin<T extends StatefulWidget> on State<T> {
  final Map<String, FocusNode> _dropdownFocusNodes = {};
  final Map<String, bool> _dropdownStates = {};

  /// Registra un nuevo dropdown para ser gestionado por el mixin.
  /// Debe ser llamado en initState() para cada dropdown.
  void initDropdown(String key) {
    _dropdownFocusNodes[key] = FocusNode();
    _dropdownStates[key] = false;
    // IMPORTANTE: Hemos eliminado el listener del FocusNode que causaba el conflicto.
  }

  /// Devuelve si un dropdown específico está abierto.
  bool isDropdownOpen(String key) {
    return _dropdownStates[key] ?? false;
  }

  /// Devuelve el FocusNode para un dropdown específico.
  FocusNode? getDropdownFocusNode(String key) {
    return _dropdownFocusNodes[key];
  }

  /// La lógica principal para alternar el estado de un dropdown.
  void toggleDropdown(String key) {
    final bool wasOpen = isDropdownOpen(key);

    // Siempre cerramos todo primero. Esto simplifica la lógica.
    closeAllDropdowns();

    // Si NO estaba abierto, esperamos un instante y lo abrimos.
    // Si SÍ estaba abierto, la acción anterior ya lo cerró y no hacemos nada más.
    if (!wasOpen) {
      // Pequeña espera para que la UI se actualice y no haya conflictos.
      Future.delayed(const Duration(milliseconds: 50), () {
        if (mounted) {
          _openDropdown(key);
        }
      });
    }
  }

  /// Función interna para abrir un dropdown específico.
  void _openDropdown(String key) {
    if (mounted) {
      setState(() {
        _dropdownStates[key] = true;
      });
      _dropdownFocusNodes[key]?.requestFocus();
    }
  }

  /// Cierra todos los dropdowns gestionados por este mixin.
  void closeAllDropdowns() {
    if (mounted) {
      setState(() {
        for (var key in _dropdownStates.keys) {
          _dropdownStates[key] = false;
        }
      });
      // Desenfocamos todos los nodos después de actualizar el estado.
      for (var node in _dropdownFocusNodes.values) {
        if (node.hasFocus) {
          node.unfocus();
        }
      }
    }
  }

  /// Cierra todos los dropdowns después de un breve retraso.
  void closeAllDropdownsDelayed({Duration delay = const Duration(milliseconds: 150)}) {
    Future.delayed(delay, () {
      closeAllDropdowns();
    });
  }

  @override
  void dispose() {
    // Limpia todos los FocusNodes para evitar fugas de memoria.
    for (var node in _dropdownFocusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }
}