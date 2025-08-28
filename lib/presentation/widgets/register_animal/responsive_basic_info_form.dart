import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/presentation/mixins/dropdown_manager_mixin.dart';
import 'package:sirega_app/presentation/widgets/shared/custom_typeahead_dropdown.dart';
import 'package:sirega_app/presentation/widgets/shared/json_data_loader.dart';

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

class ResponsiveBasicInfoFormState extends State<ResponsiveBasicInfoForm> 
    with DropdownManagerMixin {
  // Controllers
  final _nombreController = TextEditingController();
  final _fechaController = TextEditingController();
  final _razaTypeAheadController = TextEditingController();
  final _sexoTypeAheadController = TextEditingController();
  
  // FocusNode adicional para nombre
  final _nombreFocusNode = FocusNode();
  
  // Datos
  List<RazaBovina> _razas = [];
  RazaBovina? _razaSeleccionada;
  DateTime? _fechaNacimiento;
  Sexo _sexo = Sexo.hembra;

  // Override del mixin para proporcionar el callback
  @override
  VoidCallback? get onCloseAllDropdowns => widget.onCloseAllDropdowns;

  @override
  void initState() {
    super.initState();
    _sexo = widget.initialSexo;
    _sexoTypeAheadController.text = _getSexoDisplayName(_sexo);
    
    // Inicializar dropdowns usando el mixin
    initDropdown('raza');
    initDropdown('sexo');
    
    _cargarRazas();
    _setupListeners();
  }

  void _setupListeners() {
    // Listener para nombre
    _nombreController.addListener(() {
      widget.onNombreChanged(_nombreController.text);
    });
    
    // El campo nombre cierra todos los dropdowns al enfocarse con delay
    _nombreFocusNode.addListener(() {
      if (_nombreFocusNode.hasFocus) {
        // Usar delay para evitar conflictos con clicks en dropdowns
        closeAllDropdownsDelayed(delay: const Duration(milliseconds: 100));
      }
    });
  }

  Future<void> _cargarRazas() async {
    try {
      _razas = await JsonDataLoader.loadFromAsset(
        path: 'assets/data/razas_bovinos.json',
        fromJson: RazaBovina.fromJson,
      );
      if (mounted) {
        setState(() {});
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
    
    // Cerrar dropdown inmediatamente
    getDropdownFocusNode('raza')?.unfocus();
  }

  void _onSexoSeleccionado(Sexo sexo) {
    setState(() {
      _sexo = sexo;
      _sexoTypeAheadController.text = _getSexoDisplayName(sexo);
    });
    widget.onSexoChanged(sexo);
    
    // Cerrar dropdown inmediatamente
    getDropdownFocusNode('sexo')?.unfocus();
  }

  Future<void> _seleccionarFecha() async {
    // Cerrar todos los dropdowns antes de abrir date picker
    closeAllDropdowns();
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
        _fechaController.text = '${picked.day.toString().padLeft(2, '0')}-'
                               '${picked.month.toString().padLeft(2, '0')}-'
                               '${picked.year}';
      });
      widget.onFechaChanged(picked);
    }
  }

  // Método público para cerrar dropdowns (llamado desde parent)
  void closeDropdowns() {
    closeAllDropdowns();
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
          _buildSexoTypeAhead(),
          const SizedBox(height: 16),
          _buildFechaField(),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                _buildNombreField(),
                const SizedBox(height: 16),
                _buildSexoTypeAhead(),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                _buildRazaTypeAhead(),
                const SizedBox(height: 16),
                _buildFechaField(),
              ],
            ),
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
    );
  }

  Widget _buildRazaTypeAhead() {
    return CustomTypeAheadDropdown<RazaBovina>(
      controller: _razaTypeAheadController,
      focusNode: getDropdownFocusNode('raza')!,
      labelText: 'Raza',
      prefixIcon: Icons.category,
      helperText: 'Toque para seleccionar',
      isOpen: isDropdownOpen('raza'),
      onTap: () => toggleDropdown('raza'),
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
      emptyBuilder: Container(
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
    );
  }

  Widget _buildSexoTypeAhead() {
    return CustomTypeAheadDropdown<Sexo>(
      controller: _sexoTypeAheadController,
      focusNode: getDropdownFocusNode('sexo')!,
      labelText: 'Sexo',
      prefixIcon: Icons.pets,
      isOpen: isDropdownOpen('sexo'),
      onTap: () => toggleDropdown('sexo'),
      suggestionsCallback: (pattern) => Sexo.values,
      maxHeight: 150,
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
    _nombreFocusNode.dispose();
    
    // El mixin se encarga de dispose de los dropdownFocusNodes
    super.dispose();
  }
}
