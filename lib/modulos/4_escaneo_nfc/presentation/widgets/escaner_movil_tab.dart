import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_state.dart';
import 'package:android_intent_plus/android_intent.dart';

class EscannerMovilTab extends StatelessWidget {
  const EscannerMovilTab({Key? key}) : super(key: key);

  void _openNfcSettings() {
    const intent = AndroidIntent(action: 'android.settings.NFC_SETTINGS');
    intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.nfc),
                onPressed: () {
                  context.read<NfcScannerBloc>().add(ScanNfcEvent());
                },
                label: const Text('Escanear'),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<NfcScannerBloc, NfcScannerState>(
              builder: (context, state) {
                if (state is NfcScannerInitial) {
                  return const Text('Presiona el botón para escanear un arete NFC.');
                }
                if (state is NfcScanning) {
                  return const Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Acercando el lector al chip...'),
                    ],
                  );
                }
                if (state is NfcScanSuccess) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.pets, color: Colors.green),
                      title: const Text('Animal Encontrado'),
                      subtitle: Text(state.animalName),
                    ),
                  );
                }
                if (state is NfcScanError) {
                  return Card(
                    color: Colors.red.shade100,
                    child: ListTile(
                      leading: const Icon(Icons.error, color: Colors.red),
                      title: const Text('Error'),
                      subtitle: Text(state.errorMessage),
                    ),
                  );
                }
                if (state is NfcNotAvailable) {
                  return const Text('NFC no disponible en este dispositivo.');
                }
                if (state is NfcDisabled) {
                  return Column(
                    children: [
                      const Text('El NFC está desactivado.'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _openNfcSettings,
                        child: const Text('Activar en Ajustes'),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
