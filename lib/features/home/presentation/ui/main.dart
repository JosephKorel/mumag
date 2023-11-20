import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  static const url = 'https://mumagweb.com/auth';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> requestAccess() async {
      try {
        final onConnect = await SpotifySdk.getAccessToken(
            clientId: dotenv.env['SPOTIFY_CLIENT_ID']!,
            redirectUrl: url,
            scope:
                'playlist-read-private,playlist-modify-private,playlist-modify-public');
        log('TO CHEGANDO ATÉ AQUI');

        log(onConnect.toString());
      } catch (e) {
        log('DEU ERROO AQUI');
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Home Page'),
          ElevatedButton(
              onPressed: requestAccess,
              child: const Text('CONNECT WITH SPOTIFY'))
        ],
      ),
    );
  }
}
