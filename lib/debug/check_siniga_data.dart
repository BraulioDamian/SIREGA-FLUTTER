// Script temporal para verificar datos de SINIGA en Isar
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sirega_app/nucleo/modelos/animal_model.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

Future<void> checkSinigaData() async {
  debugPrint('🔍 Verificando datos de SINIGA en Isar...\n');

  final animals = await IsarService.isar.animals.where().findAll();

  debugPrint('📊 Total de animales: ${animals.length}\n');

  int withSiniga = 0;
  int withoutSiniga = 0;
  int withPartialSiniga = 0;

  for (final animal in animals) {
    final siniga = animal.siniigaId;

    if (siniga == null) {
      withoutSiniga++;
      debugPrint('❌ ${animal.nombre} (${animal.nfcChipId}) - SIN siniigaId');
    } else {
      final hasEspecie = siniga.especie != null;
      final hasEstado = siniga.estadoClave != null;
      final hasNumero = siniga.numeroNacional != null;

      if (hasEspecie && hasEstado && hasNumero) {
        withSiniga++;
        debugPrint(
          '✅ ${animal.nombre} (${animal.nfcChipId}) - CON siniigaId válido:',
        );
        debugPrint('   especie: ${siniga.especie}');
        debugPrint('   estadoClave: ${siniga.estadoClave}');
        debugPrint('   numeroNacional: ${siniga.numeroNacional}');
        debugPrint('   fullId: ${siniga.fullId}');
      } else {
        withPartialSiniga++;
        debugPrint(
          '⚠️  ${animal.nombre} (${animal.nfcChipId}) - SINIGA parcial:',
        );
        debugPrint('   especie: ${siniga.especie ?? "NULL"}');
        debugPrint('   estadoClave: ${siniga.estadoClave ?? "NULL"}');
        debugPrint('   numeroNacional: ${siniga.numeroNacional ?? "NULL"}');
      }
    }
    debugPrint('');
  }

  debugPrint('\n📈 RESUMEN:');
  debugPrint('   ✅ Con SINIGA válido: $withSiniga');
  debugPrint('   ⚠️  Con SINIGA parcial: $withPartialSiniga');
  debugPrint('   ❌ Sin SINIGA: $withoutSiniga');
  debugPrint('   📊 Total: ${animals.length}\n');

  if (withSiniga == 0) {
    debugPrint('⚠️  NINGÚN animal tiene siniigaId válido.');
    debugPrint('   Esto es normal si los animales fueron creados antes de');
    debugPrint('   implementar el campo siniigaId.\n');
    debugPrint('💡 SOLUCIÓN:');
    debugPrint('   1. Edita un animal y agrega su ID SINIGA');
    debugPrint('   2. O crea un animal nuevo con ID SINIGA');
    debugPrint('   3. Luego sincroniza para ver el campo en Firestore');
  }
}
