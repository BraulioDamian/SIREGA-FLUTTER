import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:flutter/services.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:sirega_app/nucleo/modelos/siniga_model.dart';

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
  String? _nfcId;
  bool _isScanning = false;

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

  Future<void> _simulateReadNfc() async {
    if (_isScanning) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lectura en curso. Espere...'))
        );
      }
      return;
    }

    final nfcIdController = TextEditingController();

    final id = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Simular lectura NFC', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nfcIdController,
              decoration: const InputDecoration(
                labelText: 'ID NFC',
                hintText: 'Ingrese un ID único',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
              onSubmitted: (v) => Navigator.of(ctx).pop(v.trim()),
            ),
            const SizedBox(height: 12),
            Text(
              'Este ID se vinculará con el animal registrado',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop(nfcIdController.text.trim());
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
    nfcIdController.dispose();

    if (id != null && id.isNotEmpty && mounted) {
      setState(() => _nfcId = id);
      widget.onNfcIdChanged(id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('ID NFC asignado correctamente'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

Future<void> _readNfcReal() async {
    if (_isScanning) return;

    if (!mounted) return;

    setState(() => _isScanning = true);

    var availability = await FlutterNfcKit.nfcAvailability;
    if (!mounted) {
      // Widget was disposed during the async call, no need to update state.
      return;
    }

    if (availability == NFCAvailability.not_supported) {
      await _showAlertDialog(
        title: 'NFC no soportado',
        message: 'Tu dispositivo no es compatible con la tecnología NFC.',
        icon: Icons.error_outline,
        iconColor: Colors.redAccent,
      );
      if (mounted) setState(() => _isScanning = false);
      return;
    }
    
    if (availability == NFCAvailability.disabled) {
      await _showAlertDialog(
        title: 'NFC desactivado',
        message: 'Por favor, activa el NFC en la configuración de tu dispositivo para continuar.',
        icon: Icons.nfc,
        iconColor: Colors.orangeAccent,
        actionText: 'Abrir Configuración',
        action: () {
          const intent = AndroidIntent(action: 'android.settings.NFC_SETTINGS');
          intent.launch();
        },
      );
      if (mounted) setState(() => _isScanning = false);
      return;
    }

    try {
      // IMPORTANTE: Usar el modo foregroundMode para tener prioridad
      final result = await showDialog<dynamic>(
        context: context,
        barrierDismissible: true,
        builder: (ctx) {
          final navigator = Navigator.of(ctx);
          
          // Configurar opciones para evitar que se abran otras apps
          FlutterNfcKit.poll(
            timeout: const Duration(seconds: 15),
            iosMultipleTagMessage: "Multiple tags found!",
            iosAlertMessage: "Acerca el chip NFC al dispositivo",
            // Añadir esta opción si está disponible en tu versión de flutter_nfc_kit
            // readNdefOnly: false, // Lee cualquier tipo de tag
          ).then((tag) {
            if (navigator.canPop()) navigator.pop(tag);
            // Terminar inmediatamente después de leer
            FlutterNfcKit.finish(iosAlertMessage: "Lectura completada");
          }).catchError((e) {
            if (navigator.canPop()) navigator.pop(e);
            // Asegurarse de terminar la sesión incluso si hay error
            FlutterNfcKit.finish();
          });

          return WillPopScope(
            onWillPop: () async {
              // Si el usuario cancela, terminar la sesión NFC
              await FlutterNfcKit.finish();
              return true;
            },
            child: AlertDialog(
              backgroundColor: Colors.grey[50],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: const Text('Escaneando NFC', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Acerca el lector al chip NFC...', style: TextStyle(fontSize: 15)),
                  SizedBox(height: 8),
                  Text('Mantén el dispositivo cerca del chip', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await FlutterNfcKit.finish();
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          );
        },
      );

      if (!mounted) return;

      if (result is NFCTag) {
        setState(() => _nfcId = result.id);
        widget.onNfcIdChanged(result.id);
        
        // Vibración suave para confirmar lectura (opcional)
        HapticFeedback.mediumImpact();
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Chip NFC leído correctamente'),
            backgroundColor: Colors.green,
          ),
        );
      } else if (result != null && result is! NFCTag) {
        await _showAlertDialog(
          title: 'Error de Lectura',
          message: 'No se pudo leer el chip. Verifica que el chip esté funcionando correctamente.',
          icon: Icons.error_outline,
          iconColor: Colors.redAccent,
        );
      }
    } on PlatformException catch (e) {
      if (mounted) {
        await _showAlertDialog(
          title: 'Error de Plataforma NFC',
          message: 'Ocurrió un error al acceder al hardware NFC.\n\nError: ${e.message}',
          icon: Icons.error_outline,
          iconColor: Colors.redAccent,
        );
      }
    } catch (e) {
      if (mounted) {
        await _showAlertDialog(
          title: 'Error Inesperado',
          message: 'Ocurrió un error inesperado: ${e.toString()}',
          icon: Icons.error,
          iconColor: Colors.red,
        );
      }
    } finally {
      // Asegurarse de terminar la sesión NFC
      await FlutterNfcKit.finish();
      if (mounted) {
        setState(() => _isScanning = false);
      }
    }
  }

  Future<void> _showAlertDialog({
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
    String? actionText,
    VoidCallback? action,
  }) async {
    if (!mounted) return;
    
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.grey[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title, 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Text(message, style: const TextStyle(fontSize: 14)),
        actions: [
          if (actionText != null)
            ElevatedButton(
              onPressed: () {
                if (action != null) action();
                Navigator.of(ctx).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: iconColor,
                foregroundColor: Colors.white,
              ),
              child: Text(actionText),
            )
          else
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Entendido'),
            ),
        ],
      ),
    );
  }

  String? get nfcId => _nfcId;
}
