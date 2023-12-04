import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/features/connect/presentation/providers/connect.dart';

class ConnectToSpotifyView extends ConsumerWidget {
  const ConnectToSpotifyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> connect() async {
      await ref.read(handleConnectionProvider.notifier).connect();
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
          ElevatedButton(
            onPressed: () {},
            child: const Text('FETCH USER'),
          ),
        ],
      ),
    );
  }
}
