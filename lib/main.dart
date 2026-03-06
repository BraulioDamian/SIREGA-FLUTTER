// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sirega_app/firebase_options.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/nucleo/servicios/auth_service.dart';
import 'package:sirega_app/nucleo/servicios/connection_service.dart';
import 'package:sirega_app/nucleo/servicios/firebase_sync_service.dart';
import 'package:sirega_app/modulos/0_autenticacion/presentation/bloc/auth_bloc.dart';
import 'package:sirega_app/modulos/0_autenticacion/presentation/widgets/auth_wrapper.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentation/bloc/cattle_list_bloc.dart';
import 'package:sirega_app/presentation/screens/home_screen_mejorado.dart';
import 'package:sirega_app/core/theme/app_theme.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 2. Inicializar Isar (base de datos local)
  await IsarService.init();
  await IsarService.poblarDatosIniciales();

  // 3. Crear servicios
  final authService = AuthService();
  final isarService = IsarService();
  final syncService = FirebaseSyncService();
  final connectionService = ConnectionService();

  // 4. Inicializar ConnectionService y configurar auto-sync
  await connectionService.init();

  // Cuando detecta internet, sincroniza automáticamente
  connectionService.onConnected = () {
    debugPrint('🌐 Conexión a internet detectada - Sincronizando...');
    syncService.syncPendingChanges();
  };

  connectionService.onDisconnected = () {
    debugPrint('📵 Conexión perdida - Modo offline activado');
  };

  runApp(MyApp(
    authService: authService,
    isarService: isarService,
    syncService: syncService,
    connectionService: connectionService,
  ));
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  final IsarService isarService;
  final FirebaseSyncService syncService;
  final ConnectionService connectionService;

  const MyApp({
    super.key,
    required this.authService,
    required this.isarService,
    required this.syncService,
    required this.connectionService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IsarService>.value(value: isarService),
        RepositoryProvider<AuthService>.value(value: authService),
        RepositoryProvider<FirebaseSyncService>.value(value: syncService),
        RepositoryProvider<ConnectionService>.value(value: connectionService),
      ],
      child: MultiBlocProvider(
        providers: [
          // AuthBloc: Maneja autenticación y estado del usuario
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authService: authService,
              syncService: syncService,
            )..add(AuthCheckRequested()), // Verifica si hay sesión activa
          ),
          // CattleListBloc: Maneja la lista de ganado
          BlocProvider<CattleListBloc>(
            create: (context) => CattleListBloc(
              isarService: isarService,
            )..add(LoadCattle()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SIREGA',
          theme: AppTheme.lightTheme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('es', ''), // Spanish
          ],
          // AuthWrapper protege todas las rutas
          // Solo muestra HomeScreenMejorado si el usuario está autenticado
          home: const AuthWrapper(
            child: HomeScreenMejorado(),
          ),
        ),
      ),
    );
  }
}