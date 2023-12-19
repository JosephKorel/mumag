import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'track.g.dart';

@riverpod
class ViewingTrack extends _$ViewingTrack {
  @override
  TrackSimple? build() => null;

  void updateState({required TrackSimple track}) => state = track;
}

@riverpod
Future<List<RatingEntity>?> trackRating(
  TrackRatingRef ref,
) async {
  final track = ref.watch(viewingTrackProvider)!;
  final ratingController = ref.watch(ratingControllerProvider);

  final trackRating =
      await ratingController(event: GetAllRatingParams(spotifyId: track.id!))
          .run();

  return trackRating.fold(
    (l) => null,
    (r) => r as List<RatingEntity>,
  );
}
