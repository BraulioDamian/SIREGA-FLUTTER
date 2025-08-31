import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirega_app/nucleo/servicios/nfc_service.dart';
import '../controllers/animal_form_controller.dart';

class NfcSection extends StatefulWidget {
  const NfcSection({super.key});

  @override
  State<NfcSection> createState() => _NfcSectionState();
}

class _NfcSectionState extends State<NfcSection> {
  final _nfcService = NfcService();
  bool _isReading = false;

  Future<void> _startNfcReading(AnimalFormController controller) async {
    if (_isReading) return;
    setState(() => _isReading = true);

    final nfcId = await _nfcService.readNfcTag(context);

    if (mounted && nfcId != null) {
      // La combinación del ID se hace en el controlador
      controller.setNfcId(nfcId);
    }

    if (mounted) {
      setState(() => _isReading = false);
    }
  }

  Future<void> _startNfcSimulation(AnimalFormController controller) async {
    if (_isReading) return;
    setState(() => _isReading = true);

    final nfcId = await _nfcService.simulateNfcTag(context);

    if (mounted && nfcId != null) {
      controller.setNfcId(nfcId);
    }

    if (mounted) {
      setState(() => _isReading = false);
    }
  }

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
                    const SizedBox(height: 16),
                    if (hasNfc)
                      _buildNfcDetected(controller, isMobile)
                    else
                      _buildNfcButtons(context, controller, isMobile),
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

  Widget _buildNfcButtons(
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
          child: ElevatedButton.icon(
            onPressed: canRead && !_isReading ? () => _startNfcReading(controller) : null,
            icon: _isReading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Icon(Icons.nfc),
            label: Text(_isReading ? 'Escaneando...' : 'Leer Chip NFC'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: canRead && !_isReading ? () => _startNfcSimulation(controller) : null,
            icon: const Icon(Icons.sensors_off),
            label: const Text('Simular Lectura'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.grey.shade300,
              foregroundColor: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
