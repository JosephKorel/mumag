import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/common/services/spotify_auth/providers/credentials.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> connect() async {
      try {
        final newCredentials =
            await ref.read(spotifyAuthProvider).authenticate();

        if (newCredentials.accessToken != null) {
          ref.read(credentialsImplementationProvider).saveCredentials(
                credentials: newCredentials,
              );

          ref.invalidate(credentialsControllerProvider);
        }
      } catch (e) {
        log('DEU ERROO AQUI');
        log(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Home Page'),
          ElevatedButton(
            onPressed: connect,
            child: const Text('CONNECT'),
          ),
        ],
      ),
    );
  }
}
