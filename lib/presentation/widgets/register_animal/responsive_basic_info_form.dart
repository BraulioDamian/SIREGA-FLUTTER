import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';

class RazaBovina {
  final String nombre;
  final String origen;
  final String tipo;

  const RazaBovina({
    required this.nombre,
    required this.origen,
    required this.tipo,
  });

  factory RazaBovina.fromJson(Map<String, dynamic> json) {
    return RazaBovina(
      nombre: json['nombre'],
      origen: json['origen'],
      tipo: json['tipo'],
    );
  }

  @override
  String toString() => nombre;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RazaBovina &&
          runtimeType == other.runtimeType &&
          nombre == other.nombre;

  @override
  int get hashCode => nombre.hashCode;
}

class ResponsiveBasicInfoForm extends StatefulWidget {
  final Function(String) onNombreChanged;
  final Function(RazaBovina?) onRazaChanged;
  final Function(DateTime?) onFechaChanged;
  final Function(Sexo) onSexoChanged;
  final Sexo initialSexo;
  final VoidCallback? onCloseAllDropdowns;

  const ResponsiveBasicInfoForm({
    super.key,
    required this.onNombreChanged,
    required this.onRazaChanged,
    required this.onFechaChanged,
    required this.onSexoChanged,
    this.initialSexo = Sexo.hembra,
    this.onCloseAllDropdowns,
  });

  @override
  State<ResponsiveBasicInfoForm> createState() => ResponsiveBasicInfoFormState();
}

class ResponsiveBasicInfoFormState extends State<ResponsiveBasicInfoForm> {
  final _nombreController = TextEditingController();
  final _fechaController = TextEditingController();
  final _razaTypeAheadController = TextEditingController();
  final _sexoTypeAheadController = TextEditingController();
  
  // FocusNodes para control de foco
  final _nombreFocusNode = FocusNode();
  final _razaTypeAheadFocusNode = FocusNode();
  final _sexoTypeAheadFocusNode = FocusNode();
  
  List<RazaBovina> _razas = [];
  RazaBovina? _razaSeleccionada;
  DateTime? _fechaNacimiento;
  Sexo _sexo = Sexo.hembra;
  
  // Estados de dropdowns
  bool _isRazaDropdownOpen = false;
  bool _isSexoDropdownOpen = false;

  // Método público para cerrar dropdowns
  void closeDropdowns() {
    // La forma más robusta de cerrar es quitar el foco. Los listeners se encargarán del estado.
    if (_razaTypeAheadFocusNode.hasFocus) {
      _razaTypeAheadFocusNode.unfocus();
    }
    if (_sexoTypeAheadFocusNode.hasFocus) {
      _sexoTypeAheadFocusNode.unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
    _sexo = widget.initialSexo;
    _sexoTypeAheadController.text = _getSexoDisplayName(_sexo);
    _cargarRazas();
    _setupListeners();
  }

  void _setupListeners() {
    _nombreController.addListener(() {
      widget.onNombreChanged(_nombreController.text);
    });
    
    // Sincroniza el estado de los dropdowns con el foco de sus TypeAhead
    _razaTypeAheadFocusNode.addListener(_onRazaFocusChange);
    _sexoTypeAheadFocusNode.addListener(_onSexoFocusChange);

    // Cierra los dropdowns si se enfoca el campo de texto de nombre
    _nombreFocusNode.addListener(() {
      if (_nombreFocusNode.hasFocus) {
        closeDropdowns();
      }
    });
  }

  void _onRazaFocusChange() {
    if (mounted && _isRazaDropdownOpen != _razaTypeAheadFocusNode.hasFocus) {
      setState(() {
        _isRazaDropdownOpen = _razaTypeAheadFocusNode.hasFocus;
      });
    }
  }

  void _onSexoFocusChange() {
    if (mounted && _isSexoDropdownOpen != _sexoTypeAheadFocusNode.hasFocus) {
      setState(() {
        _isSexoDropdownOpen = _sexoTypeAheadFocusNode.hasFocus;
      });
    }
  }

  Future<void> _cargarRazas() async {
    try {
      final String data = await rootBundle.loadString('assets/data/razas_bovinos.json');
      final List<dynamic> razasJson = json.decode(data);
      
      if (mounted) {
        setState(() {
          _razas = razasJson.map((raza) => RazaBovina.fromJson(raza)).toList();
        });
      }
    } catch (e) {
      debugPrint('Error cargando razas: $e');
    }
  }

  void _onRazaSeleccionada(RazaBovina raza) {
    setState(() {
      _razaSeleccionada = raza;
      _razaTypeAheadController.text = raza.nombre;
    });
    widget.onRazaChanged(raza);
    
    // Quitar foco inmediatamente
    _razaTypeAheadFocusNode.unfocus();
  }

  void _onSexoSeleccionado(Sexo sexo) {
    setState(() {
      _sexo = sexo;
      _sexoTypeAheadController.text = _getSexoDisplayName(sexo);
    });
    widget.onSexoChanged(sexo);
    
    // Quitar foco inmediatamente
    _sexoTypeAheadFocusNode.unfocus();
  }

  Future<void> _seleccionarFecha() async {
    // Cerrar dropdowns antes de abrir date picker
    closeDropdowns();
    widget.onCloseAllDropdowns?.call();
    
    final picked = await showDatePicker(
      context: context,
      initialDate: _fechaNacimiento ?? DateTime.now().subtract(const Duration(days: 30)),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      locale: const Locale('es', 'ES'),
    );
    
    if (picked != null && mounted) {
      setState(() {
        _fechaNacimiento = picked;
        _fechaController.text = '${picked.day.toString().padLeft(2, '0')}/'
                               '${picked.month.toString().padLeft(2, '0')}/'
                               '${picked.year}';
      });
      widget.onFechaChanged(picked);
    }
  }

  void _toggleDropdownRaza() {
    widget.onCloseAllDropdowns?.call();
    
    // Lógica de toggle simplificada basada en el estado del foco.
    if (_razaTypeAheadFocusNode.hasFocus) {
      _razaTypeAheadFocusNode.unfocus();
    }
    else {
      // Asegurarse de que el teclado esté cerrado antes de abrir el dropdown.
      FocusScope.of(context).unfocus();
      // Pedir foco abrirá el TypeAhead. El listener actualizará el estado.
      _razaTypeAheadFocusNode.requestFocus();
    }
  }

  void _toggleDropdownSexo() {
    widget.onCloseAllDropdowns?.call();
    
    // Lógica de toggle simplificada basada en el estado del foco.
    if (_sexoTypeAheadFocusNode.hasFocus) {
      _sexoTypeAheadFocusNode.unfocus();
    } else {
      // Asegurarse de que el teclado esté cerrado antes de abrir el dropdown.
      FocusScope.of(context).unfocus();
      // Pedir foco abrirá el TypeAhead. El listener actualizará el estado.
      _sexoTypeAheadFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        
        return Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, isMobile),
                SizedBox(height: isMobile ? 12 : 16),
                _buildFormFields(isMobile),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Icon(
          Icons.info_outline,
          color: Theme.of(context).primaryColor,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Información Básica',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _buildNombreField(),
          const SizedBox(height: 16),
          _buildRazaTypeAhead(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildSexoTypeAhead()),
              const SizedBox(width: 12),
              Expanded(child: _buildFechaField()),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: _buildNombreField()),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: _buildRazaTypeAhead()),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildSexoTypeAhead()),
              const SizedBox(width: 16),
              Expanded(child: _buildFechaField()),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildNombreField() {
    return TextFormField(
      controller: _nombreController,
      focusNode: _nombreFocusNode,
      decoration: const InputDecoration(
        labelText: 'Nombre del Animal',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.pets),
        helperText: 'Nombre único identificativo',
      ),
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El nombre es requerido';
        }
        if (value.length < 2) {
          return 'El nombre debe tener al menos 2 caracteres';
        }
        return null;
      },
      // Removido onTap para permitir teclado normal
    );
  }

  Widget _buildRazaTypeAhead() {
    return GestureDetector(
      onTap: _toggleDropdownRaza,
      child: AbsorbPointer(
        child: TypeAheadField<RazaBovina>(
          controller: _razaTypeAheadController,
          focusNode: _razaTypeAheadFocusNode,
          builder: (context, controller, focusNode) {
            return TextFormField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: 'Raza',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.category),
                helperText: 'Toque para seleccionar',
                suffixIcon: Icon(
                  _isRazaDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ),
              readOnly: true,
            );
          },
          suggestionsCallback: (pattern) => _razas.take(50).toList(),
          itemBuilder: (context, raza) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    raza.nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          raza.tipo,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        raza.origen,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          onSelected: _onRazaSeleccionada,
          decorationBuilder: (context, child) {
            return Material(
              type: MaterialType.card,
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 250),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: child,
              ),
            );
          },
          offset: const Offset(0, 4),
          hideOnEmpty: false,
          hideOnError: false,
          hideOnLoading: false,
          hideOnSelect: true,
          emptyBuilder: (context) => Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.search_off, color: Colors.grey.shade400, size: 32),
                const SizedBox(height: 8),
                Text(
                  'No se encontraron razas',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSexoTypeAhead() {
    return GestureDetector(
      onTap: _toggleDropdownSexo,
      child: AbsorbPointer(
        child: TypeAheadField<Sexo>(
          controller: _sexoTypeAheadController,
          focusNode: _sexoTypeAheadFocusNode,
          builder: (context, controller, focusNode) {
            return TextFormField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: 'Sexo',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.pets),
                suffixIcon: Icon(
                  _isSexoDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ),
              readOnly: true,
            );
          },
          suggestionsCallback: (pattern) => Sexo.values,
          itemBuilder: (context, sexo) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Icon(
                    sexo == Sexo.macho ? Icons.male :
                    sexo == Sexo.hembra ? Icons.female : Icons.content_cut,
                    color: sexo == Sexo.macho ? Colors.blue :
                           sexo == Sexo.hembra ? Colors.pink : Colors.grey,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _getSexoDisplayName(sexo),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            );
          },
          onSelected: _onSexoSeleccionado,
          decorationBuilder: (context, child) {
            return Material(
              type: MaterialType.card,
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 150),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: child,
              ),
            );
          },
          offset: const Offset(0, 4),
          hideOnEmpty: true,
          hideOnError: true,
          hideOnLoading: false,
          hideOnSelect: true,
        ),
      ),
    );
  }

  Widget _buildFechaField() {
    return GestureDetector(
      onTap: _seleccionarFecha,
      child: AbsorbPointer(
        child: TextFormField(
          controller: _fechaController,
          decoration: const InputDecoration(
            labelText: 'Fecha de Nacimiento',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.calendar_today),
            suffixIcon: Icon(Icons.arrow_drop_down),
            helperText: 'Toque para seleccionar',
          ),
          validator: (value) {
            if (_fechaNacimiento == null) {
              return 'La fecha es requerida';
            }
            return null;
          },
        ),
      ),
    );
  }

  String _getSexoDisplayName(Sexo sexo) {
    switch (sexo) {
      case Sexo.macho:
        return 'Macho';
      case Sexo.hembra:
        return 'Hembra';
      case Sexo.castrado:
        return 'Castrado';
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _razaTypeAheadController.dispose();
    _sexoTypeAheadController.dispose();
    _fechaController.dispose();
    
    _razaTypeAheadFocusNode.removeListener(_onRazaFocusChange);
    _sexoTypeAheadFocusNode.removeListener(_onSexoFocusChange);

    _nombreFocusNode.dispose();
    _razaTypeAheadFocusNode.dispose();
    _sexoTypeAheadFocusNode.dispose();
    
    super.dispose();
  }
}