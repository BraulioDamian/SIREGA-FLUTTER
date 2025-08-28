// Stub de BLoC de autenticación
abstract class AuthEvent {}
class AuthLoginRequested extends AuthEvent { final String email; final String password; AuthLoginRequested(this.email, this.password); }
class AuthLogoutRequested extends AuthEvent {}

class AuthState { final bool authenticated; final String? error; const AuthState({required this.authenticated, this.error}); }

class AuthBloc {
  AuthState state = const AuthState(authenticated: false);
  void add(AuthEvent event) {
    // TODO: implementar lógica
  }
}
