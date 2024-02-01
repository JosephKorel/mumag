import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:spotify/spotify.dart';

final class MediaEntity {
  MediaEntity({
    required this.name,
    required this.spotifyId,
    required this.type,
    required this.imageUrl,
    this.typeLabel,
  });

  factory MediaEntity.fromDynamicMedia(
    dynamic data,
  ) {
    final e = data;

    if (e is Album) {
      return MediaEntity(
        name: e.name ?? '',
        typeLabel: e.albumType != null
            ? AlbumType.values[e.albumType!.index].name
            : RatingType.album.label,
        imageUrl: e.images?[1].url ?? '',
        spotifyId: e.id ?? '',
        type: RatingType.album,
      );
    }

    if (e is Track) {
      return MediaEntity(
        name: e.name ?? '',
        typeLabel: RatingType.track.label,
        imageUrl: e.album?.images?[1].url ?? '',
        spotifyId: e.id ?? '',
        type: RatingType.track,
      );
    }

    if (e is Artist) {
      return MediaEntity(
        name: e.name ?? '',
        typeLabel: RatingType.artist.label,
        imageUrl: e.images == null || e.images!.isEmpty
            ? ''
            : e.images!.last.url ?? '',
        spotifyId: e.id ?? '',
        type: RatingType.artist,
      );
    }

    return MediaEntity(
      name: '',
      spotifyId: '',
      type: RatingType.album,
      imageUrl: '',
    );
  }

  final String name;
  final String spotifyId;
  final RatingType type;
  final String? imageUrl;
  final String? typeLabel;
}
