import 'package:firebase_auth/firebase_auth.dart';
import 'package:mumag/common/services/firebase/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
FirebaseAuth authInstance(AuthInstanceRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
FirebaseAuthService authService(AuthServiceRef ref) {
  return FirebaseAuthService(ref.watch(authInstanceProvider));
}

@riverpod
Stream<User?> authStream(AuthStreamRef ref) {
  return ref.watch(authServiceProvider).authenticatedUser();
}
