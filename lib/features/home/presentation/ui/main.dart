import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/spotify/domain/auth.dart';
import 'package:mumag/common/services/spotify/providers/api.dart';
import 'package:mumag/common/services/spotify/providers/auth.dart';
import 'package:spotify/spotify.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(spotifyAuthProvider);
    final spotify = SpotifyApi(ref.watch(spotifyClientProvider));

    Future<void> requestAccess() async {
      try {
        final token = await authController.connect();
        ref.read(spotifyUserTokenProvider.notifier).updateToken(token: token);
      } catch (e) {
        log('DEU ERROO AQUI');
      }
    }

    Future<void> checkValues() async {
      try {
        await ref.read(spotifyClientProvider.notifier).updateCredentials();
      } catch (e) {
        log('DEU ERROO AQUI');
        log(e.toString());
      }
    }

    Future<void> checkUser() async {
      try {
        var newCredentials = await spotify.getCredentials();

        ref.read(spotifyClientProvider.notifier).update(
              credentials: newCredentials,
            );

        newCredentials.scopes = SpotifyAuthController.scope.split(',');

        log('SCOPES ${newCredentials.scopes}');

        var newClient = SpotifyApi(newCredentials);

        final me = newClient.me.savedAlbums();
        final myList = await me.first(10);
        final result = myList.items;
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
            onPressed: requestAccess,
            child: const Text('CONNECT WITH SPOTIFY'),
          ),
          ElevatedButton(
            onPressed: checkValues,
            child: const Text('CHECK VALUES'),
          ),
          ElevatedButton(
            onPressed: checkUser,
            child: const Text('CHECK USER'),
          )
        ],
      ),
    );
  }
}
