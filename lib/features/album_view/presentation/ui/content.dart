import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/widgets/media/appBar.dart';
import 'package:mumag/common/widgets/media/media_view.dart';
import 'package:mumag/common/widgets/media/rating.dart';
import 'package:mumag/common/widgets/media/suggestion_button.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/album_view/presentation/ui/tab_content.dart';

class AlbumContainerView extends ConsumerStatefulWidget {
  const AlbumContainerView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AlbumContainerViewState();
}

class _AlbumContainerViewState extends ConsumerState<AlbumContainerView> {
  int _ratingValue = 0;

  void close() {
    setState(() {
      _ratingValue = 0;
    });
  }

  void onRate(int score) {
    setState(() {
      _ratingValue = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    final album = ref.watch(viewingAlbumProvider).requireValue!;
    final ratingParams = RatingBaseParams(
      type: RatingType.album,
      spotifyId: album.id ?? '',
      rating: _ratingValue,
    );

    return MediaContentContainer(
      appBar: _ratingValue > 0
          ? RatingAppBar(
              close: close,
              ratingParams: ratingParams,
            )
          : null,
      appBarTitle: album.name ?? '',
      actions: [
        SuggestMediaButton(
          spotifyId: album.id!,
          type: SuggestionType.album,
        ),
      ],
      headerImageUrl: album.images?.first.url,
      mainContent: MediaContentChild(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: MediaContentRating(
              spotifyId: album.id!,
              type: RatingType.album,
              onRate: onRate,
              ratingValue: _ratingValue,
            ),
          ),
          const Expanded(child: AlbumTabView()),
        ],
      ),
      // fab: const RatingButtonContainer(child: RatingAlbumFAB()),
    );
  }
}



/* class AlbumGenreList extends ConsumerWidget {
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
} */
