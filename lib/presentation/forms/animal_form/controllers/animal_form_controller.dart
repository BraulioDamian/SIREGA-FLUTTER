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

  // Controllers para displays de dropdowns
  late final TextEditingController razaDisplayController;
  late final TextEditingController sexoDisplayController;
  late final TextEditingController estadoDisplayController;

  // Controllers adicionales para edición completa
  late final TextEditingController idAreteVisualController;
  late final TextEditingController numeroHerradoController;
  late final TextEditingController colorPelajeController;
  late final TextEditingController senasParticularesController;
  late final TextEditingController pesoNacimientoController;
  late final TextEditingController pesoActualController;
  late final TextEditingController zonaActualController;
  late final TextEditingController descripcionSaludController;

  // Focus Nodes
  final FocusNode nombreFocus = FocusNode();
  final FocusNode estadoFocus = FocusNode();
  final FocusNode numeroFocus = FocusNode();
  final FocusNode razaFocus = FocusNode();
  final FocusNode sexoFocus = FocusNode();
  final FocusNode estadoDropdownFocus = FocusNode();
  
  // Control de navegación automática
  bool _autoNavigationEnabled = true;
  bool _isEditingEstado = false;
  bool _isEditingNumero = false;
  
  // Estados seleccionados
  RazaBovina? _razaSeleccionada;
  EstadoMexico? _estadoSeleccionado;
  Sexo _sexo = Sexo.hembra;
  DateTime? _fechaNacimiento;
  File? _imageFile;

  // Estados adicionales para edición completa
  EstadoAnimal _estadoAnimal = EstadoAnimal.activo;
  EstadoSalud _estadoSalud = EstadoSalud.sano;
  EstadoReproductivo? _estadoReproductivo;
  bool _gestante = false;
  
  // Validación SINIGA
  SinigaId? _sinigaId;
  bool _sinigaIsValid = false;
  String? _sinigaValidationMessage;
  
  // Validación NFC
  String? _nfcId; // ID completo del arete (puede incluir SINIGA)
  String? _pureNfcId; // Solo el ID del chip NFC
  
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

  // Getters adicionales para campos extendidos
  EstadoAnimal get estadoAnimal => _estadoAnimal;
  EstadoSalud get estadoSalud => _estadoSalud;
  EstadoReproductivo? get estadoReproductivo => _estadoReproductivo;
  bool get gestante => _gestante;
  
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

    // Inicializar controllers de display
    razaDisplayController = TextEditingController();
    sexoDisplayController = TextEditingController(text: _getSexoDisplayName(Sexo.hembra));
    estadoDisplayController = TextEditingController();

    // Inicializar controllers adicionales
    idAreteVisualController = TextEditingController(
      text: animalOriginal?.idAreteVisual ?? ''
    );
    numeroHerradoController = TextEditingController(
      text: animalOriginal?.numeroHerrado ?? ''
    );
    colorPelajeController = TextEditingController(
      text: animalOriginal?.colorPelaje ?? ''
    );
    senasParticularesController = TextEditingController(
      text: animalOriginal?.senasParticulares ?? ''
    );
    pesoNacimientoController = TextEditingController(
      text: animalOriginal?.pesoNacimiento?.toString() ?? ''
    );
    pesoActualController = TextEditingController(
      text: animalOriginal?.pesoActual?.toString() ?? ''
    );
    zonaActualController = TextEditingController(
      text: animalOriginal?.zonaActual ?? ''
    );
    descripcionSaludController = TextEditingController(
      text: animalOriginal?.descripcionSalud ?? ''
    );

    // Si es modo edición, cargar los datos del animal
    if (isEditMode && animalOriginal != null) {
      _loadAnimalData();
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

    // Cargar datos básicos
    _sexo = animalOriginal!.sexo;
    sexoDisplayController.text = _getSexoDisplayName(_sexo);
    _fechaNacimiento = animalOriginal!.fechaNacimiento;
    _nfcId = animalOriginal!.idAreteNFC;

    if (_fechaNacimiento != null) {
      fechaController.text = '${_fechaNacimiento!.day.toString().padLeft(2, '0')}-'
                            '${_fechaNacimiento!.month.toString().padLeft(2, '0')}-'
                            '${_fechaNacimiento!.year}';
    }

    // Cargar datos extendidos
    _estadoAnimal = animalOriginal!.estado;
    _estadoSalud = animalOriginal!.estadoSalud;
    _estadoReproductivo = animalOriginal!.estadoReproductivo;
    _gestante = animalOriginal!.gestante;
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
      
      // Si es modo edición, buscar la raza seleccionada
      if (isEditMode && animalOriginal != null) {
        _razaSeleccionada = _razas.firstWhere(
          (r) => r.nombre == animalOriginal!.raza,
          orElse: () => _razas.first,
        );
        razaDisplayController.text = _razaSeleccionada?.nombre ?? '';
      }
      
      // Auto-seleccionar estado si ya hay un código
      if (estadoController.text.length == 2) {
        _autoSeleccionarEstado();
      }
    } catch (e) {
      debugPrint('Error cargando datos: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  void _setupListeners() {
    // Listener para estado SINIGA con validación
    estadoController.addListener(_onEstadoChanged);
    numeroController.addListener(_onNumeroChanged);
    
    // Listener para navegación con número nacional
    numeroController.addListener(_onNumeroChangedForFocus);
    
    // Control de foco para estado
    estadoFocus.addListener(() {
      if (estadoFocus.hasFocus) {
        _isEditingEstado = true;
        _autoNavigationEnabled = true;
      } else {
        _isEditingEstado = false;
      }
    });
    
    // Control de foco para número
    numeroFocus.addListener(() {
      if (numeroFocus.hasFocus) {
        _isEditingNumero = true;
      } else {
        _isEditingNumero = false;
      }
    });
  }
  
  void _onEstadoChanged() {
    final texto = estadoController.text;
    
    // Validación de estado (01-32)
    if (texto.isNotEmpty) {
      final numero = int.tryParse(texto) ?? 0;
      if (numero > 32) {
        // No permitir números mayores a 32
        estadoController.text = '32';
        estadoController.selection = TextSelection.fromPosition(
          TextPosition(offset: estadoController.text.length),
        );
      }
    }
    
    _validarSiniga();
    _autoSeleccionarEstado();
    
    // Auto-navegación solo si estamos editando y tenemos 2 dígitos
    if (_isEditingEstado && 
        _autoNavigationEnabled && 
        estadoController.text.length == 2 &&
        estadoFocus.hasFocus) {
      // Delay para permitir que se procese el texto
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_autoNavigationEnabled && estadoFocus.hasFocus) {
          numeroFocus.requestFocus();
        }
      });
    }
  }
  
  void _onNumeroChanged() {
    _validarSiniga();
  }
  
  void _onNumeroChangedForFocus() {
    // Auto-desenfoque cuando se completan los 8 dígitos
    if (_isEditingNumero && 
        numeroController.text.length == 8 && 
        numeroFocus.hasFocus) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (numeroFocus.hasFocus) {
          numeroFocus.unfocus();
        }
      });
    }
  }
  
  void _autoSeleccionarEstado() {
    if (estadoController.text.length == 2) {
      final codigo = estadoController.text.padLeft(2, '0');
      final estado = _estados.where((e) => e.clave == codigo).firstOrNull;
      
      if (estado != null && _estadoSeleccionado?.clave != codigo) {
        _estadoSeleccionado = estado;
        estadoDisplayController.text = '${estado.clave} - ${estado.nombre}';
        notifyListeners();
      } else if (estado == null) {
        _estadoSeleccionado = null;
        estadoDisplayController.clear();
        notifyListeners();
      }
    } else {
      if (_estadoSeleccionado != null || estadoDisplayController.text.isNotEmpty) {
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
    
    // Validación adicional del estado
    final estadoNum = int.tryParse(estado) ?? 0;
    if (estadoNum < 1 || estadoNum > 32) {
      _updateValidation(null, false, '❌ Código de estado inválido. Debe ser entre 01 y 32');
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
        mensaje = '❌ Código de estado no registrado ($estado)';
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

  /// Establece tanto el ID puro del NFC como el ID completo del arete
  void setNfcIds({required String? pureNfcId, String? fullAreteId}) {
    _pureNfcId = pureNfcId;
    _nfcId = fullAreteId ?? pureNfcId;
    nfcController.text = _nfcId ?? '';
    notifyListeners();
  }
  
  void setImageFile(File? file) {
    _imageFile = file;
    notifyListeners();
  }

  // Setters para campos adicionales
  void setEstadoAnimal(EstadoAnimal estado) {
    _estadoAnimal = estado;
    notifyListeners();
  }

  void setEstadoSalud(EstadoSalud estado) {
    _estadoSalud = estado;
    // Limpiar la descripción si el nuevo estado no la requiere
    if (!requiereDescripcionSalud(estado)) {
      descripcionSaludController.clear();
    }
    notifyListeners();
  }

  /// Determina si el estado de salud requiere una descripción obligatoria
  bool requiereDescripcionSalud(EstadoSalud? estado) {
    if (estado == null) return false;
    return estado == EstadoSalud.enfermo ||
           estado == EstadoSalud.critico ||
           estado == EstadoSalud.enTratamiento;
  }

  void setEstadoReproductivo(EstadoReproductivo? estado) {
    _estadoReproductivo = estado;
    notifyListeners();
  }

  void setGestante(bool value) {
    _gestante = value;
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

    final extractedNfcId = _pureNfcId ?? _extractPureNfcId(_nfcId);

    return animal
      ..nombre = nombreController.text.trim().isNotEmpty
          ? nombreController.text.trim()
          : 'Sin nombre'
      ..raza = _razaSeleccionada?.nombre ?? 'Sin especificar'
      ..sexo = _sexo
      ..fechaNacimiento = _fechaNacimiento ?? DateTime.now()
      ..idAreteNFC = _nfcId // ID completo del arete
      ..nfcChipId = extractedNfcId // Solo el ID del chip NFC
      ..siniigaId = _sinigaId
      ..fotoPerfilUrl = _imageFile?.path ?? animalOriginal?.fotoPerfilUrl
      // Campos adicionales
      ..idAreteVisual = idAreteVisualController.text.isEmpty ? null : idAreteVisualController.text
      ..numeroHerrado = numeroHerradoController.text.isEmpty ? null : numeroHerradoController.text
      ..colorPelaje = colorPelajeController.text.isEmpty ? null : colorPelajeController.text
      ..senasParticulares = senasParticularesController.text.isEmpty ? null : senasParticularesController.text
      ..pesoNacimiento = double.tryParse(pesoNacimientoController.text)
      ..pesoActual = double.tryParse(pesoActualController.text)
      ..zonaActual = zonaActualController.text.isEmpty ? null : zonaActualController.text
      ..estado = _estadoAnimal
      ..estadoSalud = _estadoSalud
      ..descripcionSalud = descripcionSaludController.text.isEmpty ? null : descripcionSaludController.text
      ..estadoReproductivo = _estadoReproductivo
      ..gestante = _gestante;
  }
  
  /// Extrae solo el ID del chip NFC de la cadena completa
  /// Si el formato es "SINIGA-NFCID", devuelve solo la parte del NFC
  /// Si no tiene el formato esperado, devuelve la cadena completa
  String? _extractPureNfcId(String? fullId) {
    if (fullId == null || fullId.isEmpty) return null;
    
    // Si contiene un guión, tomar la parte después del último guión
    if (fullId.contains('-')) {
      final parts = fullId.split('-');
      if (parts.length >= 2) {
        final nfcPart = parts.last; // Devuelve la última parte (el ID del NFC)
        return nfcPart;
      }
    }
    
    // Si no tiene guión o formato esperado, devolver la cadena completa
    return fullId;
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
    numeroController.removeListener(_onNumeroChangedForFocus);
    numeroController.dispose();
    fechaController.dispose();
    nfcController.dispose();

    razaDisplayController.dispose();
    sexoDisplayController.dispose();
    estadoDisplayController.dispose();

    // Dispose de controllers adicionales
    idAreteVisualController.dispose();
    numeroHerradoController.dispose();
    colorPelajeController.dispose();
    senasParticularesController.dispose();
    pesoNacimientoController.dispose();
    pesoActualController.dispose();
    zonaActualController.dispose();
    descripcionSaludController.dispose();

    nombreFocus.dispose();
    estadoFocus.dispose();
    numeroFocus.dispose();
    razaFocus.dispose();
    sexoFocus.dispose();
    estadoDropdownFocus.dispose();

    super.dispose();
  }
}