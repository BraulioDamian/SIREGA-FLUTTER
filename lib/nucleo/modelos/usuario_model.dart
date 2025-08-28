/// Modelo de Usuario
class Usuario {
  final String uid;
  final String email;
  final String? displayName;

  const Usuario({
    required this.uid,
    required this.email,
    this.displayName,
  });
}
