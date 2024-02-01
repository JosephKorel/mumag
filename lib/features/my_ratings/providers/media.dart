import 'package:mumag/common/models/media/common.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'media.g.dart';

@riverpod
FutureOr<MediaEntity> getMedia(
  GetMediaRef ref, {
  required String spotifyId,
  required RatingType type,
}) async {
  final spotify = ref.watch(spotifyApiProvider);

  switch (type) {
    case RatingType.album:
      final item = await spotify.albums.get(spotifyId);
      return MediaEntity.fromDynamicMedia(item);

    case RatingType.track:
      final item = await spotify.tracks.get(spotifyId);
      return MediaEntity.fromDynamicMedia(item);

    case RatingType.artist:
      final item = await spotify.artists.get(spotifyId);
      return MediaEntity.fromDynamicMedia(item);
  }
}
