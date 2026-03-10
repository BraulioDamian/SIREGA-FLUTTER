import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_state.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/repositories/esp32_repository.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/widgets/scan_result_widget.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/widgets/connection_widgets.dart'
    as connection;
import 'package:android_intent_plus/android_intent.dart';
import 'package:sirega_app/core/theme/app_colors.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<Esp32ScannerBloc>().add(CheckConnectionStatusEvent());
    });
  }

  void _openWifiSettings() {
    const intent = AndroidIntent(action: 'android.settings.WIFI_SETTINGS');
    intent.launch();
  }

  void _navigateToAnimalDetail(BuildContext context, animal) {
    Navigator.pushNamed(context, '/cattle-detail', arguments: animal);
  }

  void _editAnimalData(BuildContext context, animal) {
    Navigator.pushNamed(context, '/edit-animal', arguments: animal);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);

    return BlocBuilder<Esp32ScannerBloc, Esp32ScannerState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildModeSelector(context, state, theme),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _buildContent(context, state, theme),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Selector BLE / WiFi 
  Widget _buildModeSelector(
      BuildContext context, Esp32ScannerState state, ThemeData theme) {
    final mode = state.connectionMode;
    final isBle = mode == Esp32ConnectionMode.ble;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ModeButton(
              icon: Icons.bluetooth,
              label: 'BLE',
              sublabel: 'Bajo consumo',
              isSelected: isBle,
              onTap: () => context.read<Esp32ScannerBloc>().add(
                    const ChangeConnectionModeEvent(Esp32ConnectionMode.ble),
                  ),
            ),
          ),
          Expanded(
            child: _ModeButton(
              icon: Icons.wifi,
              label: 'WiFi',
              sublabel: 'WebSocket',
              isSelected: !isBle,
              onTap: () => context.read<Esp32ScannerBloc>().add(
                    const ChangeConnectionModeEvent(Esp32ConnectionMode.wifi),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, Esp32ScannerState state, ThemeData theme) {
    if (state is Esp32ScannerInitial) {
      return _buildInitialState(context, state.connectionMode, theme);
    }
    if (state is Esp32Connecting) {
      final isBle = state.connectionMode == Esp32ConnectionMode.ble;
      return connection.ScanningIndicatorWidget(
        message: isBle
            ? 'Buscando ESP32 por BLE...'
            : 'Conectando con ESP32...',
        submessage: isBle
            ? 'Asegúrate de que el dispositivo esté encendido y cercano'
            : 'Asegúrate de que el dispositivo esté encendido',
      );
    }
    if (state is Esp32Connected) {
      return _buildConnectedState(context, state.connectionMode, theme);
    }
    if (state is Esp32AnimalFound) {
      return ScanResultWidget(
        animal: state.animal,
        successMessage: 'Animal detectado por ESP32',
        onScanAnother: () =>
            context.read<Esp32ScannerBloc>().add(ResetScannerEvent()),
        onViewDetails: () => _navigateToAnimalDetail(context, state.animal),
        onEditData: () => _editAnimalData(context, state.animal),
      );
    }
    if (state is Esp32Error) {
      return connection.ScanErrorWidget(
        errorMessage: state.errorMessage,
        onRetry: () =>
            context.read<Esp32ScannerBloc>().add(ConnectToEsp32Event()),
        onOpenWifiSettings:
            state.connectionMode == Esp32ConnectionMode.wifi
                ? () => context
                    .read<Esp32ScannerBloc>()
                    .add(OpenWifiSettingsEvent())
                : null,
      );
    }
    if (state is WifiDisabled) {
      return _buildWifiDisabledState(theme);
    }
    if (state is BluetoothDisabled) {
      return _buildBluetoothDisabledState(theme);
    }
    return const SizedBox.shrink();
  }

  Widget _buildInitialState(
      BuildContext context, Esp32ConnectionMode mode, ThemeData theme) {
    final isBle = mode == Esp32ConnectionMode.ble;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color:
                    theme.colorScheme.primary.withAlpha((255 * 0.1).round()),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isBle ? Icons.bluetooth : Icons.wifi_tethering,
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
              isBle
                  ? 'Conecta por Bluetooth de bajo consumo'
                  : 'Conecta el dispositivo ESP32 por WiFi',
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () => context
                    .read<Esp32ScannerBloc>()
                    .add(ConnectToEsp32Event()),
                icon: Icon(
                    isBle ? Icons.bluetooth_searching : Icons.wifi_tethering),
                label: const Text('Conectar Dispositivo'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildInstructionsCard(isBle, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionsCard(bool isBle, ThemeData theme) {
    final steps = isBle
        ? [
            '1. Enciende el dispositivo ESP32',
            '2. El ESP32 se anuncia como "SIREGA-NFC"',
            '3. Presiona "Conectar Dispositivo"',
            '4. Se conectará automáticamente por BLE',
          ]
        : [
            '1. Enciende el dispositivo ESP32',
            '2. Conecta tu teléfono a la red WiFi "ESP32-NFC"',
            '3. Presiona "Conectar Dispositivo"',
            '4. El sistema verificará la conexión automáticamente',
          ];

    return Card(
      elevation: 0,
      color: AppColors.info.withAlpha((255 * 0.05).round()),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.info.withAlpha((255 * 0.3).round()),
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
                const Icon(Icons.info_outline, color: AppColors.info, size: 20),
                const SizedBox(width: 8),
                Text(
                  isBle ? 'Conexión BLE' : 'Conexión WiFi',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.info,
                  ),
                ),
              ],
            ),
            if (isBle) ...[
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.success.withAlpha((255 * 0.1).round()),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '⚡ Modo de bajo consumo — ideal para batería',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 12),
            ...steps.map((step) => Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 4),
                  child: Text(
                    step,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: AppColors.info),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectedState(
      BuildContext context, Esp32ConnectionMode mode, ThemeData theme) {
    final isBle = mode == Esp32ConnectionMode.ble;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            connection.ConnectionStatusWidget(
              isConnected: true,
              deviceName: isBle ? 'ESP32 BLE' : 'ESP32 WiFi',
              onDisconnect: () => context
                  .read<Esp32ScannerBloc>()
                  .add(DisconnectFromEsp32Event()),
            ),
            const SizedBox(height: 32),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  theme.colorScheme.primary.withAlpha((255 * 0.1).round()),
                  theme.colorScheme.primary.withAlpha(0),
                ]),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
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
                              color: theme.colorScheme.primary
                                  .withAlpha((255 * 0.3).round()),
                              width: 2,
                            ),
                          ),
                        ),
                      );
                    },
                    onEnd: () => setState(() {}),
                  ),
                  Icon(Icons.nfc, size: 60, color: theme.colorScheme.primary),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Esperando lectura NFC',
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Acerca el arete al lector ESP32',
              style:
                  theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.success.withAlpha((255 * 0.05).round()),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.success.withAlpha((255 * 0.2).round()),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isBle
                        ? 'Conectado por BLE — bajo consumo'
                        : 'Conectado por WiFi',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: AppColors.success),
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
                color: AppColors.warning.withAlpha((255 * 0.1).round()),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.wifi_off, size: 60, color: AppColors.warning),
            ),
            const SizedBox(height: 24),
            Text(
              'WiFi Desactivado',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppColors.warning,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Activa el WiFi para conectar con el dispositivo ESP32',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _openWifiSettings,
              icon: const Icon(Icons.settings),
              label: const Text('Abrir Configuración WiFi'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => context
                  .read<Esp32ScannerBloc>()
                  .add(ConnectToEsp32Event()),
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar Conexión'),
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBluetoothDisabledState(ThemeData theme) {
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
                color: AppColors.warning.withAlpha((255 * 0.1).round()),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.bluetooth_disabled,
                  size: 60, color: AppColors.warning),
            ),
            const SizedBox(height: 24),
            Text(
              'Bluetooth Desactivado',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: AppColors.warning,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Activa el Bluetooth para conectar con el ESP32 por BLE',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  if (Platform.isAndroid) {
                    await FlutterBluePlus.turnOn();
                  } else {
                    // iOS: abrir ajustes de Bluetooth del sistema
                    const intent = AndroidIntent(
                      action: 'android.settings.BLUETOOTH_SETTINGS',
                    );
                    await intent.launch();
                  }
                } catch (_) {
                  // Si falla turnOn, abrir ajustes de Bluetooth
                  const intent = AndroidIntent(
                    action: 'android.settings.BLUETOOTH_SETTINGS',
                  );
                  await intent.launch();
                }
                // Esperar a que se active y reintentar
                await Future.delayed(const Duration(seconds: 2));
                if (mounted) {
                  context
                      .read<Esp32ScannerBloc>()
                      .add(ConnectToEsp32Event());
                }
              },
              icon: const Icon(Icons.bluetooth, color: Colors.white),
              label: const Text('Activar Bluetooth'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => context
                  .read<Esp32ScannerBloc>()
                  .add(ConnectToEsp32Event()),
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar Conexión'),
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Botón de modo (BLE / WiFi) para el selector
class _ModeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeButton({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? AppColors.surface : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? AppColors.surface
                        : AppColors.textPrimary,
                  ),
                ),
                Text(
                  sublabel,
                  style: TextStyle(
                    fontSize: 10,
                    color: isSelected
                        ? AppColors.surface.withAlpha((255 * 0.8).round())
                        : AppColors.textHint,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
