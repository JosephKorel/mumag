import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/background_icon.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/profile/presentation/providers/user_albums.dart';
import 'package:mumag/routes/routes.dart';
import 'package:spotify/spotify.dart' as spotify;

class SavedAlbumsView extends ConsumerWidget {
  const SavedAlbumsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(userSavedAlbumsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const BackgroundIcon(icon: Icons.album),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Your Albums',
              style: context.titleLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 120,
          child: albums.when(
            data: (data) => const AlbumGridItems(),
            error: (error, stackTrace) => const Text('Some error'),
            loading: SavedAlbumsLoading.new,
          ),
        ),
      ],
    );
  }
}

class SavedAlbumsLoading extends StatelessWidget {
  const SavedAlbumsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    const numberOfItems = 4;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      shrinkWrap: true,
      itemCount: numberOfItems,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding:
            EdgeInsets.only(left: index > 1 ? 8 : 0, right: index == 0 ? 8 : 0),
        child: SizedBox(
          width: 100,
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.onSurface.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
            .animate(
              onComplete: (controller) => controller.repeat(),
            )
            .shimmer(duration: 1.seconds),
      ),
    );
  }
}

class AlbumGridItems extends ConsumerWidget {
  const AlbumGridItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(userSavedAlbumsProvider).requireValue;
    ref.watch(viewingAlbumProvider);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      shrinkWrap: true,
      itemCount: albums.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding:
            EdgeInsets.only(left: index > 1 ? 8 : 0, right: index == 0 ? 8 : 0),
        child: AlbumGridItem(album: albums[index]),
      ),
    );
  }
}

class AlbumGridItem extends ConsumerWidget {
  const AlbumGridItem({required this.album, super.key});

  final spotify.AlbumSimple album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumImage = album.images?[1];

    void onTap() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(viewingAlbumProvider.notifier).updateState(album: album);
        context.push(const AlbumViewRoute().location);
      });
    }

    return Material(
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: SizedBox(
          width: 100,
          height: 100,
          child: albumImage == null
              ? const Icon(Icons.album)
              : CachedImage(
                  url: albumImage.url!,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
        ),
      ),
    );
  }
}
