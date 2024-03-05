import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/background_icon.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';
import 'package:mumag/features/profile/presentation/providers/favorite_titles/provider.dart';
import 'package:mumag/routes/routes.dart';

class FavoriteSongsContainer extends ConsumerWidget {
  const FavoriteSongsContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteTitles = ref.watch(currentUserFavTitlesProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FavoriteSongsTitleWidget(title: favoriteTitles.songsTitle),
        const Expanded(
          child: UserFavoriteSongs(
            mediaList: [],
          ),
        ),
      ],
    );
  }
}

class FavoriteSongsTitleWidget extends StatelessWidget {
  const FavoriteSongsTitleWidget({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackgroundIcon(
          icon: Icons.music_note_rounded,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            title,
            style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class UserFavoriteSongs extends StatelessWidget {
  const UserFavoriteSongs({
    required this.mediaList,
    super.key,
  });

  final List<SingleTrack> mediaList;

  @override
  Widget build(BuildContext context) {
    if (mediaList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You have no favorite songs yet. How about adding some?',
              textAlign: TextAlign.center,
              style: context.bodyMedium.copyWith(
                color: context.onSurface.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            FilledButton.icon(
              onPressed: () =>
                  context.push(const EditFavoriteSongsViewRoute().location),
              icon: const Icon(Icons.add)
                  .animate(
                    onComplete: (controller) =>
                        controller.repeat(reverse: true),
                  )
                  .slideY(end: -.1, begin: .1, duration: 1.seconds),
              label: const Text('Add Songs'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: mediaList.length,
      itemBuilder: (context, index) => Text(
        mediaList[index].name,
      ),
    );
  }
}
