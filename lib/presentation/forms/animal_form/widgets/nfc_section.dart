import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:provider/provider.dart';
import '../controllers/animal_form_controller.dart';

class NfcSection extends StatefulWidget {
  const NfcSection({super.key});

  @override
  State<NfcSection> createState() => _NfcSectionState();
}

class _NfcSectionState extends State<NfcSection> {
  bool _isReading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalFormController>(
      builder: (context, controller, child) {
        final hasNfc = controller.nfcId != null && controller.nfcId!.isNotEmpty;

        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;
            return _buildNfcContent(context, controller, hasNfc, isMobile);
          },
        );
      },
    );
  }

  Widget _buildNfcContent(
    BuildContext context,
    AnimalFormController controller,
    bool hasNfc,
    bool isMobile,
  ) {
    Widget content;
    if (_isReading) {
      content = _buildReadingState(isMobile);
    } else if (hasNfc) {
      content = _buildNfcDetected(controller, isMobile);
    } else {
      content = _buildReadNfcButton(context, controller, isMobile);
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 420),
        child: content,
      ),
    );
  }

  Widget _buildReadingState(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      child: Column(
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: isMobile ? 16 : 20),
          Text(
            'Acerque el chip NFC al dispositivo',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Mantenga el chip cerca hasta que se detecte',
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () async {
              try {
                await FlutterNfcKit.finish();
              } catch (_) {}
              setState(() {
                _isReading = false;
              });
            },
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  Widget _buildNfcDetected(AnimalFormController controller, bool isMobile) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(isMobile ? 12 : 16),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green),
          ),
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: isMobile ? 20 : 24,
              ),
              SizedBox(width: isMobile ? 8 : 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chip NFC Detectado',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.green.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ID: ${controller.nfcId}',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: isMobile ? 12 : 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _isReading ? null : () => _startNfcReading(controller),
            icon: _isReading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            label: Text(_isReading ? 'Leyendo...' : 'Leer otro chip'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReadNfcButton(
    BuildContext context,
    AnimalFormController controller,
    bool isMobile,
  ) {
    final canRead = controller.sinigaIsValid;

    return Column(
      children: [
        if (!canRead)
          Container(
            padding: EdgeInsets.all(isMobile ? 10 : 12),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.orange,
                  size: isMobile ? 20 : 24,
                ),
                SizedBox(width: isMobile ? 8 : 12),
                Expanded(
                  child: Text(
                    'Complete primero el ID SINIGA',
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 14,
                      color: Colors.orange.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          width: double.infinity,
          height: isMobile ? 48 : 56,
          child: ElevatedButton.icon(
            onPressed: canRead && !_isReading
                ? () => _startNfcReading(controller)
                : null,
            icon: _isReading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Icon(Icons.nfc),
            label: Text(
              _isReading ? 'Leyendo...' : 'Leer Chip NFC',
              style: TextStyle(fontSize: isMobile ? 16 : 18),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        // Botón de simulación para desarrollo
        if (canRead) ...[
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: !_isReading
                ? () => _simulateNfcReading(controller)
                : null,
            icon: const Icon(Icons.bug_report, size: 18),
            label: const Text(
              'Simular lectura (Dev)',
              style: TextStyle(fontSize: 12),
            ),
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
          ),
        ],
      ],
    );
  }

  Future<void> _startNfcReading(AnimalFormController controller) async {
    try {
      // Verificar disponibilidad de NFC con flutter_nfc_kit
      NFCAvailability availability = await FlutterNfcKit.nfcAvailability;

      if (availability != NFCAvailability.available) {
        if (mounted) {
          String message = 'NFC no está disponible';
          if (availability == NFCAvailability.disabled) {
            message =
                'NFC está deshabilitado. Por favor actívelo en configuración';
          } else if (availability == NFCAvailability.not_supported) {
            message = 'Este dispositivo no soporta NFC';
          }

          _mostrarMensajeSeguro(message, esError: true);
        }
        return;
      }

      setState(() {
        _isReading = true;
      });

      // Iniciar sesión de lectura con flutter_nfc_kit
      NFCTag tag = await FlutterNfcKit.poll(
        timeout: const Duration(seconds: 30),
        iosMultipleTagMessage: "Múltiples tags encontrados",
        iosAlertMessage: "Acerque el chip NFC al dispositivo",
      );

      // Generar ID único basado en el tag
      String nfcId = '';

      // Obtener el ID del tag - id nunca es null según la documentación
      if (tag.id.isNotEmpty) {
        // El ID ya viene en formato hexadecimal
        nfcId = tag.id;
      } else if (tag.ndefAvailable == true) {
        // Si hay datos NDEF pero no ID, generar uno
        nfcId = 'NFC-${DateTime.now().millisecondsSinceEpoch}';
      } else {
        // Generar un ID basado en timestamp
        nfcId = 'NFC-${DateTime.now().millisecondsSinceEpoch}';
      }

      // Si tenemos SINIGA, combinar para hacer único usando fullId
      String fullAreteId = nfcId; // ID puro del NFC
      if (controller.sinigaId != null && nfcId.isNotEmpty) {
        fullAreteId =
            '${controller.sinigaId!.fullId}-$nfcId'; // ID completo del arete
      }

      // Intentar leer datos NDEF si están disponibles
      if (tag.ndefAvailable ?? false) {
        try {
          // flutter_nfc_kit devuelve registros NDEF como lista de mapas
          // No necesitamos el tipo específico, solo verificar si hay registros
          final records = await FlutterNfcKit.readNDEFRecords();
          if (records.isNotEmpty) {
            // Aquí podrías procesar los registros NDEF si lo necesitas
            debugPrint('NDEF Records encontrados: ${records.length}');
            // Puedes acceder a los datos como: records[0].payload, etc.
          }
        } catch (e) {
          debugPrint('Error leyendo NDEF: $e');
        }
      }

      // Finalizar la sesión NFC
      await FlutterNfcKit.finish(iosAlertMessage: "Lectura completada");

      if (mounted) {
        setState(() {
          _isReading = false;
        });

        controller.setNfcIds(
          pureNfcId: nfcId, // ID puro del NFC
          fullAreteId: fullAreteId, // ID completo del arete
        );

        _mostrarMensajeSeguro('Chip NFC leído exitosamente', esError: false);
      }
    } on Exception catch (e) {
      // Manejar timeout y otros errores
      if (mounted) {
        setState(() {
          _isReading = false;
        });

        String errorMessage = 'Error al leer NFC';
        if (e.toString().contains('timeout')) {
          errorMessage = 'Tiempo de espera agotado. Intente nuevamente';
        } else if (e.toString().contains('user_canceled')) {
          errorMessage = 'Lectura cancelada';
        }

        _mostrarMensajeSeguro(
          errorMessage,
          esError: !e.toString().contains('user_canceled'),
        );
      }

      // Asegurar que la sesión NFC se cierre
      try {
        await FlutterNfcKit.finish();
      } catch (_) {}
    }
  }

  // Método de simulación para desarrollo
  void _simulateNfcReading(AnimalFormController controller) {
    setState(() {
      _isReading = true;
    });

    // Simular delay de lectura
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isReading = false;
        });

        // Generar ID simulado usando fullId correcto
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final randomId = (timestamp % 10000).toString().padLeft(4, '0');
        final pureSimulatedId = 'SIM-$randomId';
        final fullSimulatedId = controller.sinigaId != null
            ? '${controller.sinigaId!.fullId}-$pureSimulatedId'
            : 'NFC-$pureSimulatedId';

        controller.setNfcIds(
          pureNfcId: pureSimulatedId,
          fullAreteId: fullSimulatedId,
        );

        _mostrarMensajeSeguro('Chip NFC simulado (Desarrollo)', esError: false);
      }
    });
  }

  /// Método seguro para mostrar mensajes que verifica el estado del widget
  void _mostrarMensajeSeguro(String mensaje, {required bool esError}) {
    if (!mounted) return;

    try {
      final scaffoldMessenger = ScaffoldMessenger.maybeOf(context);
      if (scaffoldMessenger == null) return;

      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                esError ? Icons.error : Icons.check_circle,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(mensaje)),
            ],
          ),
          backgroundColor: esError ? Colors.red : Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      debugPrint('No se pudo mostrar mensaje NFC: $mensaje');
    }
  }

  @override
  void dispose() {
    // Asegurar que cualquier sesión NFC activa se cierre
    if (_isReading) {
      FlutterNfcKit.finish();
    }
    super.dispose();
  }
}
