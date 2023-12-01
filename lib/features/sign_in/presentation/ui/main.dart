import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mumag/features/home/presentation/providers/connect.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<UserCredential> signInWithGoogle() async {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return FirebaseAuth.instance.signInWithCredential(credential);
    }

    void connectToSpotify() {
      ref.read(handleConnectionProvider.notifier).connect();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Sign In Page'),
          ElevatedButton(
            onPressed: signInWithGoogle,
            child: const Text('Sign In With Google'),
          ),
          ElevatedButton(
            onPressed: connectToSpotify,
            child: const Text('Connect'),
          ),
        ],
      ),
    );
  }
}
