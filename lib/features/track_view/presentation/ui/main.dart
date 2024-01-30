import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/media/common.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/theme_provider.dart';
import 'package:mumag/common/widgets/media/media_view.dart';
import 'package:mumag/common/widgets/media/rating.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';
import 'package:mumag/features/track_view/presentation/ui/rating.dart';
import 'package:mumag/features/track_view/presentation/ui/track_artist.dart';
import 'package:mumag/routes/router.dart';

mixin PreviousPathState {
  // If user came here through album, then the color scheme is already loaded
  // Just use the same as album
  bool comingFromAlbum(WidgetRef ref) {
    final router = ref.read(routerProvider);

    final routes = router.routerDelegate.currentConfiguration.matches
        .map((e) => e.matchedLocation)
        .toList();

    return routes[routes.length - 2] == '/album';
  }
}

class TrackMainView extends ConsumerWidget with PreviousPathState {
  const TrackMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final track = ref.watch(getTrackProvider);
    final hasColorSchemeLoaded = comingFromAlbum(ref);
    final appTheme = ref.watch(appThemeProvider);

    return track.when(
      data: (trackData) {
        final imageUrl = trackData?.album?.images?.first.url ?? '';
        final media = MediaEntity(
          name: trackData!.name ?? '',
          spotifyId: trackData.id ?? '',
          type: RatingType.track,
          imageUrl: imageUrl,
        );

        if (hasColorSchemeLoaded) {
          final albumColors = ref.watch(albumColorSchemeProvider).requireValue;

          return Theme(
            data: appTheme.copyWith(colorScheme: albumColors.light),
            child: MediaView(media: media, child: const TrackContentView()),
          );
        }

        final colorScheme =
            ref.watch(dynamicColorSchemeProvider(imageUrl: imageUrl));

        return colorScheme.when(
          data: (data) => Theme(
            data: appTheme.copyWith(colorScheme: data.light),
            child: MediaView(media: media, child: const TrackContentView()),
          ),
          error: (error, stackTrace) => const Scaffold(),
          loading: MediaContentLoading.new,
        );
      },
      error: (error, stackTrace) => const Scaffold(),
      loading: MediaContentLoading.new,
    );
  }
}

class TrackContentView extends StatelessWidget {
  const TrackContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          TrackArtists(),
          SizedBox(
            height: 16,
          ),
          Expanded(
            flex: 2,
            child: TrackRatingContainer(),
          ),
        ],
      ),
    );
  }
}
