import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/modelos/siniga_model.dart';
import 'package:sirega_app/presentation/widgets/shared/json_data_loader.dart';

// Modelos locales para el formulario
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

/// Controlador centralizado para el formulario de animales
/// Puede ser usado tanto para crear como para editar
class AnimalFormController extends ChangeNotifier {
  // Modo del formulario
  final bool isEditMode;
  final Animal? animalOriginal;
  
  // Controllers de texto
  late final TextEditingController nombreController;
  late final TextEditingController especieController;
  late final TextEditingController estadoController;
  late final TextEditingController numeroController;
  late final TextEditingController fechaController;
  late final TextEditingController nfcController;
  
  // Controllers para los dropdowns (para evitar crearlos en el build)
  late final TextEditingController razaDisplayController;
  late final TextEditingController sexoDisplayController;
  late final TextEditingController estadoDisplayController;

  // Focus Nodes
  final FocusNode nombreFocus = FocusNode();
  final FocusNode estadoFocus = FocusNode();
  final FocusNode numeroFocus = FocusNode();
  final FocusNode razaFocus = FocusNode();
  final FocusNode sexoFocus = FocusNode();
  final FocusNode estadoDropdownFocus = FocusNode();
  
  // Estados seleccionados
  RazaBovina? _razaSeleccionada;
  EstadoMexico? _estadoSeleccionado;
  Sexo _sexo = Sexo.hembra;
  DateTime? _fechaNacimiento;
  File? _imageFile;
  
  // Validación SINIGA
  SinigaId? _sinigaId;
  bool _sinigaIsValid = false;
  String? _sinigaValidationMessage;
  
  // Validación NFC
  String? _nfcId;
  
  // Listas de datos
  List<RazaBovina> _razas = [];
  List<EstadoMexico> _estados = [];
  
  // Estado de carga
  bool _isLoading = false;
  final bool _isSaving = false;
  
  // Getters
  RazaBovina? get razaSeleccionada => _razaSeleccionada;
  EstadoMexico? get estadoSeleccionado => _estadoSeleccionado;
  Sexo get sexo => _sexo;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  File? get imageFile => _imageFile;
  bool get sinigaIsValid => _sinigaIsValid;
  String? get sinigaValidationMessage => _sinigaValidationMessage;
  SinigaId? get sinigaId => _sinigaId;
  String? get nfcId => _nfcId;
  List<RazaBovina> get razas => _razas;
  List<EstadoMexico> get estados => _estados;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  
  // Validación general del formulario
  bool get isFormValid => 
      _sinigaIsValid && 
      _nfcId != null && 
      _nfcId!.isNotEmpty;
  
  bool get canSave => isFormValid && !_isSaving;
  
  AnimalFormController({
    this.isEditMode = false,
    this.animalOriginal,
  }) {
    _initializeControllers();
    _loadData();
    _setupListeners();
  }
  
  void _initializeControllers() {
    // Inicializar con valores por defecto o del animal existente
    nombreController = TextEditingController(
      text: animalOriginal?.nombre ?? ''
    );
    especieController = TextEditingController(text: '00');
    estadoController = TextEditingController();
    numeroController = TextEditingController();
    fechaController = TextEditingController();
    nfcController = TextEditingController(
      text: animalOriginal?.idAreteNFC ?? ''
    );
    
    razaDisplayController = TextEditingController();
    sexoDisplayController = TextEditingController();
    estadoDisplayController = TextEditingController();
    
    // Si es modo edición, cargar los datos del animal
    if (isEditMode && animalOriginal != null) {
      _loadAnimalData();
    } else {
      // Valores por defecto para creación
      sexoDisplayController.text = _getSexoDisplayName(_sexo);
    }
  }
  
  void _loadAnimalData() {
    if (animalOriginal == null) return;
    
    // Cargar SINIGA
    if (animalOriginal!.siniigaId != null) {
      _sinigaId = animalOriginal!.siniigaId;
      final sinigaStr = _sinigaId!.fullId;
      if (sinigaStr.length == 12) {
        estadoController.text = sinigaStr.substring(2, 4);
        numeroController.text = sinigaStr.substring(4, 12);
        _sinigaIsValid = true;
        _sinigaValidationMessage = '✅ ID SINIGA válido';
      }
    }
    
    // Cargar otros datos
    _sexo = animalOriginal!.sexo;
    _fechaNacimiento = animalOriginal!.fechaNacimiento;
    _nfcId = animalOriginal!.idAreteNFC;
    
    if (_fechaNacimiento != null) {
      fechaController.text = '${_fechaNacimiento!.day.toString().padLeft(2, '0')}-'
                            '${_fechaNacimiento!.month.toString().padLeft(2, '0')}-'
                            '${_fechaNacimiento!.year}';
    }
    sexoDisplayController.text = _getSexoDisplayName(animalOriginal!.sexo);
  }
  
  Future<void> _loadData() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      // Cargar razas y estados en paralelo
      final results = await Future.wait([
        JsonDataLoader.loadFromAsset<RazaBovina>(
          path: 'assets/data/razas_bovinos.json',
          fromJson: RazaBovina.fromJson,
        ),
        JsonDataLoader.loadFromAsset<EstadoMexico>(
          path: 'assets/data/estados_mexico.json',
          fromJson: EstadoMexico.fromJson,
        ),
      ]);
      
      _razas = results[0] as List<RazaBovina>;
      _estados = results[1] as List<EstadoMexico>;
      
      // Si es modo edición, buscar la raza y estado seleccionados
      if (isEditMode && animalOriginal != null) {
        // Cargar raza
        final matchingRaza = _razas.where((r) => r.nombre == animalOriginal!.raza);
        if (matchingRaza.isNotEmpty) {
          _razaSeleccionada = matchingRaza.first;
        } else {
          _razaSeleccionada = _razas.isNotEmpty ? _razas.first : null;
        }
        razaDisplayController.text = _razaSeleccionada?.nombre ?? '';

        // Cargar estado
        final estadoClave = animalOriginal?.siniigaId?.estadoClave;
        if (estadoClave != null) {
          final matchingEstado = _estados.where((e) => e.clave == estadoClave);
          if (matchingEstado.isNotEmpty) {
            final estado = matchingEstado.first;
            _estadoSeleccionado = estado;
            estadoDisplayController.text = '${estado.clave} - ${estado.nombre}';
          }
        }
      }
    } catch (e) {
      debugPrint('Error cargando datos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  void _setupListeners() {
    // Listener para estado SINIGA
    estadoController.addListener(_onEstadoChanged);
    numeroController.addListener(_onNumeroChanged);
    
    // Auto-navegación cuando se completan campos
    estadoFocus.addListener(() {
      if (estadoFocus.hasFocus && estadoController.text.length == 2) {
        Future.delayed(const Duration(milliseconds: 100), () {
          numeroFocus.requestFocus();
        });
      }
    });
    
    numeroFocus.addListener(() {
      if (numeroFocus.hasFocus && numeroController.text.length == 8) {
        Future.delayed(const Duration(milliseconds: 100), () {
          numeroFocus.unfocus();
        });
      }
    });
  }
  
  void _onEstadoChanged() {
    _validarSiniga();
    _autoSeleccionarEstado();
  }
  
  void _onNumeroChanged() {
    _validarSiniga();
  }
  
  void _autoSeleccionarEstado() {
    if (estadoController.text.length == 2) {
      final codigo = estadoController.text.padLeft(2, '0');
      final estado = _estados.where((e) => e.clave == codigo).firstOrNull;
      
      if (estado != null && _estadoSeleccionado?.clave != codigo) {
        setEstadoSeleccionado(estado);
      } else if (estado == null) {
        _estadoSeleccionado = null;
        estadoDisplayController.clear();
        notifyListeners();
      }
    } else {
      if (_estadoSeleccionado != null) {
        _estadoSeleccionado = null;
        estadoDisplayController.clear();
        notifyListeners();
      }
    }
  }
  
  void _validarSiniga() {
    final especie = especieController.text;
    final estado = estadoController.text;
    final numero = numeroController.text;
    
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
      } else if (!RegExp(r'^\d{8}').hasMatch(numero)) {
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
    _sinigaId = siniga;
    _sinigaIsValid = isValid;
    _sinigaValidationMessage = mensaje;
    notifyListeners();
  }
  
  bool _esEstadoValido(String codigo) {
    return _estados.any((estado) => estado.clave == codigo);
  }
  
  String _obtenerNombreEstado(String codigo) {
    final estado = _estados.where((estado) => estado.clave == codigo).firstOrNull;
    return estado?.nombre ?? 'Desconocido';
  }
  
  // Métodos públicos para actualizar el estado
  
  void setNombre(String nombre) {
    nombreController.text = nombre;
    notifyListeners();
  }
  
  void setRaza(RazaBovina? raza) {
    _razaSeleccionada = raza;
    razaDisplayController.text = raza?.nombre ?? '';
    notifyListeners();
  }
  
  void setSexo(Sexo sexo) {
    _sexo = sexo;
    sexoDisplayController.text = _getSexoDisplayName(sexo);
    notifyListeners();
  }
  
  void setFechaNacimiento(DateTime? fecha) {
    _fechaNacimiento = fecha;
    if (fecha != null) {
      fechaController.text = '${fecha.day.toString().padLeft(2, '0')}-'
                            '${fecha.month.toString().padLeft(2, '0')}-'
                            '${fecha.year}';
    } else {
      fechaController.clear();
    }
    notifyListeners();
  }
  
  void setEstadoSeleccionado(EstadoMexico estado) {
    _estadoSeleccionado = estado;
    estadoController.text = estado.clave;
    estadoDisplayController.text = '${estado.clave} - ${estado.nombre}';
    notifyListeners();
  }
  
  void setNfcId(String? nfcId) {
    _nfcId = nfcId;
    nfcController.text = nfcId ?? '';
    notifyListeners();
  }
  
  void setImageFile(File? file) {
    _imageFile = file;
    notifyListeners();
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
  
  // Método para construir el objeto Animal
  Animal buildAnimal() {
    final animal = animalOriginal ?? Animal();
    
    return animal
      ..nombre = nombreController.text.trim().isNotEmpty 
          ? nombreController.text.trim() 
          : 'Sin nombre'
      ..raza = _razaSeleccionada?.nombre ?? 'Sin especificar'
      ..sexo = _sexo
      ..fechaNacimiento = _fechaNacimiento ?? DateTime.now()
      ..idAreteNFC = _nfcId
      ..siniigaId = _sinigaId
      ..fotoPerfilUrl = _imageFile?.path ?? animalOriginal?.fotoPerfilUrl;
  }
  
  // Método para resetear el formulario
  void reset() {
    nombreController.clear();
    estadoController.clear();
    numeroController.clear();
    fechaController.clear();
    nfcController.clear();
    
    razaDisplayController.clear();
    sexoDisplayController.clear();
    estadoDisplayController.clear();

    _razaSeleccionada = null;
    _estadoSeleccionado = null;
    _sexo = Sexo.hembra;
    _fechaNacimiento = null;
    _imageFile = null;
    _sinigaId = null;
    _sinigaIsValid = false;
    _sinigaValidationMessage = null;
    _nfcId = null;
    
    notifyListeners();
  }
  
  @override
  void dispose() {
    nombreController.dispose();
    especieController.dispose();
    estadoController.dispose();
    numeroController.dispose();
    fechaController.dispose();
    nfcController.dispose();
    
    razaDisplayController.dispose();
    sexoDisplayController.dispose();
    estadoDisplayController.dispose();

    nombreFocus.dispose();
    estadoFocus.dispose();
    numeroFocus.dispose();
    razaFocus.dispose();
    sexoFocus.dispose();
    estadoDropdownFocus.dispose();
    
    super.dispose();
  }
}
