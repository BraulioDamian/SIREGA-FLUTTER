// lib/nucleo/servicios/nfc_service.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:android_intent_plus/android_intent.dart';

/// Una clase de servicio para encapsular toda la lógica de lectura NFC.
class NfcService {
  /// Lee un chip NFC real.
  /// Devuelve el ID del chip como un String, o null si falla o se cancela.
  Future<String?> readNfcTag(BuildContext context) async {
    // 1. Verificar disponibilidad de NFC
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability == NFCAvailability.not_supported) {
      if (!context.mounted) return null;
      await _showAlertDialog(
        context: context,
        title: 'NFC no soportado',
        message: 'Tu dispositivo no es compatible con la tecnología NFC.',
      );
      return null;
    } else if (availability == NFCAvailability.disabled) {
      if (!context.mounted) return null;
      await _showAlertDialog(
        context: context,
        title: 'NFC desactivado',
        message:
            'Por favor, activa el NFC en la configuración de tu dispositivo.',
        actionText: 'Abrir Configuración',
        action: () {
          const intent = AndroidIntent(action: 'android.settings.NFC_SETTINGS');
          intent.launch();
        },
      );
      return null;
    }

    // 2. Iniciar el escaneo y mostrar un diálogo de espera
    try {
      final tag = await FlutterNfcKit.poll(
        timeout: const Duration(seconds: 15),
        iosAlertMessage: "Acerca el chip NFC al dispositivo",
      );

      // Si se lee un tag, devolvemos su ID
      HapticFeedback.mediumImpact(); // Vibración para confirmar
      if (!context.mounted) return tag.id;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chip NFC leído correctamente'),
          backgroundColor: Colors.green,
        ),
      );
      return tag.id;
    } catch (e) {
      // Manejar errores comunes como el timeout
      debugPrint('Error de NFC: $e');
      return null;
    } finally {
      // Siempre terminar la sesión de NFC
      await FlutterNfcKit.finish();
    }
  }

  /// Simula la lectura de un chip NFC mostrando un diálogo para ingresar un ID.
  Future<String?> simulateNfcTag(BuildContext context) async {
    final nfcIdController = TextEditingController();
    final id = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Simular lectura NFC'),
        content: TextField(
          controller: nfcIdController,
          decoration: const InputDecoration(labelText: 'ID NFC'),
          autofocus: true,
          onSubmitted: (v) => Navigator.of(ctx).pop(v.trim()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(nfcIdController.text.trim()),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
    nfcIdController.dispose();

    if (id != null && id.isNotEmpty) {
      if (!context.mounted) return id;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ID NFC simulado correctamente'),
          backgroundColor: Colors.green,
        ),
      );
      return id;
    }
    return null;
  }

  // Helper privado para mostrar diálogos de alerta
  Future<void> _showAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
    String? actionText,
    VoidCallback? action,
  }) async {
    if (!context.mounted) return;
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (actionText != null && action != null)
            ElevatedButton(
              onPressed: () {
                action();
                Navigator.of(ctx).pop();
              },
              child: Text(actionText),
            ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(actionText == null ? 'Entendido' : 'Cerrar'),
          ),
        ],
      ),
    );
  }
}
