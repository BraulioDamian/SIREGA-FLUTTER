// lib/nucleo/servicios/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Servicio para manejar autenticación con Firebase
/// Funciona offline después del login inicial
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Usuario actual (funciona offline)
  User? get currentUser => _auth.currentUser;

  /// UID del usuario actual
  String? get currentUserId => _auth.currentUser?.uid;

  /// Email del usuario actual
  String? get currentUserEmail => _auth.currentUser?.email;

  /// Stream de cambios de autenticación
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Verificar si el usuario está autenticado
  /// IMPORTANTE: Funciona sin internet porque lee del caché local
  bool isAuthenticated() {
    return currentUser != null;
  }

  /// Registro de nuevo usuario
  /// Requiere conexión a internet
  Future<UserCredential> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Actualizar name de usuario si se proporciona
      if (displayName != null && userCredential.user != null) {
        await userCredential.user!.updateDisplayName(displayName);
        await userCredential.user!.reload();
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  /// Login con email y contraseña
  /// Requiere conexión a internet
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  /// Login con Google
  /// Requiere conexión a internet
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Iniciar el flujo de autenticación de Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // El usuario canceló el inicio de sesión
        throw Exception('Inicio de sesión cancelado');
      }

      // Obtener los detalles de autenticación
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Crear una nueva credencial
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Iniciar sesión con la credencial
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw 'Error al iniciar sesión con Google: $e';
    }
  }

  /// Login anónimo (para pruebas)
  /// Requiere conexión a internet
  Future<UserCredential> loginAnonymously() async {
    try {
      return await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  /// Cerrar sesión
  Future<void> logout() async {
    await GoogleSignIn().signOut(); // Cerrar sesión de Google también
    await _auth.signOut();
  }

  /// Enviar email de recuperación de contraseña
  /// Requiere conexión a internet
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  /// Reautenticar usuario (necesario para operaciones sensibles)
  Future<void> reauthenticate(String password) async {
    final user = currentUser;
    if (user == null) throw Exception('No hay usuario autenticado');

    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: password,
    );

    try {
      await user.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  /// Cambiar contraseña
  Future<void> changePassword(String newPassword) async {
    final user = currentUser;
    if (user == null) throw Exception('No hay usuario autenticado');

    try {
      await user.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  /// Eliminar cuenta
  Future<void> deleteAccount() async {
    final user = currentUser;
    if (user == null) throw Exception('No hay usuario autenticado');

    try {
      await user.delete();
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  /// Recargar datos del usuario
  Future<void> reloadUser() async {
    await currentUser?.reload();
  }

  /// Manejo de excepciones de Firebase Auth
  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No se encontró ningún usuario con ese correo electrónico.';
      case 'wrong-password':
        return 'Contraseña incorrecta.';
      case 'email-already-in-use':
        return 'Este correo electrónico ya está registrado.';
      case 'invalid-email':
        return 'El correo electrónico no es válido.';
      case 'weak-password':
        return 'La contraseña debe tener al menos 6 caracteres.';
      case 'user-disabled':
        return 'Esta cuenta ha sido deshabilitada.';
      case 'too-many-requests':
        return 'Demasiados intentos. Por favor, intenta más tarde.';
      case 'operation-not-allowed':
        return 'Operación no permitida. Contacta al administrador.';
      case 'network-request-failed':
        return 'Error de conexión. Verifica tu internet.';
      case 'requires-recent-login':
        return 'Por seguridad, debes iniciar sesión nuevamente.';
      default:
        return 'Error de autenticación: ${e.message}';
    }
  }
}
