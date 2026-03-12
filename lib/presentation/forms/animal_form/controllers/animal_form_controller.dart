import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sirega_app/core/models/animal_model.dart';
import 'package:sirega_app/core/models/enums.dart';
import 'package:sirega_app/core/models/form_dtos.dart';
import 'package:sirega_app/core/models/vaccines_catalog.dart';
import 'package:sirega_app/core/models/siniga_model.dart';
import 'package:sirega_app/core/extensions/enum_ui_extensions.dart';
import 'package:sirega_app/presentation/widgets/shared/json_data_loader.dart';

// Modelos locales para el formulario
class RazaBovina {
  final String name;
  final String origen;
  final String tipo;

  const RazaBovina({
    required this.name,
    required this.origen,
    required this.tipo,
  });

  factory RazaBovina.fromJson(Map<String, dynamic> json) {
    return RazaBovina(
      name: json['name'],
      origen: json['origen'],
      tipo: json['tipo'],
    );
  }

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RazaBovina &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

class EstadoMexico {
  final String clave;
  final String name;

  const EstadoMexico({required this.clave, required this.name});

  factory EstadoMexico.fromJson(Map<String, dynamic> json) {
    return EstadoMexico(clave: json['clave'], name: json['name']);
  }

  @override
  String toString() => name;

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
  late final TextEditingController nameController;
  late final TextEditingController especieController;
  late final TextEditingController estadoController;
  late final TextEditingController numeroController;
  late final TextEditingController fechaController;
  late final TextEditingController nfcController;

  // Controllers para displays de dropdowns
  late final TextEditingController razaDisplayController;
  late final TextEditingController sexoDisplayController;
  late final TextEditingController estadoDisplayController;
  late final TextEditingController estadoSaludDisplayController;
  late final TextEditingController estadoAnimalDisplayController;
  late final TextEditingController estadoReproductivoDisplayController;

  // Controllers adicionales para edición completa
  late final TextEditingController idAreteVisualController;
  late final TextEditingController numeroHerradoController;
  late final TextEditingController coatColorController;
  late final TextEditingController senasParticularesController;
  late final TextEditingController birthWeightController;
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
  final FocusNode estadoSaludFocus = FocusNode();
  final FocusNode estadoAnimalFocus = FocusNode();
  final FocusNode estadoReproductivoFocus = FocusNode();

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

  // Datos de vacunas
  final List<String> _vacunasAplicadas = [];
  final List<String> _vacunasPersonalizadas = [];
  final Map<String, DateTime> _fechasVacunas = {};

  // Vacunas originales (para detectar cambios en modo edición)
  final Set<String> _vacunasOriginales = {};
  final Map<String, DateTime> _fechasVacunasOriginales = {};

  // Typed production & medical records
  final List<MedicalEventRecord> _medicalEvents = [];
  final Set<int> _originalMedicalEventIds = {};

  final List<BirthRecord> _birthRecords = [];
  final Set<int> _originalBirthIds = {};

  final List<WeightRecord> _weightRecords = [];
  final Set<int> _originalWeightIds = {};

  final List<MilkRecord> _milkRecords = [];
  final Set<int> _originalMilkIds = {};

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
  bool _initialLoadComplete = false;

  // Getters
  RazaBovina? get razaSeleccionada => _razaSeleccionada;
  EstadoMexico? get estadoSeleccionado => _estadoSeleccionado;
  Sexo get sex => _sexo;
  DateTime? get birthDate => _fechaNacimiento;
  File? get imageFile => _imageFile;
  bool get sinigaIsValid => _sinigaIsValid;
  String? get sinigaValidationMessage => _sinigaValidationMessage;
  SinigaId? get sinigaId => _sinigaId;
  String? get nfcId => _nfcId;
  List<RazaBovina> get razas => _razas;
  List<EstadoMexico> get estados => _estados;
  bool get isLoading => _isLoading;
  bool get initialLoadComplete => _initialLoadComplete;

  // Getters adicionales para campos extendidos
  EstadoAnimal get estadoAnimal => _estadoAnimal;
  EstadoSalud get healthStatus => _estadoSalud;
  EstadoReproductivo? get reproductiveStatus => _estadoReproductivo;
  bool get isPregnant => _gestante;

  // Getters para vacunas y events médicos
  List<String> get vacunasAplicadas => _vacunasAplicadas;
  List<String> get vacunasPersonalizadas => _vacunasPersonalizadas;
  Map<String, DateTime> get fechasVacunas => _fechasVacunas;
  Set<String> get vacunasOriginales => _vacunasOriginales;
  Map<String, DateTime> get fechasVacunasOriginales => _fechasVacunasOriginales;
  // Getters for typed record lists
  List<MedicalEventRecord> get medicalEvents => _medicalEvents;
  Set<int> get originalMedicalEventIds => _originalMedicalEventIds;
  List<BirthRecord> get birthRecords => _birthRecords;
  Set<int> get originalBirthIds => _originalBirthIds;
  List<WeightRecord> get weightRecords => _weightRecords;
  Set<int> get originalWeightIds => _originalWeightIds;
  List<MilkRecord> get milkRecords => _milkRecords;
  Set<int> get originalMilkIds => _originalMilkIds;

  // Validación general del formulario
  bool get isFormValid =>
      _sinigaIsValid && _nfcId != null && _nfcId!.isNotEmpty;

  AnimalFormController({this.isEditMode = false, this.animalOriginal}) {
    _initializeControllers();
    _loadData();
    _setupListeners();
  }

  void _initializeControllers() {
    // Inicializar con valores por defecto o del animal existente
    nameController = TextEditingController(text: animalOriginal?.name ?? '');
    especieController = TextEditingController(text: '00');
    estadoController = TextEditingController();
    numeroController = TextEditingController();
    fechaController = TextEditingController();
    nfcController = TextEditingController(
      text: animalOriginal?.rfidTagId ?? '',
    );

    razaDisplayController = TextEditingController();
    sexoDisplayController = TextEditingController(
      text: Sexo.hembra.displayName,
    );
    estadoDisplayController = TextEditingController();
    estadoSaludDisplayController = TextEditingController(
      text: EstadoSalud.sano.displayName,
    );
    estadoAnimalDisplayController = TextEditingController(
      text: EstadoAnimal.activo.displayName,
    );
    estadoReproductivoDisplayController = TextEditingController();

    // Inicializar controllers adicionales
    idAreteVisualController = TextEditingController(
      text: animalOriginal?.visualTagId ?? '',
    );
    numeroHerradoController = TextEditingController(
      text: animalOriginal?.brandNumber ?? '',
    );
    coatColorController = TextEditingController(
      text: animalOriginal?.coatColor ?? '',
    );
    senasParticularesController = TextEditingController(
      text: animalOriginal?.distinctiveMarks ?? '',
    );
    birthWeightController = TextEditingController(
      text: animalOriginal?.birthWeight?.toString() ?? '',
    );
    pesoActualController = TextEditingController(
      text: animalOriginal?.currentWeight?.toString() ?? '',
    );
    zonaActualController = TextEditingController(
      text: animalOriginal?.currentLocation ?? '',
    );
    descripcionSaludController = TextEditingController(
      text: animalOriginal?.healthDescription ?? '',
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
    _sexo = animalOriginal!.sex;
    sexoDisplayController.text = _sexo.displayName;
    _fechaNacimiento = animalOriginal!.birthDate;
    _nfcId = animalOriginal!.rfidTagId;

    if (_fechaNacimiento != null) {
      fechaController.text =
          '${_fechaNacimiento!.day.toString().padLeft(2, '0')}-'
          '${_fechaNacimiento!.month.toString().padLeft(2, '0')}-'
          '${_fechaNacimiento!.year}';
    }

    // Cargar datos extendidos
    _estadoAnimal = animalOriginal!.estado;
    _estadoSalud = animalOriginal!.healthStatus;
    _estadoReproductivo = animalOriginal!.reproductiveStatus;
    _gestante = animalOriginal!.isPregnant;

    estadoSaludDisplayController.text = _estadoSalud.displayName;
    estadoAnimalDisplayController.text = _estadoAnimal.displayName;
    if (_estadoReproductivo != null) {
      estadoReproductivoDisplayController.text =
          _estadoReproductivo!.displayName;
    }

    // Cargar foto de perfil
    if (animalOriginal!.profilePhotoUrl != null &&
        animalOriginal!.profilePhotoUrl!.isNotEmpty) {
      final file = File(animalOriginal!.profilePhotoUrl!);
      if (file.existsSync()) {
        _imageFile = file;
      }
    }
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

      // Si es modo edición, buscar la breed seleccionada
      if (isEditMode && animalOriginal != null) {
        _razaSeleccionada = _razas.firstWhere(
          (r) => r.name == animalOriginal!.breed,
          orElse: () => _razas.first,
        );
        razaDisplayController.text = _razaSeleccionada?.name ?? '';

        // Cargar datos relacionados desde Isar (IsarLinks)
        await _loadLinkedData();
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
      _initialLoadComplete = true;
    }
  }

  /// Carga los datos relacionados del animal desde IsarLinks
  /// (vacunas, events médicos, pesajes, producción de leche, partos)
  Future<void> _loadLinkedData() async {
    final animal = animalOriginal!;

    // Load health events (vaccines + medical events)
    await animal.events.load();
    for (final evento in animal.events) {
      if (evento.tipo == TipoEvento.vacuna) {
        final name = evento.productName ?? 'Vacuna sin name';
        if (!_vacunasAplicadas.contains(name)) {
          _vacunasAplicadas.add(name);
        }
        _fechasVacunas[name] = evento.date;
        if (!_esVacunaEstandar(name) &&
            !_vacunasPersonalizadas.contains(name)) {
          _vacunasPersonalizadas.add(name);
        }
      } else {
        _medicalEvents.add(
          MedicalEventRecord(
            isarId: evento.id,
            eventType: evento.tipo,
            date: evento.date,
            product: evento.productName ?? '',
            notes: evento.notes,
          ),
        );
      }
    }

    // Snapshot originals for change detection on save
    _vacunasOriginales.addAll(_vacunasAplicadas);
    _fechasVacunasOriginales.addAll(_fechasVacunas);

    // Load production records (weights, milk, births)
    await animal.productions.load();
    for (final registro in animal.productions) {
      switch (registro.tipo) {
        case ProductionType.weight:
          _weightRecords.add(
            WeightRecord(
              isarId: registro.id,
              date: registro.date,
              weightKg: registro.pesoKg ?? 0.0,
              notes: registro.notes,
            ),
          );
          break;
        case ProductionType.milk:
          _milkRecords.add(
            MilkRecord(
              isarId: registro.id,
              date: registro.date,
              litersPerDay: registro.litrosPorDia ?? 0.0,
              notes: registro.notes,
            ),
          );
          break;
        case ProductionType.birth:
          _birthRecords.add(
            BirthRecord(
              isarId: registro.id,
              date: registro.date,
              offspringId: registro.idCria,
              offspringSex: registro.sexoCria,
              weightKg: registro.pesoKg,
              notes: registro.notes,
            ),
          );
          break;
      }
    }

    // Snapshot original IDs for deletion tracking
    _originalMedicalEventIds.addAll(
      _medicalEvents.where((e) => e.isarId != null).map((e) => e.isarId!),
    );
    _originalWeightIds.addAll(
      _weightRecords.where((e) => e.isarId != null).map((e) => e.isarId!),
    );
    _originalMilkIds.addAll(
      _milkRecords.where((e) => e.isarId != null).map((e) => e.isarId!),
    );
    _originalBirthIds.addAll(
      _birthRecords.where((e) => e.isarId != null).map((e) => e.isarId!),
    );
  }

  bool _esVacunaEstandar(String name) {
    return CatalogoVacunas.buscarPorNombre(name) != null;
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
        estadoDisplayController.text = '${estado.clave} - ${estado.name}';
        notifyListeners();
      } else if (estado == null) {
        _estadoSeleccionado = null;
        estadoDisplayController.clear();
        notifyListeners();
      }
    } else {
      if (_estadoSeleccionado != null ||
          estadoDisplayController.text.isNotEmpty) {
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
      _updateValidation(
        null,
        false,
        '❌ Código de estado inválido. Debe ser entre 01 y 32',
      );
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
    final estado = _estados
        .where((estado) => estado.clave == codigo)
        .firstOrNull;
    return estado?.name ?? 'Desconocido';
  }

  // Métodos públicos para actualizar el estado

  void setRaza(RazaBovina? breed) {
    _razaSeleccionada = breed;
    razaDisplayController.text = breed?.name ?? '';
    notifyListeners();
  }

  void setSexo(Sexo sex) {
    _sexo = sex;
    sexoDisplayController.text = sex.displayName;
    notifyListeners();
  }

  void setFechaNacimiento(DateTime? date) {
    _fechaNacimiento = date;
    if (date != null) {
      fechaController.text =
          '${date.day.toString().padLeft(2, '0')}-'
          '${date.month.toString().padLeft(2, '0')}-'
          '${date.year}';
    } else {
      fechaController.clear();
    }
    notifyListeners();
  }

  void setEstadoSeleccionado(EstadoMexico estado) {
    _estadoSeleccionado = estado;
    estadoController.text = estado.clave;
    estadoDisplayController.text = '${estado.clave} - ${estado.name}';
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
    estadoAnimalDisplayController.text = estado.displayName;
    notifyListeners();
  }

  void setEstadoSalud(EstadoSalud estado) {
    _estadoSalud = estado;
    estadoSaludDisplayController.text = estado.displayName;
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
    if (estado != null) {
      estadoReproductivoDisplayController.text = estado.displayName;
    } else {
      estadoReproductivoDisplayController.clear();
    }
    notifyListeners();
  }

  void setGestante(bool value) {
    _gestante = value;
    notifyListeners();
  }

  // Métodos para manejo de vacunas
  void agregarVacuna(String name) {
    if (!_vacunasAplicadas.contains(name)) {
      _vacunasAplicadas.add(name);
      notifyListeners();
    }
  }

  void removerVacuna(String name) {
    _vacunasAplicadas.remove(name);
    _fechasVacunas.remove(name);
    notifyListeners();
  }

  void setFechaVacuna(String name, DateTime date) {
    _fechasVacunas[name] = date;
    notifyListeners();
  }

  void agregarVacunaPersonalizada(String name) {
    if (!_vacunasPersonalizadas.contains(name)) {
      _vacunasPersonalizadas.add(name);
      notifyListeners();
    }
  }

  void eliminarVacunaPersonalizada(String name) {
    _vacunasPersonalizadas.remove(name);
    // También remover de vacunas aplicadas si estaba seleccionada
    if (_vacunasAplicadas.contains(name)) {
      removerVacuna(name);
    }
    notifyListeners();
  }

  // Methods for medical events
  void addMedicalEvent(MedicalEventRecord event) {
    _medicalEvents.add(event);
    notifyListeners();
  }

  void removeMedicalEvent(int index) {
    if (index >= 0 && index < _medicalEvents.length) {
      _medicalEvents.removeAt(index);
      notifyListeners();
    }
  }

  // Methods for birth records
  void addBirthRecord(BirthRecord record) {
    _birthRecords.add(record);
    notifyListeners();
  }

  void removeBirthRecord(int index) {
    if (index >= 0 && index < _birthRecords.length) {
      _birthRecords.removeAt(index);
      notifyListeners();
    }
  }

  // Methods for weight records
  void addWeightRecord(WeightRecord record) {
    _weightRecords.add(record);
    notifyListeners();
  }

  void removeWeightRecord(int index) {
    if (index >= 0 && index < _weightRecords.length) {
      _weightRecords.removeAt(index);
      notifyListeners();
    }
  }

  // Methods for milk records
  void addMilkRecord(MilkRecord record) {
    _milkRecords.add(record);
    notifyListeners();
  }

  void removeMilkRecord(int index) {
    if (index >= 0 && index < _milkRecords.length) {
      _milkRecords.removeAt(index);
      notifyListeners();
    }
  }

  // Método para construir el objeto Animal
  Animal buildAnimal() {
    final animal = animalOriginal ?? Animal();

    final extractedNfcId = _pureNfcId ?? _extractPureNfcId(_nfcId);

    return animal
      ..name = nameController.text.trim().isNotEmpty
          ? nameController.text.trim()
          : 'Sin name'
      ..breed = _razaSeleccionada?.name ?? 'Sin especificar'
      ..sex = _sexo
      ..birthDate = _fechaNacimiento ?? DateTime.now()
      ..rfidTagId =
          _nfcId // ID completo del arete
      ..nfcChipId =
          extractedNfcId // Solo el ID del chip NFC
      ..siniigaId = _sinigaId
      ..profilePhotoUrl = _imageFile?.path ?? animalOriginal?.profilePhotoUrl
      // Campos adicionales
      ..visualTagId = idAreteVisualController.text.isEmpty
          ? null
          : idAreteVisualController.text
      ..brandNumber = numeroHerradoController.text.isEmpty
          ? null
          : numeroHerradoController.text
      ..coatColor = coatColorController.text.isEmpty
          ? null
          : coatColorController.text
      ..distinctiveMarks = senasParticularesController.text.isEmpty
          ? null
          : senasParticularesController.text
      ..birthWeight = double.tryParse(birthWeightController.text)
      ..currentWeight = double.tryParse(pesoActualController.text)
      ..currentLocation = zonaActualController.text.isEmpty
          ? null
          : zonaActualController.text
      ..estado = _estadoAnimal
      ..healthStatus = _estadoSalud
      ..healthDescription = descripcionSaludController.text.isEmpty
          ? null
          : descripcionSaludController.text
      ..reproductiveStatus = _estadoReproductivo
      ..isPregnant = _gestante;
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

  @override
  void dispose() {
    nameController.dispose();
    especieController.dispose();
    estadoController.dispose();
    numeroController.removeListener(_onNumeroChangedForFocus);
    numeroController.dispose();
    fechaController.dispose();
    nfcController.dispose();

    razaDisplayController.dispose();
    sexoDisplayController.dispose();
    estadoDisplayController.dispose();
    estadoSaludDisplayController.dispose();
    estadoAnimalDisplayController.dispose();
    estadoReproductivoDisplayController.dispose();

    // Dispose de controllers adicionales
    idAreteVisualController.dispose();
    numeroHerradoController.dispose();
    coatColorController.dispose();
    senasParticularesController.dispose();
    birthWeightController.dispose();
    pesoActualController.dispose();
    zonaActualController.dispose();
    descripcionSaludController.dispose();

    nombreFocus.dispose();
    estadoFocus.dispose();
    numeroFocus.dispose();
    razaFocus.dispose();
    sexoFocus.dispose();
    estadoDropdownFocus.dispose();
    estadoSaludFocus.dispose();
    estadoAnimalFocus.dispose();
    estadoReproductivoFocus.dispose();

    super.dispose();
  }
}
