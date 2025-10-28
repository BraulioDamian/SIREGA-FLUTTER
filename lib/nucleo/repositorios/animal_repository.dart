import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/modelos/enums.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

/// Repositorio centralizado para operaciones con animales
/// Este repositorio encapsula toda la lógica de acceso a datos relacionada con animales
class AnimalRepository {
  final IsarService _isarService;
  
  AnimalRepository(this._isarService);
  
  /// Busca un animal por su ID de NFC
  /// Normaliza el ID antes de buscar (elimina ':' y convierte a mayúsculas)
  Future<Animal?> buscarPorNfc(String nfcId) async {
    final idNormalizado = normalizeNfcId(nfcId);
    return await _isarService.obtenerAnimalPorNfc(idNormalizado);
  }
  
  /// Busca un animal por su ID de arete visual
  Future<Animal?> buscarPorAreteVisual(String areteVisual) async {
    final animales = await _isarService.obtenerTodosLosAnimales();
    try {
      return animales.firstWhere((animal) => animal.idAreteVisual == areteVisual);
    } catch (e) {
      return null;
    }
  }
  
  /// Busca un animal por su ID interno
  Future<Animal?> buscarPorId(int id) async {
    return await _isarService.obtenerAnimalPorId(id);
  }
  
  /// Obtiene todos los animales
  Future<List<Animal>> obtenerTodos() async {
    return await _isarService.obtenerTodosLosAnimales();
  }
  
  /// Guarda o actualiza un animal
  Future<int> guardar(Animal animal) async {
    if (animal.idAreteNFC != null) {
      animal.idAreteNFC = normalizeNfcId(animal.idAreteNFC!);
    }
    return await _isarService.guardarAnimal(animal);
  }
  
  /// Elimina un animal
  Future<bool> eliminar(int id) async {
    return await _isarService.eliminarAnimal(id);
  }
  
  /// Busca animales por estado
  Future<List<Animal>> buscarPorEstado(EstadoAnimal estado) async {
    final animales = await obtenerTodos();
    return animales.where((animal) => animal.estado == estado).toList();
  }
  
  /// Busca animales por estado de salud
  Future<List<Animal>> buscarPorEstadoSalud(EstadoSalud estadoSalud) async {
    final animales = await obtenerTodos();
    return animales.where((animal) => animal.estadoSalud == estadoSalud).toList();
  }
  
  /// Busca animales gestantes
  Future<List<Animal>> obtenerGestantes() async {
    final animales = await obtenerTodos();
    return animales.where((animal) => animal.gestante == true).toList();
  }
  
  /// Obtiene estadísticas generales del ganado
  Future<Map<String, dynamic>> obtenerEstadisticas() async {
    final animales = await obtenerTodos();
    
    return {
      'total': animales.length,
      'activos': animales.where((a) => a.estado == EstadoAnimal.activo).length,
      'vendidos': animales.where((a) => a.estado == EstadoAnimal.vendido).length,
      'muertos': animales.where((a) => a.estado == EstadoAnimal.muerto).length,
      'sanos': animales.where((a) => a.estadoSalud == EstadoSalud.sano).length,
      'enfermos': animales.where((a) => a.estadoSalud == EstadoSalud.enfermo).length,
      'gestantes': animales.where((a) => a.gestante == true).length,
      'machos': animales.where((a) => a.sexo == Sexo.macho).length,
      'hembras': animales.where((a) => a.sexo == Sexo.hembra).length,
    };
  }
  
  /// Normaliza el ID de NFC para búsquedas consistentes
  static String normalizeNfcId(String nfcId) {
    return nfcId.replaceAll(':', '').replaceAll(' ', '').toUpperCase();
  }
  
  /// Obtiene información detallada del animal formateada para visualización
  Map<String, dynamic> obtenerInformacionDetallada(Animal animal) {
    return {
      'identificacion': {
        'nombre': animal.nombre,
        'nfc': animal.idAreteNFC,
        'areteVisual': animal.idAreteVisual ?? 'No registrado',
        'numeroHerrado': animal.numeroHerrado ?? 'No registrado',
      },
      'datosBasicos': {
        'sexo': animal.sexo.name,
        'raza': animal.raza,
        'edad': animal.getEdadFormateada(),
        'fechaNacimiento': animal.fechaNacimiento,
        'pesoNacimiento': animal.pesoNacimiento,
        'pesoActual': animal.pesoActual,
        'colorPelaje': animal.colorPelaje ?? 'No registrado',
      },
      'salud': {
        'estado': animal.estadoSalud.name,
        'ultimaRevision': animal.fechaUltimaRevision,
        'veterinario': animal.veterinarioUltimaRevision ?? 'No registrado',
        'temperatura': animal.temperaturaActual,
        'frecuenciaCardiaca': animal.frecuenciaCardiaca,
        'frecuenciaRespiratoria': animal.frecuenciaRespiratoria,
        'necesitaVacunacion': animal.necesitaVacunacion(),
        'necesitaDesparasitacion': animal.necesitaDesparasitacion(),
      },
      'reproduccion': {
        'estadoReproductivo': animal.estadoReproductivo?.name ?? 'No aplica',
        'gestante': animal.gestante,
        'diasGestacion': animal.diasGestacion,
        'numeroPartos': animal.numeroPartos,
        'numeroCrias': animal.numeroCrias,
        'fechaUltimoParto': animal.fechaUltimoParto,
        'fechaProximoParto': animal.fechaProximoParto,
      },
      'produccion': {
        'promedioLecheDiario': animal.promedioLecheDiario,
        'produccionTotal': animal.produccionLecheTotal,
        'gananciaPromedioDiaria': animal.gananciaPromedioDiaria,
      },
      'ubicacion': {
        'zonaActual': animal.zonaActual ?? 'No registrada',
        'latitud': animal.latitud,
        'longitud': animal.longitud,
        'fechaUbicacion': animal.fechaUbicacion,
      },
      'economico': {
        'valorCompra': animal.valorCompra,
        'valorEstimado': animal.valorEstimado,
        'costoMantenimiento': animal.costoMantenimientoMensual,
        'ingresoGenerado': animal.ingresoGeneradoTotal,
      },
    };
  }
}
