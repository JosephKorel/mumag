import 'package:firebase_auth/firebase_auth.dart';

final class FirebaseAuthService {
  const FirebaseAuthService(this._instance);

  final FirebaseAuth _instance;

  Stream<User?> authenticatedUser() {
    return _instance.authStateChanges();
  }
}
