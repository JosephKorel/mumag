import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mumag/common/services/authentication/auth_provider.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleSignIn = GoogleSignIn();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Sign In Page'),
          ElevatedButton(
            onPressed: ref.read(isAuthProvider.notifier).trigger,
            child: const Text('Logar'),
          )
        ],
      ),
    );
  }
}
