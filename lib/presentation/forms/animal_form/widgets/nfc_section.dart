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
            
            return Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context, isMobile),
                    SizedBox(height: isMobile ? 12 : 16),
                    _buildNfcContent(context, controller, hasNfc, isMobile),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Icon(
          Icons.nfc,
          color: Theme.of(context).primaryColor,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Chip NFC (Obligatorio)',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNfcContent(
    BuildContext context,
    AnimalFormController controller,
    bool hasNfc,
    bool isMobile,
  ) {
    if (_isReading) {
      return _buildReadingState(isMobile);
    }
    
    if (hasNfc) {
      return _buildNfcDetected(controller, isMobile);
    }
    
    return _buildReadNfcButton(context, controller, isMobile);
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
        ],
      ),
    );
  }

  Widget _buildNfcDetected(
    AnimalFormController controller,
    bool isMobile,
  ) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(isMobile ? 12 : 16),
          decoration: BoxDecoration(
            color: Colors.green.withAlpha(26),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        TextButton.icon(
          onPressed: () => _startNfcReading(controller),
          icon: const Icon(Icons.refresh),
          label: const Text('Leer otro chip'),
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
              color: Colors.orange.withAlpha(26),
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
            onPressed: canRead ? () => _startNfcReading(controller) : null,
            icon: const Icon(Icons.nfc),
            label: Text(
              'Leer Chip NFC',
              style: TextStyle(fontSize: isMobile ? 16 : 18),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _startNfcReading(AnimalFormController controller) async {
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('NFC no disponible o desactivado.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    setState(() {
      _isReading = true;
    });

    try {
      final tag = await FlutterNfcKit.poll(
        timeout: const Duration(seconds: 15),
        iosAlertMessage: "Acerca el chip NFC al dispositivo",
      );

      String nfcId = tag.id;

      // Si tenemos SINIGA, podemos combinar para hacer único
      if (controller.sinigaId != null && nfcId.isNotEmpty) {
        nfcId = '${controller.sinigaId!.fullId}-$nfcId';
      } else if (nfcId.isEmpty) {
        // Generar un ID basado en timestamp si no hay ID del tag
        nfcId = 'NFC-${DateTime.now().millisecondsSinceEpoch}';
      }
      
      if (mounted) {
        controller.setNfcId(nfcId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Chip NFC leído exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al leer NFC: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isReading = false;
        });
      }
      await FlutterNfcKit.finish();
    }
  }
}