// lib/debug/sync_debug_screen_simple.dart
import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/servicios/firebase_sync_service.dart';
import 'package:sirega_app/nucleo/servicios/auth_service.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

/// Pantalla simple de debug para sincronización con Firebase
class SyncDebugScreenSimple extends StatefulWidget {
  final FirebaseSyncService syncService;
  final AuthService authService;

  const SyncDebugScreenSimple({
    super.key,
    required this.syncService,
    required this.authService,
  });

  @override
  State<SyncDebugScreenSimple> createState() => _SyncDebugScreenSimpleState();
}

class _SyncDebugScreenSimpleState extends State<SyncDebugScreenSimple> {
  bool _syncing = false;
  String _message = '';
  int _pendingCount = 0;
  String _sinigaReport = '';

  @override
  void initState() {
    super.initState();
    _loadPendingCount();
  }

  Future<void> _loadPendingCount() async {
    try {
      final count = await widget.syncService.getPendingCount();
      setState(() => _pendingCount = count);
    } catch (e) {
      setState(() => _message = 'Error: $e');
    }
  }

  Future<void> _checkSinigaData() async {
    setState(() {
      _syncing = true;
      _message = '🔍 Verificando datos de SINIGA...';
      _sinigaReport = '';
    });

    try {
      final isarService = IsarService();
      final animals = await isarService.getAllAnimals();

      int withSiniga = 0;
      int withoutSiniga = 0;
      int withPartialSiniga = 0;
      StringBuffer report = StringBuffer();

      report.writeln('📊 Total de animales: ${animals.length}\n');

      for (final animal in animals) {
        final siniga = animal.siniigaId;

        if (siniga == null) {
          withoutSiniga++;
          report.writeln('❌ ${animal.nombre} - SIN siniigaId');
        } else {
          final hasEspecie = siniga.especie != null && siniga.especie!.isNotEmpty;
          final hasEstado = siniga.estadoClave != null && siniga.estadoClave!.isNotEmpty;
          final hasNumero = siniga.numeroNacional != null && siniga.numeroNacional!.isNotEmpty;

          if (hasEspecie && hasEstado && hasNumero) {
            withSiniga++;
            report.writeln('✅ ${animal.nombre}');
            report.writeln('   ID SINIGA: ${siniga.fullId}');
          } else {
            withPartialSiniga++;
            report.writeln('⚠️  ${animal.nombre} - SINIGA parcial');
          }
        }
      }

      report.writeln('\n📈 RESUMEN:');
      report.writeln('✅ Con SINIGA válido: $withSiniga');
      report.writeln('⚠️  Con SINIGA parcial: $withPartialSiniga');
      report.writeln('❌ Sin SINIGA: $withoutSiniga');

      if (withSiniga == 0) {
        report.writeln('\n⚠️  NINGÚN animal tiene SINIGA válido.');
        report.writeln('💡 Esto es normal si los animales fueron');
        report.writeln('   creados antes de implementar este campo.');
        report.writeln('\n🔧 SOLUCIÓN:');
        report.writeln('1. Edita un animal y agrega su ID SINIGA');
        report.writeln('2. O crea un animal nuevo con ID SINIGA');
        report.writeln('3. Sincroniza para ver el campo en Firestore');
      } else {
        report.writeln('\n✅ Hay animales con SINIGA válido.');
        report.writeln('   Sincroniza para subirlos a Firestore.');
      }

      setState(() {
        _sinigaReport = report.toString();
        _message = '✅ Verificación completada';
      });
    } catch (e) {
      setState(() {
        _message = '❌ Error: $e';
        _sinigaReport = '';
      });
    } finally {
      setState(() => _syncing = false);
    }
  }

  Future<void> _syncNow() async {
    setState(() {
      _syncing = true;
      _message = '🔄 Sincronizando...';
    });

    try {
      await widget.syncService.syncPendingChanges();
      await _loadPendingCount();
      setState(() => _message = '✅ Sincronización completada');
    } catch (e) {
      setState(() => _message = '❌ Error: $e');
    } finally {
      setState(() => _syncing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('🔍 Debug - Sincronización'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Usuario actual
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '👤 Usuario Actual',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Text('UID: ${user?.uid ?? "No autenticado"}'),
                    Text('Email: ${user?.email ?? "N/A"}'),
                    Text('Nombre: ${user?.displayName ?? "N/A"}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Estado de sincronización
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📊 Estado de Sincronización',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Text(
                      'Registros pendientes: $_pendingCount',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _pendingCount > 0 ? Colors.orange : Colors.green,
                      ),
                    ),
                    if (_syncing)
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: LinearProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Mensaje
            if (_message.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: _message.contains('✅')
                      ? Colors.green[100]
                      : _message.contains('🔄')
                          ? Colors.blue[100]
                          : Colors.red[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _message,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

            // Botón de sincronización
            ElevatedButton.icon(
              onPressed: _syncing ? null : _syncNow,
              icon: _syncing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Icon(Icons.sync),
              label: const Text('🔄 Sincronizar Ahora'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.green,
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),

            // Botón de recargar contador
            OutlinedButton.icon(
              onPressed: _syncing ? null : _loadPendingCount,
              icon: const Icon(Icons.refresh),
              label: const Text('📊 Actualizar Contador'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),

            // Botón de verificar SINIGA
            OutlinedButton.icon(
              onPressed: _syncing ? null : _checkSinigaData,
              icon: const Icon(Icons.search),
              label: const Text('🔍 Verificar Datos SINIGA'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 16),
                side: BorderSide(color: Colors.orange[700]!),
              ),
            ),
            const SizedBox(height: 16),

            // Reporte de SINIGA
            if (_sinigaReport.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _sinigaReport,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 24),

            // Instrucciones
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.yellow[700]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info, color: Colors.yellow[900]),
                      const SizedBox(width: 8),
                      Text(
                        'Instrucciones',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[900],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('1. Verifica que haya registros pendientes'),
                  const Text('2. Click en "Sincronizar Ahora"'),
                  const Text('3. Espera a que termine'),
                  const Text('4. Ve a Firebase Console para verificar:'),
                  const SizedBox(height: 4),
                  Text(
                    '   https://console.firebase.google.com/project/db-ganado-31dd3/firestore',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '5. Busca: users/{tu-uid}/cattle',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text('6. Verifica que siniigaId aparezca en los animales'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Link a Firestore
            Card(
              color: Colors.purple[50],
              child: InkWell(
                onTap: () {
                  // Copiar URL al portapapeles
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Ve a la URL en tu navegador para ver Firestore'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Icon(Icons.cloud, size: 48, color: Colors.purple[700]),
                      const SizedBox(height: 8),
                      Text(
                        'Firebase Console',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tap para copiar instrucciones',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.purple[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
