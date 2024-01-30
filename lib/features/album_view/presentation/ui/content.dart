import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/media/common.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/widgets/media/rating.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/album_view/presentation/ui/tab_content.dart';

class AlbumContainerView extends ConsumerWidget {
  const AlbumContainerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider).requireValue!;

    final media = MediaEntity(
      name: album.name ?? '',
      spotifyId: album.id ?? '',
      type: RatingType.album,
      imageUrl: album.images?.first.url,
    );

    return MediaView(media: media, child: const AlbumTabView());
  }
}

/* class AlbumContainerView extends ConsumerStatefulWidget {
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
 */


