import 'package:flutter/material.dart';
import 'package:sirega_app/nucleo/modelos/siniga_model.dart';
import 'package:sirega_app/nucleo/servicios/nfc_service.dart'; // Importa tu nuevo servicio

class ResponsiveNfcSection extends StatefulWidget {
  final Function(String?) onNfcIdChanged;
  final SinigaId? currentSinigaId;
  final bool sinigaIsValid;

  const ResponsiveNfcSection({
    super.key,
    required this.onNfcIdChanged,
    this.currentSinigaId,
    this.sinigaIsValid = false,
  });

  @override
  State<ResponsiveNfcSection> createState() => ResponsiveNfcSectionState();
}

class ResponsiveNfcSectionState extends State<ResponsiveNfcSection> {
  final _nfcService = NfcService(); // Crea una instancia del servicio
  String? _nfcId;
  bool _isScanning = false;

  /// Este método ahora solo gestiona el estado de la UI y llama al servicio.
  Future<void> _readNfcReal() async {
    if (_isScanning) return;
    setState(() => _isScanning = true);

    // Llama al servicio para hacer el trabajo pesado
    final nfcId = await _nfcService.readNfcTag(context);

    // Si el servicio devolvió un ID, actualiza el estado del widget
    if (mounted && nfcId != null) {
      setState(() => _nfcId = nfcId);
      widget.onNfcIdChanged(nfcId);
    }

    if (mounted) {
      setState(() => _isScanning = false);
    }
  }

  /// Igual que el anterior, este método ahora solo llama al servicio.
  Future<void> _simulateReadNfc() async {
    if (_isScanning) return;
    setState(() => _isScanning = true);

    // Llama al servicio para la simulación
    final nfcId = await _nfcService.simulateNfcTag(context);

    if (mounted && nfcId != null) {
      setState(() => _nfcId = nfcId);
      widget.onNfcIdChanged(nfcId);
    }

    if (mounted) {
      setState(() => _isScanning = false);
    }
  }
  
  // NINGÚN CÓDIGO DE UI CAMBIA. TODO LO SIGUIENTE QUEDA IGUAL.

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: isMobile ? 8 : 12),
                _buildDescription(isMobile),
                SizedBox(height: isMobile ? 12 : 16),
                _buildNfcButtons(isMobile),
                if (_nfcId != null && _nfcId!.isNotEmpty) ...[
                  SizedBox(height: isMobile ? 12 : 16),
                  _buildNfcInfo(isMobile),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Icon(
          Icons.nfc, 
          color: Colors.orange.shade700,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 6 : 8),
        Expanded(
          child: Text(
            'Lectura de Chip NFC (Obligatorio)',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange.shade700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(bool isMobile) {
    return Text(
      'El chip NFC se vinculará automáticamente con el ID SINIGA',
      style: TextStyle(
        fontSize: isMobile ? 12 : 14, 
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget _buildNfcButtons(bool isMobile) {
    // Este método no cambia, ya que solo lee las variables _isScanning,
    // y llama a los métodos _readNfcReal y _simulateReadNfc.
    if (isMobile) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: _isScanning 
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.nfc),
              label: Text(_isScanning ? 'Escaneando...' : 'Leer Chip Real'),
              onPressed: _isScanning ? null : _readNfcReal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.sensors),
              label: const Text('Simular Lectura'),
              onPressed: _isScanning ? null : _simulateReadNfc,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: _isScanning 
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.nfc),
              label: Text(_isScanning ? 'Escaneando...' : 'Leer Chip Real'),
              onPressed: _isScanning ? null : _readNfcReal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.sensors),
              label: const Text('Simular'),
              onPressed: _isScanning ? null : _simulateReadNfc,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildNfcInfo(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 10 : 12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle, 
                color: Colors.orange.shade700,
                size: isMobile ? 20 : 24,
              ),
              SizedBox(width: isMobile ? 6 : 8),
              Text(
                'Chip NFC Leído',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: isMobile ? 14 : 16,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 6 : 8),
          Text(
            'ID NFC: $_nfcId',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: isMobile ? 13 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (widget.sinigaIsValid && widget.currentSinigaId != null) ...[
            SizedBox(height: isMobile ? 4 : 6),
            Text(
              '🔗 Se vinculará con SINIGA: ${widget.currentSinigaId!.formatoVisual}',
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                color: Colors.green.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String? get nfcId => _nfcId;
}