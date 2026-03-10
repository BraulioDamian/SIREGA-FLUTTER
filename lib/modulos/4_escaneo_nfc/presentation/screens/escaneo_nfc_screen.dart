import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/nfc_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/bloc/esp32_scanner_bloc.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/repositories/esp32_repository_impl.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/repositories/nfc_repository_impl.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/animal_database_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/esp32_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/esp32_ble_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/data/services/nfc_service.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/connect_to_esp32_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/disconnect_from_esp32_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/finish_nfc_scan_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/open_wifi_settings_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/find_animal_by_uid_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/domain/use_cases/scan_nfc_use_case.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/widgets/escaner_externo_tab.dart';
import 'package:sirega_app/modulos/4_escaneo_nfc/presentation/widgets/escaner_movil_tab.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';

class EscaneoNfcScreen extends StatelessWidget {
  const EscaneoNfcScreen({super.key});

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
            children: [
              EscannerMovilTab(),
              EscannerExternoTab(),
            ],
          ),
        ),
      ),
    );
  }
}
