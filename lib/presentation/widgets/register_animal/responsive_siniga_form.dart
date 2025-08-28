import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sirega_app/nucleo/modelos/siniga_model.dart';

class EstadoMexico {
  final String clave;
  final String nombre;

  const EstadoMexico({
    required this.clave,
    required this.nombre,
  });

  factory EstadoMexico.fromJson(Map<String, dynamic> json) {
    return EstadoMexico(
      clave: json['clave'],
      nombre: json['nombre'],
    );
  }

  @override
  String toString() => nombre;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstadoMexico &&
          runtimeType == other.runtimeType &&
          clave == other.clave;

  @override
  int get hashCode => clave.hashCode;
}

class ResponsiveSinigaForm extends StatefulWidget {
  final Function(SinigaId?, bool) onSinigaChanged;
  final Function(String) onEstadoCodeChanged;
  final VoidCallback? onCloseAllDropdowns;

  const ResponsiveSinigaForm({
    super.key,
    required this.onSinigaChanged,
    required this.onEstadoCodeChanged,
    this.onCloseAllDropdowns,
  });

  @override
  State<ResponsiveSinigaForm> createState() => ResponsiveSinigaFormState();
}

class ResponsiveSinigaFormState extends State<ResponsiveSinigaForm> {
  final _especieController = TextEditingController(text: '00');
  final _estadoController = TextEditingController();
  final _numeroController = TextEditingController();
  final _estadoTypeAheadController = TextEditingController();
  
  // FocusNodes para control de foco
  final _estadoFocusNode = FocusNode();
  final _numeroFocusNode = FocusNode();
  final _estadoTypeAheadFocusNode = FocusNode();
  
  List<EstadoMexico> _estados = [];
  EstadoMexico? _estadoSeleccionado;
  SinigaId? _sinigaId;
  String? _validationMessage;
  bool _isValid = false;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _cargarEstados();
    _setupListeners();
  }

  void _setupListeners() {
    _especieController.addListener(_validarSiniga);
    _estadoController.addListener(_onEstadoChanged);
    _numeroController.addListener(_onNumeroChanged);
    
    // Sincroniza el estado del dropdown con el foco del TypeAhead
    _estadoTypeAheadFocusNode.addListener(_onTypeAheadFocusChange);

    // Cierra el dropdown si se enfoca uno de los campos de texto
    _estadoFocusNode.addListener(() {
      if (_estadoFocusNode.hasFocus) {
        _cerrarDropdowns();
      }
    });
    
    _numeroFocusNode.addListener(() {
      if (_numeroFocusNode.hasFocus) {
        _cerrarDropdowns();
      }
    });
  }

  void _onTypeAheadFocusChange() {
    if (mounted && _isDropdownOpen != _estadoTypeAheadFocusNode.hasFocus) {
      setState(() {
        _isDropdownOpen = _estadoTypeAheadFocusNode.hasFocus;
      });
    }
  }

  void _onEstadoChanged() {
    _validarSiniga();
    _autoSeleccionarEstado();
    
    // FIX: Solo saltar al siguiente campo si el usuario está escribiendo en el campo de código.
    if (_estadoController.text.length == 2 && _estadoFocusNode.hasFocus) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          _numeroFocusNode.requestFocus();
        }
      });
    }
  }
  void _onNumeroChanged() {
    _validarSiniga();
    
    if (_numeroController.text.length == 8) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          FocusScope.of(context).unfocus();
        }
      });
    }
  }

  void _cerrarDropdowns() {
    // La forma más robusta de cerrar es quitar el foco. El listener se encargará del estado.
    if (_estadoTypeAheadFocusNode.hasFocus) {
      _estadoTypeAheadFocusNode.unfocus();
    }
  }

  void closeDropdowns() {
    _cerrarDropdowns();
  }

  Future<void> _cargarEstados() async {
    try {
      final String data = await rootBundle.loadString('assets/data/estados_mexico.json');
      final List<dynamic> estadosJson = json.decode(data);
      
      if (mounted) {
        setState(() {
          _estados = estadosJson.map((estado) => EstadoMexico.fromJson(estado)).toList();
        });
      }
    } catch (e) {
      debugPrint('Error cargando estados: $e');
    }
  }

  void _autoSeleccionarEstado() {
    if (_estadoController.text.length == 2) {
      final codigo = _estadoController.text.padLeft(2, '0');
      final estado = _estados.where((e) => e.clave == codigo).firstOrNull;
      
      if (estado != null && _estadoSeleccionado?.clave != codigo) {
        setState(() {
          _estadoSeleccionado = estado;
          _estadoTypeAheadController.text = '${estado.clave} - ${estado.nombre}';
        });
        widget.onEstadoCodeChanged(codigo);
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('Estado seleccionado: ${estado.nombre}'),
                  ),
                ],
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
      } else if (_estadoController.text.length == 2 && estado == null) {
        // Código inválido - limpiar selección
        setState(() {
          _estadoSeleccionado = null;
          _estadoTypeAheadController.clear();
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text('Código de estado inválido: $codigo'),
                ],
              ),
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
      }
    } else {
      // Menos de 2 dígitos - limpiar selección
      if (_estadoSeleccionado != null || _estadoTypeAheadController.text.isNotEmpty) {
        setState(() {
          _estadoSeleccionado = null;
          _estadoTypeAheadController.clear();
        });
      }
    }
  }

  void _validarSiniga() {
    final especie = _especieController.text;
    final estado = _estadoController.text;
    final numero = _numeroController.text;
    
    if (especie.length != 2 || estado.length != 2 || numero.length != 8) {
      _updateValidation(null, false, 'Formato incompleto');
      return;
    }

    try {
      final rawId = '$especie$estado$numero';
      final siniga = SinigaId.fromString(rawId);
      
      String? mensaje;
      bool isValid = true;
      
      if (especie != '00') {
        mensaje = '❌ Código de especie inválido. Debe ser "00" para bovinos';
        isValid = false;
      } else if (!_esEstadoValido(estado)) {
        mensaje = '❌ Código de estado inválido ($estado)';
        isValid = false;
      } else if (!RegExp(r'^\d{8}$').hasMatch(numero)) {
        mensaje = '❌ Número nacional debe tener 8 dígitos numéricos';
        isValid = false;
      } else {
        final nombreEstado = _obtenerNombreEstado(estado);
        mensaje = '✅ ID SINIGA válido para bovino de $nombreEstado';
      }

      _updateValidation(siniga, isValid, mensaje);
    } catch (e) {
      _updateValidation(null, false, '❌ Error en formato SINIGA');
    }
  }

  void _updateValidation(SinigaId? siniga, bool isValid, String mensaje) {
    if (mounted) {
      setState(() {
        _sinigaId = siniga;
        _isValid = isValid;
        _validationMessage = mensaje;
      });
      widget.onSinigaChanged(siniga, isValid);
    }
  }

  bool _esEstadoValido(String codigo) {
    return _estados.any((estado) => estado.clave == codigo);
  }

  String _obtenerNombreEstado(String codigo) {
    final estado = _estados.where((estado) => estado.clave == codigo).firstOrNull;
    return estado?.nombre ?? 'Desconocido';
  }

  void _onEstadoSeleccionado(EstadoMexico estado) {
    setState(() {
      _estadoSeleccionado = estado;
      _estadoController.text = estado.clave;
      _estadoTypeAheadController.text = '${estado.clave} - ${estado.nombre}';
    });
    widget.onEstadoCodeChanged(estado.clave);
    
    // Quitar foco inmediatamente. Esto cerrará el dropdown y disparará el listener de foco.
    _estadoTypeAheadFocusNode.unfocus();
  }

  void _toggleDropdownEstado() {
    widget.onCloseAllDropdowns?.call();
    
    // FIX: Lógica de toggle simplificada basada en el estado del foco.
    // Esto soluciona el bug de no poder cerrar el dropdown con un segundo clic.
    if (_estadoTypeAheadFocusNode.hasFocus) {
      _estadoTypeAheadFocusNode.unfocus();
    } else {
      // Asegurarse de que el teclado esté cerrado antes de abrir el dropdown.
      FocusScope.of(context).unfocus();
      // Pedir foco abrirá el TypeAhead. El listener actualizará el estado _isDropdownOpen.
      _estadoTypeAheadFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        
        return Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, isMobile),
                SizedBox(height: isMobile ? 8 : 12),
                _buildDescription(context, isMobile),
                SizedBox(height: isMobile ? 12 : 16),
                _buildSinigaFields(isMobile, isTablet),
                SizedBox(height: isMobile ? 12 : 16),
                _buildEstadoTypeAhead(),
                if (_validationMessage != null) ...[
                  SizedBox(height: isMobile ? 12 : 16),
                  _buildValidationMessage(isMobile),
                ],
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
          Icons.pets, 
          color: Theme.of(context).primaryColor,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Identificación SINIGA (Obligatorio)',
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

  Widget _buildDescription(BuildContext context, bool isMobile) {
    return Text(
      'Formato: Especie (2) + Estado (2) + Número Nacional (8)',
      style: TextStyle(
        fontSize: isMobile ? 12 : 14, 
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget _buildSinigaFields(bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(flex: 1, child: _buildEspecieField()),
              const SizedBox(width: 8),
              Expanded(flex: 1, child: _buildEstadoField()),
            ],
          ),
          const SizedBox(height: 12),
          _buildNumeroField(),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(flex: 2, child: _buildEspecieField()),
          const SizedBox(width: 8),
          Expanded(flex: 2, child: _buildEstadoField()),
          const SizedBox(width: 8),
          Expanded(flex: 4, child: _buildNumeroField()),
        ],
      );
    }
  }

  Widget _buildEspecieField() {
    return TextFormField(
      controller: _especieController,
      decoration: const InputDecoration(
        labelText: 'Especie',
        helperText: '00 = Bovinos',
        border: OutlineInputBorder(),
        counterText: '',
      ),
      maxLength: 2,
      readOnly: true,
      style: const TextStyle(
        fontFamily: 'monospace', 
        fontSize: 16, 
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEstadoField() {
    return TextFormField(
      controller: _estadoController,
      focusNode: _estadoFocusNode,
      decoration: InputDecoration(
        labelText: 'Estado',
        helperText: _estadoController.text.length == 2 
            ? '✓ Completo - Saltando...' 
            : 'Código INEGI',
        helperStyle: TextStyle(
          color: _estadoController.text.length == 2 
              ? Colors.green 
              : null,
          fontWeight: _estadoController.text.length == 2 
              ? FontWeight.bold 
              : null,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: _estadoController.text.length == 2 
                ? Colors.green 
                : Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _estadoController.text.length == 2 
                ? Colors.green 
                : Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        counterText: '',
      ),
      maxLength: 2,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(2),
      ],
      style: const TextStyle(
        fontFamily: 'monospace', 
        fontSize: 16, 
        fontWeight: FontWeight.bold,
      ),
      validator: (v) => (v == null || v.length != 2) ? 'Requerido' : null,
      // Removido onTap para permitir teclado normal
    );
  }

  Widget _buildNumeroField() {
    return TextFormField(
      controller: _numeroController,
      focusNode: _numeroFocusNode,
      decoration: InputDecoration(
        labelText: 'Número Nacional',
        helperText: _numeroController.text.length == 8 
            ? '✓ Completo - Cerrando teclado...' 
            : '8 dígitos únicos',
        helperStyle: TextStyle(
          color: _numeroController.text.length == 8 
              ? Colors.green 
              : null,
          fontWeight: _numeroController.text.length == 8 
              ? FontWeight.bold 
              : null,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: _numeroController.text.length == 8 
                ? Colors.green 
                : Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _numeroController.text.length == 8 
                ? Colors.green 
                : Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        counterText: '',
      ),
      maxLength: 8,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: const TextStyle(
        fontFamily: 'monospace', 
        fontSize: 16, 
        fontWeight: FontWeight.bold,
      ),
      validator: (v) => (v == null || v.length != 8) ? 'Requerido' : null,
      // Removido onTap para permitir teclado normal
    );
  }

  Widget _buildEstadoTypeAhead() {
    return GestureDetector(
      onTap: _toggleDropdownEstado,
      child: AbsorbPointer(
        child: TypeAheadField<EstadoMexico>(
          controller: _estadoTypeAheadController,
          focusNode: _estadoTypeAheadFocusNode,
          builder: (context, controller, focusNode) {
            return TextFormField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: 'Seleccionar Estado',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.location_on),
                helperText: 'Toque para seleccionar',
                suffixIcon: Icon(
                  _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ),
              readOnly: true,
            );
          },
          suggestionsCallback: (pattern) => _estados,
          itemBuilder: (context, estado) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      estado.clave,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      estado.nombre,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            );
          },
          onSelected: _onEstadoSeleccionado,
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
          hideOnEmpty: true,
          hideOnError: true,
          hideOnLoading: false,
          hideOnSelect: true,
        ),
      ),
    );
  }

  Widget _buildValidationMessage(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 10 : 12),
      decoration: BoxDecoration(
        color: _isValid 
          ? Colors.green.withValues(alpha: 0.1)
          : Colors.red.withValues(alpha: 0.1),
        border: Border.all(
          color: _isValid ? Colors.green : Colors.red,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            _isValid ? Icons.check_circle : Icons.error,
            color: _isValid ? Colors.green : Colors.red,
            size: isMobile ? 20 : 24,
          ),
          SizedBox(width: isMobile ? 6 : 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _validationMessage!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 13 : 14,
                    color: _isValid ? Colors.green.shade700 : Colors.red.shade700,
                  ),
                ),
                if (_isValid && _sinigaId != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'ID Completo: ${_sinigaId!.formatoVisual}',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _especieController.dispose();
    _estadoController.dispose();
    _numeroController.dispose();
    _estadoTypeAheadController.dispose();
    
    _estadoTypeAheadFocusNode.removeListener(_onTypeAheadFocusChange);
    _estadoFocusNode.dispose();
    _numeroFocusNode.dispose();
    _estadoTypeAheadFocusNode.dispose();
    
    super.dispose();
  }
}
