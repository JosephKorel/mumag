import 'package:freezed_annotation/freezed_annotation.dart';
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
    required List<SimpleArtist> artist,
    required String spotifyId,
    required String imageUrl,
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
      artist: track.artists
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
}
