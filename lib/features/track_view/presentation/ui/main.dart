import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/theme_provider.dart';
import 'package:mumag/common/widgets/media_view.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';
import 'package:mumag/features/track_view/presentation/ui/track_artist.dart';

class TrackMainView extends ConsumerWidget {
  const TrackMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final track = ref.watch(viewingTrackProvider)!;
    final album = ref.watch(viewingAlbumProvider)!;
    final albumColors = ref.watch(albumColorSchemeProvider).requireValue;
    final appTheme = ref.watch(appThemeProvider);

    return Theme(
      data: appTheme.copyWith(colorScheme: albumColors.light),
      child: MediaContentContainer(
        appBarTitle: track.name ?? '',
        headerImageUrl: album.images?.first.url,
        mainContent: const TrackContentView(),
      ),
    );
  }
}

class TrackContentView extends ConsumerWidget {
  const TrackContentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(trackRatingProvider);
    return MediaContentChild(
      asyncRating: rating,
      type: RatingType.track,
      children: const [
        SizedBox(
          height: 16,
        ),
        TrackArtists(),
      ],
    );
  }
}
