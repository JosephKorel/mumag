import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/media/album.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/background_icon.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/routes/routes.dart';
import 'package:spotify/spotify.dart';

class UserAlbumsView extends StatelessWidget {
  const UserAlbumsView({
    required this.asyncAlbums,
    super.key,
    this.savedAlbums,
  });

  final AsyncValue<List<AlbumSimple>> asyncAlbums;
  final List<AlbumEntity>? savedAlbums;

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: Text(
                'Your Albums',
                style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_outward),
                label: const Text('See All'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 120,
          child: AlbumGridItems(
            savedAlbums: savedAlbums,
            asyncAlbums: asyncAlbums,
          ),
        ),
      ],
    );
  }
}

class _SavedAlbumsLoading extends StatelessWidget {
  const _SavedAlbumsLoading({super.key});

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
  const AlbumGridItems({
    required this.asyncAlbums,
    this.savedAlbums,
    super.key,
  });

  final AsyncValue<List<AlbumSimple>> asyncAlbums;
  final List<AlbumEntity>? savedAlbums;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (asyncAlbums.hasError) {
      return const Center(
        child: Icon(Icons.warning),
      );
    }

    if ((savedAlbums != null && savedAlbums!.isEmpty) &&
        asyncAlbums.isLoading) {
      return const _SavedAlbumsLoading();
    }

    ref.watch(viewingAlbumProvider);

    final albums = savedAlbums ??
        asyncAlbums.requireValue
            .map((e) => AlbumEntity.fromJson(e.toString()))
            .toList();

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
        child: _AlbumGridItem(album: albums[index]),
      ),
    );
  }
}

class _AlbumGridItem extends ConsumerWidget {
  const _AlbumGridItem({required this.album, super.key});

  final AlbumEntity album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onTap() async {
      await ref
          .read(viewingAlbumProvider.notifier)
          .updateState(albumId: album.spotifyId);

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
          child: album.images[1].isEmpty
              ? const Icon(Icons.album)
              : CachedImage(
                  url: album.images[1],
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
        ),
      ),
    );
  }
}
