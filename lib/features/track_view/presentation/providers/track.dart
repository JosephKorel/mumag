import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'track.g.dart';

@riverpod
class GetTrack extends _$GetTrack {
  @override
  FutureOr<Track?> build() {
    return null;
  }

  Future<void> updateState(String spotifyId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await ref.read(spotifyApiProvider).tracks.get(spotifyId);
      return result;
    });
  }
}

@riverpod
Future<List<RatingEntity>?> trackRating(
  TrackRatingRef ref,
) async {
  final track = ref.watch(getTrackProvider).requireValue!;
  final ratingController = ref.watch(ratingControllerProvider);

  final trackRating =
      await ratingController(event: GetAllRatingParams(spotifyId: track.id!))
          .run();

  return trackRating.fold(
    (l) => null,
    (r) => r as List<RatingEntity>,
  );
}
