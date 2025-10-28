// Script temporal para verificar datos de SINIGA en Isar
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

Future<void> checkSinigaData() async {
  print('🔍 Verificando datos de SINIGA en Isar...\n');

  final animals = await IsarService.isar.animals.where().findAll();

  print('📊 Total de animales: ${animals.length}\n');

  int withSiniga = 0;
  int withoutSiniga = 0;
  int withPartialSiniga = 0;

  for (final animal in animals) {
    final siniga = animal.siniigaId;

    if (siniga == null) {
      withoutSiniga++;
      print('❌ ${animal.nombre} (${animal.nfcChipId}) - SIN siniigaId');
    } else {
      final hasEspecie = siniga.especie != null;
      final hasEstado = siniga.estadoClave != null;
      final hasNumero = siniga.numeroNacional != null;

      if (hasEspecie && hasEstado && hasNumero) {
        withSiniga++;
        print('✅ ${animal.nombre} (${animal.nfcChipId}) - CON siniigaId válido:');
        print('   especie: ${siniga.especie}');
        print('   estadoClave: ${siniga.estadoClave}');
        print('   numeroNacional: ${siniga.numeroNacional}');
        print('   fullId: ${siniga.fullId}');
      } else {
        withPartialSiniga++;
        print('⚠️  ${animal.nombre} (${animal.nfcChipId}) - SINIGA parcial:');
        print('   especie: ${siniga.especie ?? "NULL"}');
        print('   estadoClave: ${siniga.estadoClave ?? "NULL"}');
        print('   numeroNacional: ${siniga.numeroNacional ?? "NULL"}');
      }
    }
    print('');
  }

  print('\n📈 RESUMEN:');
  print('   ✅ Con SINIGA válido: $withSiniga');
  print('   ⚠️  Con SINIGA parcial: $withPartialSiniga');
  print('   ❌ Sin SINIGA: $withoutSiniga');
  print('   📊 Total: ${animals.length}\n');

  if (withSiniga == 0) {
    print('⚠️  NINGÚN animal tiene siniigaId válido.');
    print('   Esto es normal si los animales fueron creados antes de');
    print('   implementar el campo siniigaId.\n');
    print('💡 SOLUCIÓN:');
    print('   1. Edita un animal y agrega su ID SINIGA');
    print('   2. O crea un animal nuevo con ID SINIGA');
    print('   3. Luego sincroniza para ver el campo en Firestore');
  }
}
