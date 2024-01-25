import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/genres.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/common/widgets/media_view.dart';
import 'package:mumag/common/widgets/rating_bottom_sheet.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/album_view/presentation/ui/rating.dart';
import 'package:mumag/features/album_view/presentation/ui/suggest_button.dart';
import 'package:mumag/features/album_view/presentation/ui/tab_content.dart';
import 'package:mumag/features/artist_view/providers/artist.dart';

class AlbumContent extends ConsumerWidget {
  const AlbumContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider).requireValue!;
    ref.watch(selectedArtistProvider);

    return MediaContentContainer(
      appBarTitle: album.name ?? '',
      actions: const [SuggestButton()],
      headerImageUrl: album.images?.first.url,
      mainContent: const AlbumContentView(),
      fab: const RatingButtonContainer(child: RatingAlbumFAB()),
    );
  }
}

class AlbumContentView extends ConsumerWidget {
  const AlbumContentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(albumRatingProvider);

    return MediaContentChild(
      asyncRating: rating,
      type: RatingType.album,
      children: const [
        SizedBox(
          height: 16,
        ),
        AlbumGenreList(),
        SizedBox(
          height: 16,
        ),
        Expanded(child: AlbumTabView()),
      ],
    );
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
