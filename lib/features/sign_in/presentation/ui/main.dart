import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mumag/common/services/authentication/auth_provider.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<UserCredential> signInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    Future<void> onSignIn() async {
      final credentials = await signInWithGoogle();
      if (credentials.user == null) {
        log('Null user');
        return;
      }

      log('VIM PRA CÁ');

      ref.read(isAuthProvider.notifier).trigger();

      log(credentials.user!.email.toString());
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Sign In Page'),
          ElevatedButton(
            onPressed: onSignIn,
            child: const Text('Sign In With Google'),
          )
        ],
      ),
    );
  }
}
