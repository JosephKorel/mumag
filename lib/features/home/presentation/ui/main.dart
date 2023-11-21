import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/spotify/providers/api.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(spotifyAuthProvider);

    Future<void> requestAccess() async {
      try {
        final token = await authController.connect();
        ref.read(spotifyUserTokenProvider.notifier).updateToken(token: token);
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
            child: const Text('CONNECT WITH SPOTIFY'),
          )
        ],
      ),
    );
  }
}
