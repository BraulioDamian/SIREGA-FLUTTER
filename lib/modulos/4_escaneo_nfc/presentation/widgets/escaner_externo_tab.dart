import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_state.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/widgets/scan_result_widget.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/widgets/connection_widgets.dart' as connection;
import 'package:android_intent_plus/android_intent.dart';

class EscannerExternoTab extends StatefulWidget {
  const EscannerExternoTab({super.key});

  @override
  State<EscannerExternoTab> createState() => _EscannerExternoTabState();
}

class _EscannerExternoTabState extends State<EscannerExternoTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // Verificar el estado de conexión al iniciar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Esp32ScannerBloc>().add(CheckConnectionStatusEvent());
    });
  }

  void _openWifiSettings() {
    const intent = AndroidIntent(action: 'android.settings.WIFI_SETTINGS');
    intent.launch();
  }

  void _navigateToAnimalDetail(BuildContext context, animal) {
    Navigator.pushNamed(
      context,
      '/cattle-detail',
      arguments: animal,
    );
  }

  void _editAnimalData(BuildContext context, animal) {
    Navigator.pushNamed(
      context,
      '/edit-animal',
      arguments: animal,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);

    return BlocBuilder<Esp32ScannerBloc, Esp32ScannerState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _buildContent(context, state, theme),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, Esp32ScannerState state, ThemeData theme) {
    if (state is Esp32ScannerInitial) {
      return _buildInitialState(context, theme);
    }

    if (state is Esp32Connecting) {
      return const connection.ScanningIndicatorWidget(
        message: 'Conectando con ESP32...',
        submessage: 'Asegúrate de que el dispositivo esté encendido',
      );
    }

    if (state is Esp32Connected) {
      return _buildConnectedState(context, theme);
    }

    if (state is Esp32AnimalFound) {
      return ScanResultWidget(
        animal: state.animal,
        successMessage: 'Animal detectado por ESP32',
        onScanAnother: () {
          context.read<Esp32ScannerBloc>().add(ResetScannerEvent());
        },
        onViewDetails: () => _navigateToAnimalDetail(context, state.animal),
        onEditData: () => _editAnimalData(context, state.animal),
      );
    }

    if (state is Esp32Error) {
      return connection.ScanErrorWidget(
        errorMessage: state.errorMessage,
        onRetry: () {
          context.read<Esp32ScannerBloc>().add(ConnectToEsp32Event());
        },
        onOpenWifiSettings: () {
          // Abrir configuración WiFi
          final event = OpenWifiSettingsEvent();
          context.read<Esp32ScannerBloc>().add(event);
        },
      );
    }

    if (state is WifiDisabled) {
      return _buildWifiDisabledState(theme);
    }

    return Container();
  }

  Widget _buildInitialState(BuildContext context, ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withAlpha((255 * 0.1).round()),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.wifi_tethering,
                size: 70,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Escáner Externo ESP32',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Conecta el dispositivo ESP32 para escanear aretes',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<Esp32ScannerBloc>().add(ConnectToEsp32Event());
                },
                icon: const Icon(Icons.bluetooth_searching),
                label: const Text('Conectar Dispositivo'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 0,
              color: Colors.blue.withAlpha((255 * 0.05).round()),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Colors.blue.withAlpha((255 * 0.3).round()),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue.shade700,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Instrucciones de Conexión',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Para conectar el ESP32:',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...[
                      '1. Enciende el dispositivo ESP32',
                      '2. Conecta tu teléfono a la red WiFi "ESP32-NFC"',
                      '3. Presiona "Conectar Dispositivo"',
                      '4. El sistema verificará la conexión automáticamente',
                    ].map((step) => Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Text(
                        step,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.blue.shade600,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectedState(BuildContext context, ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Estado de conexión
            connection.ConnectionStatusWidget(
              isConnected: true,
              deviceName: 'ESP32 Scanner',
              onDisconnect: () {
                context.read<Esp32ScannerBloc>().add(DisconnectFromEsp32Event());
              },
            ),
            const SizedBox(height: 32),

            // Animación de espera
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    theme.colorScheme.primary.withAlpha((255 * 0.1).round()),
                    theme.colorScheme.primary.withAlpha((255 * 0.0).round()),
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Círculo animado exterior
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(seconds: 2),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: 0.8 + (0.2 * value),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme.colorScheme.primary.withAlpha((255 * 0.3).round()),
                              width: 2,
                            ),
                          ),
                        ),
                      );
                    },
                    onEnd: () {
                      // Reiniciar la animación
                      setState(() {});
                    },
                  ),
                  // Icono central
                  Icon(
                    Icons.nfc,
                    size: 60,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Mensaje de estado
            Text(
              'Esperando lectura NFC',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Acerca el arete al lector ESP32',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),

            // Información adicional
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha((255 * 0.05).round()),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green.withAlpha((255 * 0.2).round()),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Dispositivo listo para escanear',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWifiDisabledState(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.orange.withAlpha((255 * 0.1).round()),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.wifi_off,
                size: 60,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'WiFi Desactivado',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.orange.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Activa el WiFi para conectar con el dispositivo ESP32',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _openWifiSettings,
              icon: const Icon(Icons.settings),
              label: const Text('Abrir Configuración WiFi'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {
                context.read<Esp32ScannerBloc>().add(ConnectToEsp32Event());
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar Conexión'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
