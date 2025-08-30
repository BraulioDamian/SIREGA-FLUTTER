import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_event.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_state.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/widgets/scan_result_widget.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/widgets/connection_widgets.dart' as connection;
import 'package:android_intent_plus/android_intent.dart';

class EscannerMovilTab extends StatefulWidget {
  const EscannerMovilTab({super.key});

  @override
  State<EscannerMovilTab> createState() => _EscannerMovilTabState();
}

class _EscannerMovilTabState extends State<EscannerMovilTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _openNfcSettings() {
    const intent = AndroidIntent(action: 'android.settings.NFC_SETTINGS');
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

    return BlocBuilder<NfcScannerBloc, NfcScannerState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _buildContent(context, state, theme),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, NfcScannerState state, ThemeData theme) {
    if (state is NfcScannerInitial) {
      return _buildInitialState(context, theme);
    }

    if (state is NfcScanning) {
      return const connection.ScanningIndicatorWidget(
        message: 'Escaneando...',
        submessage: 'Acerca el dispositivo al arete NFC',
      );
    }

    if (state is NfcAnimalFound) {
      return ScanResultWidget(
        animal: state.animal,
        successMessage: 'Animal escaneado correctamente',
        onScanAnother: () {
          context.read<NfcScannerBloc>().add(ResetNfcScannerEvent());
        },
        onViewDetails: () => _navigateToAnimalDetail(context, state.animal),
        onEditData: () => _editAnimalData(context, state.animal),
      );
    }

    if (state is NfcScanError) {
      return connection.ScanErrorWidget(
        errorMessage: state.errorMessage,
        onRetry: () {
          context.read<NfcScannerBloc>().add(ScanNfcEvent());
        },
      );
    }

    if (state is NfcNotAvailable) {
      return _buildNfcNotAvailableState(theme);
    }

    if (state is NfcDisabled) {
      return _buildNfcDisabledState(theme);
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
                Icons.nfc,
                size: 70,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Escáner NFC Móvil',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Usa el NFC de tu dispositivo para leer aretes',
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
                  context.read<NfcScannerBloc>().add(ScanNfcEvent());
                },
                icon: const Icon(Icons.nfc_rounded),
                label: const Text('Iniciar Escaneo'),
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
                  color: Colors.blue.withAlpha((255 * 0.2).round()),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.blue.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Asegúrate de que el NFC esté activado en tu dispositivo',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNfcNotAvailableState(ThemeData theme) {
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
                Icons.nfc_outlined,
                size: 60,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'NFC No Disponible',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.orange.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Este dispositivo no cuenta con lector NFC',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withAlpha((255 * 0.05).round()),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    color: theme.colorScheme.primary,
                    size: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sugerencia',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Usa la pestaña "Escáner Externo" para conectar un dispositivo ESP32 con lector NFC',
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNfcDisabledState(ThemeData theme) {
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
                color: Colors.grey.withAlpha((255 * 0.1).round()),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.nfc_outlined,
                size: 60,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'NFC Desactivado',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Activa el NFC para escanear aretes',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _openNfcSettings,
              icon: const Icon(Icons.settings),
              label: const Text('Abrir Configuración'),
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
                context.read<NfcScannerBloc>().add(ScanNfcEvent());
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Verificar Estado'),
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
