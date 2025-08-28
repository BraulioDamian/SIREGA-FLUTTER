import 'dart:convert';
import 'package:flutter/services.dart';

/// Clase helper para cargar datos JSON
class JsonDataLoader {
  /// Carga datos JSON desde un archivo de assets
  static Future<List<T>> loadFromAsset<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final String data = await rootBundle.loadString(path);
      final List<dynamic> jsonList = json.decode(data);
      return jsonList.map((item) => fromJson(item as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Error cargando datos desde $path: $e');
    }
  }
}
