/// Servicio de Firebase (stub)
class FirebaseService {
  Future<UsuarioAuth?> currentUser() async => null;
  Future<void> signIn(String email, String password) async {}
  Future<void> signOut() async {}

  // Firestore-like API (stubs) matching docs/firestore_schema.md
  Future<void> upsertUser(String uid, Map<String, dynamic> data) async {}
  Future<void> upsertHerd(String herdId, Map<String, dynamic> data) async {}
  Future<void> upsertCattle(
    String herdId,
    String nfcTagId,
    Map<String, dynamic> data,
  ) async {}
  Future<void> addHealthRecord(
    String herdId,
    String nfcTagId,
    Map<String, dynamic> data,
  ) async {}
  Future<void> addGenealogy(
    String herdId,
    String nfcTagId,
    String parentNfcTagId,
    Map<String, dynamic> data,
  ) async {}
  Future<void> addProductionRecord(
    String herdId,
    String nfcTagId,
    Map<String, dynamic> data,
  ) async {}
}

class UsuarioAuth {
  final String uid;
  final String email;
  const UsuarioAuth(this.uid, this.email);
}
