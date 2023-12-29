import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/sign-in-img.png'),
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color(0xFF1d1615),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton.icon(
                      onPressed: signInWithGoogle,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        foregroundColor: Colors.white,
                        textStyle: context.titleMedium,
                        side: const BorderSide(width: 1.6, color: Colors.white),
                        padding: const EdgeInsets.all(12),
                      ),
                      icon: const Icon(PhosphorIconsBold.googleLogo),
                      label: const Text('SIGN IN WITH GOOGLE'),
                    )
                        .animate()
                        .fadeIn()
                        .slideY(begin: 8, curve: Curves.easeOutCirc),
                    const Divider(
                      height: 80,
                    ).animate().fadeIn(delay: .1.seconds),
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        foregroundColor: Colors.white,
                        textStyle: context.titleMedium,
                        side: const BorderSide(width: 1.6, color: Colors.white),
                        padding: const EdgeInsets.all(12),
                      ),
                      icon: const Icon(PhosphorIconsBold.appleLogo),
                      label: const Text('SIGN IN WITH APPLE ID'),
                    ).animate().fadeIn().slideY(
                          begin: 8,
                          curve: Curves.easeOutCirc,
                          delay: .1.seconds,
                        ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
