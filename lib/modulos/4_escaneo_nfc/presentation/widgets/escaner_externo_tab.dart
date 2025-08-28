import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_state.dart';
import 'package:android_intent_plus/android_intent.dart';

class EscannerExternoTab extends StatelessWidget {
  const EscannerExternoTab({Key? key}) : super(key: key);

  void _openWifiSettings() {
    const intent = AndroidIntent(action: 'android.settings.WIFI_SETTINGS');
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
                icon: const Icon(Icons.wifi_tethering),
                onPressed: () {
                  context.read<Esp32ScannerBloc>().add(ConnectToEsp32Event());
                },
                label: const Text('Conectar con dispositivo'),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<Esp32ScannerBloc, Esp32ScannerState>(
              builder: (context, state) {
                if (state is Esp32ScannerInitial) {
                  return const Text('Presiona para conectar con el escáner externo.');
                }
                if (state is Esp32Connecting) {
                  return const Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Conectando al ESP32...'),
                    ],
                  );
                }
                if (state is Esp32Connected) {
                  return const Card(
                    child: ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text('Conectado'),
                      subtitle: Text('Esperando lectura de arete...'),
                    ),
                  );
                }
                if (state is Esp32UidReceived) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.pets, color: Colors.green),
                      title: const Text('Animal Encontrado'),
                      subtitle: Text(state.animalName),
                    ),
                  );
                }
                if (state is Esp32Error) {
                  return Card(
                    color: Colors.red.shade100,
                    child: ListTile(
                      leading: const Icon(Icons.error, color: Colors.red),
                      title: const Text('Error de Conexión'),
                      subtitle: Text(state.errorMessage),
                    ),
                  );
                }
                if (state is WifiDisabled) {
                  return Column(
                    children: [
                      const Text('El WiFi está desactivado.'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _openWifiSettings,
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
