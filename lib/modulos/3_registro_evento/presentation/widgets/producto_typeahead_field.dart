import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sirega_app/core/theme/app_colors.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

/// Product autocomplete field with styled suggestions and add-new option.
class ProductoTypeAheadField extends StatelessWidget {
  final TextEditingController controller;
  final TipoEvento tipoEvento;
  final Color accentColor;
  final InputDecoration baseDecoration;
  final Future<String?> Function(BuildContext context) onAddNewProduct;
  final VoidCallback onChanged;

  const ProductoTypeAheadField({
    super.key,
    required this.controller,
    required this.tipoEvento,
    required this.accentColor,
    required this.baseDecoration,
    required this.onAddNewProduct,
    required this.onChanged,
  });

  static const Map<TipoEvento, List<String>> _sugerencias = {
    TipoEvento.vacuna: [
      'Complejo Respiratorio (IBR, DVB, PI3, VRSB)',
      'Clostridial 8 vías',
      'Rabia Paralítica (Derriengue)',
      'Brucelosis Cepa RB51',
      'Leptospirosis',
      'Fiebre Aftosa',
    ],
    TipoEvento.desparasitante: [
      'Ivermectina',
      'Doramectina',
      'Fenbendazol',
      'Albendazol',
      'Eprinomectina (sin retiro en leche)',
      'Baño de Inmersión (Garrapaticida)',
      'Pour-on (Mosquicida/Garrapaticida)',
    ],
    TipoEvento.tratamiento: [
      'Antibiótico (Penicilina)',
      'Antibiótico (Oxitetraciclina)',
      'Antiinflamatorio (Flunixin)',
      'Suero vitaminado',
      'Calcio',
    ],
  };

  static const Map<TipoEvento, List<String>> _refuerzos = {
    TipoEvento.vacuna: [
      'Refuerzo Anual Complejo Respiratorio',
      'Refuerzo Semestral Clostridial',
    ],
    TipoEvento.desparasitante: [
      'Rotación de Desparasitante (Semestral)',
    ],
  };

  String get _labelText {
    switch (tipoEvento) {
      case TipoEvento.vacuna:
        return 'Vacuna *';
      case TipoEvento.desparasitante:
        return 'Desparasitante *';
      case TipoEvento.tratamiento:
        return 'Medicamento *';
      default:
        return 'Producto *';
    }
  }

  String get _hintText {
    switch (tipoEvento) {
      case TipoEvento.vacuna:
        return 'Ej. Clostridial 8 vías';
      case TipoEvento.desparasitante:
        return 'Ej. Ivermectina 1%';
      case TipoEvento.tratamiento:
        return 'Ej. Oxitetraciclina LA';
      default:
        return 'Buscar producto';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      hideOnUnfocus: true,
      debounceDuration: const Duration(milliseconds: 200),
      builder: (context, typeAheadController, focusNode) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: baseDecoration.copyWith(
            labelText: _labelText,
            hintText: _hintText,
            prefixIcon: Icon(Icons.inventory_2_outlined, color: accentColor),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear_rounded, size: 20),
                    onPressed: () {
                      controller.clear();
                      onChanged();
                    },
                  )
                : null,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Este campo es obligatorio';
            }
            return null;
          },
        );
      },
      suggestionsCallback: (pattern) {
        final suggestions = _sugerencias[tipoEvento] ?? [];
        final reinforcements = _refuerzos[tipoEvento] ?? [];
        final allProducts = [...suggestions, ...reinforcements];

        List<String> filtered = [];
        if (pattern.isEmpty) {
          filtered = allProducts;
        } else {
          filtered = allProducts
              .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
              .toList();
        }

        filtered.add("➕ Registrar nuevo producto");
        return filtered;
      },
      decorationBuilder: (context, child) {
        return Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          color: AppColors.surface,
          child: child,
        );
      },
      itemBuilder: (context, suggestion) {
        if (suggestion == "➕ Registrar nuevo producto") {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.divider)),
            ),
            child: Row(
              children: [
                Icon(Icons.add_circle_outline_rounded, color: accentColor, size: 22),
                const SizedBox(width: 12),
                Text(
                  'Registrar nuevo producto',
                  style: TextStyle(color: accentColor, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(Icons.medication_rounded, size: 20, color: AppColors.textSecondary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  suggestion,
                  style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
                ),
              ),
            ],
          ),
        );
      },
      onSelected: (suggestion) async {
        if (suggestion == "➕ Registrar nuevo producto") {
          final newProduct = await onAddNewProduct(context);
          if (newProduct != null && newProduct.isNotEmpty) {
            controller.text = newProduct;
          } else {
            controller.clear();
          }
        } else {
          controller.text = suggestion;
        }
        if (!context.mounted) return;
        FocusScope.of(context).unfocus();
        onChanged();
      },
    );
  }
}
