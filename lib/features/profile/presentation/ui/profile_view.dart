import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/profile/presentation/ui/genres.dart';
import 'package:mumag/features/profile/presentation/ui/user_albums.dart';

class UserProfileView extends ConsumerWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).requireValue!;

    Future<void> checkAlbum() async {
      ref.read(credentialsImplementationProvider).deleteCredentials();
    }

/*     log('USER AVATAR IS ${user.avatarUrl}');
    log('USER AVATAR IS ${user.avatarUrl.runtimeType}'); */

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /* const AlbumHeaderView(), */
            Text(user.name),
            /* if (user.avatarUrl != null) Image.network(user.avatarUrl!), */
            ElevatedButton(
              onPressed: checkAlbum,
              child: const Text('Check genres'),
            ),
            const FavoriteGenresView(),
            const ProfileTest(),
          ],
        ),
      ),
    );
  }
}
