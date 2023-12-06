import 'package:firebase_auth/firebase_auth.dart';

final class FirebaseAuthService {
  const FirebaseAuthService(this._instance);

  final FirebaseAuth _instance;

  User? currentUser() {
    return _instance.currentUser;
  }

  Stream<User?> authenticatedUser() {
    return _instance.authStateChanges();
  }

  Future<void> signOut() async {
    await _instance.signOut();
  }
}
