import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mumag/common/models/media/common.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/features/profile/domain/data_repository.dart';
import 'package:spotify/spotify.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
class SimpleAlbum with _$SimpleAlbum {
  factory SimpleAlbum({required String name, required String spotifyId}) =
      _SimpleAlbum;

  factory SimpleAlbum.fromJson(Map<String, dynamic> json) =>
      _$SimpleAlbumFromJson(json);
}

@freezed
class SimpleArtist with _$SimpleArtist {
  factory SimpleArtist({required String name, required String spotifyId}) =
      _SimpleArtist;

  factory SimpleArtist.fromJson(Map<String, dynamic> json) =>
      _$SimpleArtistFromJson(json);
}

@freezed
class SingleTrack with _$SingleTrack implements BaseFromJson<SingleTrack> {
  factory SingleTrack({
    required int id,
    required String name,
    required SimpleAlbum album,
    required List<SimpleArtist> artists,
    required String spotifyId,
    required String imageUrl,
    @Default(0) int index,
  }) = _SingleTrack;

  factory SingleTrack.fromSpotifyTrack(Track track) {
    return SingleTrack(
      id: 0,
      name: track.name ?? '',
      album: SimpleAlbum(
        name: track.album?.name ?? '',
        spotifyId: track.album?.id ?? '',
      ),
      imageUrl: track.album?.images?[1].url ?? '',
      spotifyId: track.id ?? '',
      artists: track.artists
              ?.map(
                (e) => SimpleArtist(
                  name: e.name ?? '',
                  spotifyId: e.id ?? '',
                ),
              )
              .toList() ??
          [],
    );
  }

  const SingleTrack._();

  factory SingleTrack.fromJson(Map<String, dynamic> json) =>
      _$SingleTrackFromJson(json);

  @override
  SingleTrack fromJson(Map<String, dynamic> json) =>
      _$SingleTrackFromJson(json);

  static Map<String, dynamic> toMap(SingleTrack track, int index) => {
        ...track.toJson(),
        'userId': track.id,
        'index': index,
      };

  MediaEntity toMediaEntity() => MediaEntity(
        name: name,
        spotifyId: spotifyId,
        type: RatingType.track,
        imageUrl: imageUrl,
        artists: artists.map((e) => e.name).toList(),
      );
}
