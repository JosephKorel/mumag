import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify/providers/api.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotify = ref.watch(spotifyApiProvider);
    final sharedPref = ref.watch(credentialsImplementationProvider);

    void checkInfo() async {
      final user = await spotify.me.recentlyPlayed().first();
      final credentials = user.items;
      // log('USUÁRIO É ${user.scopes.toString()}');
    }

    void deleteInfo() {
      ref.read(credentialsImplementationProvider).deleteCredentials();
    }

    void checkSharedPref() {
      // log('FOI ISTO ${sharedPref.retrieveFullCredentials()?.refreshToken}');
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('YOU ARE CONNECTED'),
          ElevatedButton(onPressed: checkInfo, child: const Text('Check info')),
          ElevatedButton(onPressed: deleteInfo, child: const Text('Delete')),
          ElevatedButton(
              onPressed: checkSharedPref, child: const Text('Check Sharedd')),
        ],
      ),
    );
  }
}
