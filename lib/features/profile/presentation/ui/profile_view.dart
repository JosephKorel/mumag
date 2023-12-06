import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/connect/presentation/providers/connect.dart';
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
        color: context.background,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfilePicture(),
            Text(
              user.name,
              style: context.titleLarge.copyWith(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            const FavoriteGenres(),
            const SizedBox(
              height: 16,
            ),
            const SavedAlbumsView(),
          ],
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
      return Center(
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const Icon(
            Icons.person,
            size: 52,
          ),
        ),
      );
    }

    return Center(
      child: CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(profileImg),
      ),
    );
  }
}

class FavoriteGenres extends ConsumerWidget {
  const FavoriteGenres({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(
      userProvider.select((value) => value.requireValue!.genres),
    );

    final genresBadges = genres
        .map(
          (e) => DecoratedBox(
            decoration: BoxDecoration(
              color: context.primary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: context.primary.withOpacity(0.4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                e.toUpperCase(),
                style: context.bodyMedium.copyWith(
                  color: context.onPrimary,
                ),
              ),
            ),
          ),
        )
        .toList();

    return Wrap(
      runSpacing: 8,
      spacing: 8,
      alignment: WrapAlignment.center,
      children: genresBadges,
    );
  }
}
