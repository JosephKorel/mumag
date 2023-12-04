import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/connect/presentation/providers/connect.dart';
import 'package:mumag/features/profile/presentation/ui/genres.dart';
import 'package:mumag/features/profile/presentation/ui/user_albums.dart';

class ProfileMainView extends ConsumerWidget {
  const ProfileMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).requireValue!;

    Future<void> checkAlbum() async {
      final spotifyUser = await ref.read(saveUserRepoProvider).spotifyUser();
      final avatar = spotifyUser.images;
      final img = avatar?.first;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: Theme.of(context).colorScheme.background.withOpacity(0.8),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const ProfilePicture(),
                Text(user.name),
                ElevatedButton(
                  onPressed: checkAlbum,
                  child: const Text('Check it'),
                ),
                ElevatedButton(
                  onPressed: checkAlbum,
                  child: const Text('Check genres'),
                ),
                const FavoriteGenresView(),
                const ProfileTest(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePicture extends ConsumerWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImg = ref.watch(
      userProvider.select((value) => value.requireValue!.avatarUrl),
    );

    if (profileImg == null) {
      return CircleAvatar(
        radius: 42,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const Icon(
          Icons.person,
          size: 52,
        ),
      );
    }

    return CircleAvatar(
      radius: 42,
      backgroundImage: NetworkImage(profileImg),
    );
  }
}
