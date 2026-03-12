// lib/modulos/0_autenticacion/presentation/bloc/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sirega_app/core/services/auth_service.dart';
import 'package:sirega_app/core/services/firebase_sync_service.dart';

// ========== EVENTOS ==========
abstract class AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

class AuthRegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String displayName;

  AuthRegisterRequested({
    required this.email,
    required this.password,
    required this.displayName,
  });
}

class AuthGoogleLoginRequested extends AuthEvent {}

class AuthLogoutRequested extends AuthEvent {}

class AuthUserChanged extends AuthEvent {
  final User? user;

  AuthUserChanged(this.user);
}

// ========== ESTADOS ==========
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  final bool isSyncing;

  const AuthAuthenticated(this.user, {this.isSyncing = false});

  AuthAuthenticated copyWith({bool? isSyncing}) {
    return AuthAuthenticated(user, isSyncing: isSyncing ?? this.isSyncing);
  }
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}

// ========== BLOC ==========
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final FirebaseSyncService? _syncService;

  AuthBloc({required AuthService authService, FirebaseSyncService? syncService})
    : _authService = authService,
      _syncService = syncService,
      super(AuthInitial()) {
    on<AuthCheckRequested>(_onCheckRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthGoogleLoginRequested>(_onGoogleLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthUserChanged>(_onUserChanged);

    // Escuchar cambios en el estado de autenticación
    _authService.authStateChanges.listen((user) {
      add(AuthUserChanged(user));
    });
  }

  /// Verificar estado de autenticación al inicio
  Future<void> _onCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    final user = _authService.currentUser;
    if (user != null) {
      emit(AuthAuthenticated(user));

      // Inicializar sincronización si está autenticado
      try {
        await _syncService?.init();
      } catch (e) {
        // Error al inicializar sync, pero el usuario sigue autenticado
      }
    } else {
      emit(AuthUnauthenticated());
    }
  }

  /// Manejar login
  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final userCredential = await _authService.login(
        email: event.email,
        password: event.password,
      );

      final user = userCredential.user;
      if (user != null) {
        emit(AuthAuthenticated(user, isSyncing: true));

        // Inicializar sincronización después del login
        try {
          await _syncService?.init();
          if (state is AuthAuthenticated) {
            emit((state as AuthAuthenticated).copyWith(isSyncing: false));
          }
        } catch (e) {
          // Error en sync pero login exitoso
          if (state is AuthAuthenticated) {
            emit((state as AuthAuthenticated).copyWith(isSyncing: false));
          }
        }
      } else {
        emit(const AuthError('Error: Usuario nulo después del login'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }

  /// Manejar registro
  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final userCredential = await _authService.register(
        email: event.email,
        password: event.password,
        displayName: event.displayName,
      );

      final user = userCredential.user;
      if (user != null) {
        emit(AuthAuthenticated(user, isSyncing: true));

        // Inicializar sincronización después del registro
        try {
          await _syncService?.init();
          if (state is AuthAuthenticated) {
            emit((state as AuthAuthenticated).copyWith(isSyncing: false));
          }
        } catch (e) {
          // Error en sync pero registro exitoso
          if (state is AuthAuthenticated) {
            emit((state as AuthAuthenticated).copyWith(isSyncing: false));
          }
        }
      } else {
        emit(const AuthError('Error: Usuario nulo después del registro'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }

  /// Manejar login con Google
  Future<void> _onGoogleLoginRequested(
    AuthGoogleLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final userCredential = await _authService.signInWithGoogle();

      final user = userCredential.user;
      if (user != null) {
        emit(AuthAuthenticated(user, isSyncing: true));

        // Inicializar sincronización después del login con Google
        try {
          await _syncService?.init();
          if (state is AuthAuthenticated) {
            emit((state as AuthAuthenticated).copyWith(isSyncing: false));
          }
        } catch (e) {
          // Error en sync pero login exitoso
          if (state is AuthAuthenticated) {
            emit((state as AuthAuthenticated).copyWith(isSyncing: false));
          }
        }
      } else {
        emit(
          const AuthError('Error: Usuario nulo después del login con Google'),
        );
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }

  /// Manejar logout
  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      // Disponer listeners de sync
      _syncService?.dispose();

      // Cerrar sesión
      await _authService.logout();

      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Manejar cambios automáticos del usuario (token refresh, etc)
  void _onUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    if (event.user != null) {
      // Solo emitir si no estamos ya en AuthAuthenticated
      if (state is! AuthAuthenticated) {
        emit(AuthAuthenticated(event.user!));
      }
    } else {
      // Solo emitir si no estamos ya en AuthUnauthenticated
      if (state is! AuthUnauthenticated && state is! AuthLoading) {
        emit(AuthUnauthenticated());
      }
    }
  }
}
