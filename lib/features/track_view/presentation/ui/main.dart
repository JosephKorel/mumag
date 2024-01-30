import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/theme/theme_provider.dart';
import 'package:mumag/common/widgets/media/media_view.dart';
import 'package:mumag/common/widgets/media/suggestion_button.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';
import 'package:mumag/features/track_view/presentation/ui/rating.dart';
import 'package:mumag/features/track_view/presentation/ui/track_artist.dart';

class TrackMainView extends ConsumerWidget {
  const TrackMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final track = ref.watch(getTrackProvider);
    final appTheme = ref.watch(appThemeProvider);

    return track.when(
      data: (trackData) {
        final imageUrl = trackData?.album?.images?.first.url ?? '';
        final colorScheme =
            ref.watch(dynamicColorSchemeProvider(imageUrl: imageUrl));

        return colorScheme.when(
          data: (data) => Theme(
            data: appTheme.copyWith(colorScheme: data.light),
            child: MediaContentContainer(
              appBarTitle: trackData?.name ?? '',
              actions: [
                SuggestMediaButton(
                  spotifyId: trackData!.id!,
                  type: SuggestionType.track,
                ),
              ],
              headerImageUrl: trackData.album?.images?.first.url,
              mainContent: const TrackContentView(),
            ),
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

class TrackContentView extends ConsumerWidget {
  const TrackContentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(trackRatingProvider);
    return const MediaContentChild(
      type: RatingType.track,
      children: [
        SizedBox(
          height: 16,
        ),
        Expanded(child: TrackArtists()),
        Expanded(
          flex: 2,
          child: TrackRatingContainer(),
        ),
      ],
    );
  }
}
