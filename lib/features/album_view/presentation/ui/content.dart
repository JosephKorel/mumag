import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/genres.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/album_view/presentation/ui/rating.dart';
import 'package:mumag/features/album_view/presentation/ui/tab_content.dart';
import 'package:mumag/features/artist_view/providers/artist.dart';
import 'package:mumag/routes/routes.dart';

class AlbumContent extends ConsumerWidget {
  const AlbumContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider)!;
    ref.watch(selectedArtistProvider);

    void goToArtist() {
      ref
          .read(selectedArtistProvider.notifier)
          .updateState(artist: album.artists!.first);
      context.push(const ArtistViewRoute().location);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(album.name ?? ''),
        backgroundColor: context.primary.withOpacity(0.6),
      ),
      body: const Stack(
        children: [
          AlbumHeader(),
          Column(
            children: [
              Expanded(child: SizedBox.expand()),
              Expanded(
                flex: 2,
                child: AlbumContentView(),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: const RatingFloatingActionButton(),
      extendBodyBehindAppBar: true,
    );
  }
}

class AlbumHeader extends ConsumerWidget {
  const AlbumHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider)!;

    if (album.images == null) {
      return const SizedBox.shrink();
    }

    return Image(
      image: NetworkImage(album.images!.first.url!),
    ).animate().fadeIn();
  }
}

class AlbumContentView extends ConsumerWidget {
  const AlbumContentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: context.background,
      ),
      child: const SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AlbumRating(),
            SizedBox(
              height: 16,
            ),
            AlbumGenreList(),
            SizedBox(
              height: 16,
            ),
            AlbumTabView(),
          ],
        ),
      ),
    ).animate().fadeIn();
  }
}

class AlbumGenreList extends ConsumerWidget {
  const AlbumGenreList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(albumGenresProvider);

    return genres.when(
      data: (data) {
        if (data.isEmpty) {
          return const SizedBox.shrink();
        }

        return ContentGenres(
          genres: data,
          backgroundColor: context.background,
          borderColor: context.onSurface.withOpacity(0.2),
          textColor: context.onSurface,
        );
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const Wrap(
        spacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          LoadingSkeleton(width: 80, height: 20),
          LoadingSkeleton(width: 100, height: 20),
          LoadingSkeleton(width: 180, height: 20),
          LoadingSkeleton(width: 160, height: 20),
          LoadingSkeleton(width: 90, height: 20),
        ],
      ),
    );
  }
}
