import 'package:isar/isar.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

part 'siniga_model.g.dart';

@embedded
class SinigaId {
  String? especie;
  String? estadoClave;
  String? numeroNacional;

  // Cache estático para evitar cargar el JSON múltiples veces
  static Map<String, String>? _estadosCache;

  // Constructor por defecto
  SinigaId({
    this.especie = '00', // Bovinos por defecto
    this.estadoClave,
    this.numeroNacional,
  });

  // Factory constructor para parsear desde un string
  factory SinigaId.fromString(String? rawId) {
    if (rawId == null || rawId.length != 12) {
      // Retorna un objeto vacío si el string es inválido
      return SinigaId(especie: null, estadoClave: null, numeroNacional: null);
    }
    
    final especie = rawId.substring(0, 2);
    final estadoClave = rawId.substring(2, 4);
    final numeroNacional = rawId.substring(4, 12);
    
    // Validación opcional - puedes manejar advertencias sin interrumpir
    if (especie != '00') {
      // Log de advertencia si no es bovino, pero permite la creación
    }

    return SinigaId(
      especie: especie,
      estadoClave: estadoClave,
      numeroNacional: numeroNacional,
    );
  }

  @override
  String toString() {
    if (especie == null || estadoClave == null || numeroNacional == null) {
      return '';
    }
    return '$especie$estadoClave$numeroNacional';
  }

  String get fullId => toString();

  // Cargar estados desde el archivo JSON
  static Future<Map<String, String>> _cargarEstados() async {
    if (_estadosCache != null) return _estadosCache!;
    
    try {
      final String data = await rootBundle.loadString('assets/data/estados_mexico.json');
      final List<dynamic> estadosJson = json.decode(data);
      
      _estadosCache = <String, String>{};
      for (var estado in estadosJson) {
        _estadosCache![estado['clave']] = estado['nombre'];
      }
      
      return _estadosCache!;
    } catch (e) {
      // En caso de error, devolver un mapa vacío
      _estadosCache = <String, String>{};
      return _estadosCache!;
    }
  }

  // Método sincrónico para validar estado (requiere que se haya cargado previamente)
  bool get _esEstadoValidoSync {
    if (estadoClave == null || _estadosCache == null) return false;
    return _estadosCache!.containsKey(estadoClave);
  }

  // Método asíncrono para validar estado (carga el JSON si es necesario)
  Future<bool> esEstadoValido() async {
    if (estadoClave == null) return false;
    final estados = await _cargarEstados();
    return estados.containsKey(estadoClave);
  }

  // Validación básica del número nacional (solo dígitos)
  bool get _esNumeroNacionalValido {
    if (numeroNacional == null || numeroNacional!.length != 8) return false;
    return RegExp(r'^\d{8}$').hasMatch(numeroNacional!);
  }

  // Propiedad para validar formato básico (no verifica estado hasta cargar JSON)
  bool get esValidoBasico {
    return especie == '00' &&
           estadoClave != null &&
           estadoClave!.length == 2 &&
           numeroNacional != null &&
           numeroNacional!.length == 8 &&
           _esNumeroNacionalValido;
  }

  // Validación completa (asíncrona)
  Future<bool> esValido() async {
    return esValidoBasico && await esEstadoValido();
  }

  // Método sincrónico para obtener nombre del estado (si ya se cargó el JSON)
  String? get nombreEstadoSync {
    if (estadoClave == null || _estadosCache == null) return null;
    return _estadosCache![estadoClave];
  }

  // Método asíncrono para obtener nombre del estado
  Future<String?> getNombreEstado() async {
    if (estadoClave == null) return null;
    final estados = await _cargarEstados();
    return estados[estadoClave];
  }

  // Método para formatear con separadores visuales (opcional para UI)
  String get formatoVisual {
    if (!esValidoBasico) return toString();
    return '$especie-$estadoClave-$numeroNacional';
  }

  // Validación estricta para registro oficial (asíncrona)
  Future<bool> validoParaRegistro() async {
    return await esValido() && especie == '00';
  }

  // Método estático para pre-cargar los estados (llamar al inicio de la app)
  static Future<void> inicializarEstados() async {
    await _cargarEstados();
  }

  // Método estático para obtener todos los estados disponibles
  static Future<Map<String, String>> getTodosLosEstados() async {
    return await _cargarEstados();
  }

  // Método estático para obtener lista de estados para dropdowns
  static Future<List<EstadoMexico>> getEstadosParaDropdown() async {
    final estados = await _cargarEstados();
    return estados.entries.map((entry) => EstadoMexico(
      clave: entry.key,
      nombre: entry.value,
    )).toList()..sort((a, b) => a.nombre.compareTo(b.nombre));
  }
}

// Clase auxiliar para dropdowns y selecciones
class EstadoMexico {
  final String clave;
  final String nombre;

  const EstadoMexico({
    required this.clave,
    required this.nombre,
  });

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