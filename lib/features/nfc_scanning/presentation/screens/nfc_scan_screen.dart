import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/nfc_scanner_bloc.dart';
import 'package:sirega_app/features/nfc_scanning/bloc/esp32_scanner_bloc.dart';
import 'package:sirega_app/features/nfc_scanning/data/repositories/esp32_repository_impl.dart';
import 'package:sirega_app/features/nfc_scanning/data/repositories/nfc_repository_impl.dart';
import 'package:sirega_app/features/nfc_scanning/data/services/animal_database_service.dart';
import 'package:sirega_app/features/nfc_scanning/data/services/esp32_service.dart';
import 'package:sirega_app/features/nfc_scanning/data/services/esp32_ble_service.dart';
import 'package:sirega_app/features/nfc_scanning/data/services/nfc_service.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/connect_to_esp32_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/disconnect_from_esp32_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/finish_nfc_scan_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/open_wifi_settings_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/find_animal_by_uid_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/domain/use_cases/scan_nfc_use_case.dart';
import 'package:sirega_app/features/nfc_scanning/presentation/widgets/external_scanner_tab.dart';
import 'package:sirega_app/features/nfc_scanning/presentation/widgets/mobile_scanner_tab.dart';
import 'package:sirega_app/core/services/isar_service.dart';

class NfcScanScreen extends StatelessWidget {
  const NfcScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isarService = IsarService();
    final animalDbService = AnimalDatabaseService(isarService);
    final nfcRepository = NfcRepositoryImpl(NfcService(), animalDbService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NfcScannerBloc(
            ScanNfcUseCase(nfcRepository),
            FinishNfcScanUseCase(nfcRepository),
          ),
        ),
        BlocProvider(
          create: (context) {
            final esp32Repository = Esp32RepositoryImpl(
              Esp32Service(),
              Esp32BleService(),
            );
            return Esp32ScannerBloc(
              ConnectToEsp32UseCase(esp32Repository),
              DisconnectFromEsp32UseCase(esp32Repository),
              FindAnimalByUidUseCase(animalDbService),
              OpenWifiSettingsUseCase(esp32Repository),
              esp32Repository,
            );
          },
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Escanear Arete NFC'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Escáner Móvil'),
                Tab(text: 'Escáner Externo'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [EscannerMovilTab(), EscannerExternoTab()],
          ),
        ),
      ),
    );
  }
}
