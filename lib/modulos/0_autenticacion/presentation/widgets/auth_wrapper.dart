// lib/modulos/0_autenticacion/presentation/widgets/auth_wrapper.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sirega_app/modulos/0_autenticacion/presentation/bloc/auth_bloc.dart';
import 'package:sirega_app/modulos/0_autenticacion/presentation/screens/login_screen.dart';

/// Widget que maneja la navegación basada en el estado de autenticación
/// Protege las rutas de la aplicación
class AuthWrapper extends StatelessWidget {
  final Widget child;

  const AuthWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        // Loading: Mostrar splash/loading screen
        if (state is AuthInitial || state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Cargando...'),
                ],
              ),
            ),
          );
        }

        // Authenticated: Mostrar la app protegida
        if (state is AuthAuthenticated) {
          return child;
        }

        // Unauthenticated o Error: Mostrar login
        return const LoginScreen();
      },
    );
  }
}
