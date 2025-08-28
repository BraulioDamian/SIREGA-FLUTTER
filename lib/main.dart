// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/nucleo/servicios/isar_service.dart';
import 'package:sirega_app/modulos/1_lista_ganado/presentacion/bloc/cattle_list_bloc.dart';
import 'package:sirega_app/presentation/screens/home_screen_mejorado.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.init();
  await IsarService.poblarDatosIniciales();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IsarService>(
      create: (context) => IsarService(),
      child: BlocProvider<CattleListBloc>(
        create: (context) => CattleListBloc(
          isarService: RepositoryProvider.of<IsarService>(context),
        )..add(LoadCattle()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SIREGA',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
            inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
          ),
          home: const HomeScreenMejorado(),
        ),
      ),
    );
  }
}