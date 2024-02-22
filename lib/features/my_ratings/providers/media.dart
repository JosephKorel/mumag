import 'package:mumag/common/models/media/common.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'media.g.dart';

@riverpod
FutureOr<List<MediaEntity>> getMediaList(
  GetMediaListRef ref, {
  required List<RatingEntity> ratings,
}) async {
  final spotify = ref.watch(spotifyApiProvider);

  final futures = ratings.map((element) async {
    Object spotifyItem;
    switch (element.type) {
      case RatingType.album:
        spotifyItem = await spotify.albums.get(element.spotifyId);
      case RatingType.track:
        spotifyItem = await spotify.tracks.get(element.spotifyId);
      case RatingType.artist:
        spotifyItem = await spotify.artists.get(element.spotifyId);
    }
    return spotifyItem;
  });

  final spotifyItems = await Future.wait(futures);

  return spotifyItems.map(MediaEntity.fromDynamicMedia).toList();
}
