import 'dart:convert';

import 'package:mumag/common/models/media/artist.dart';
import 'package:mumag/common/models/media/track.dart';
import 'package:spotify/spotify.dart';

class AlbumEntity {
  AlbumEntity({
    required this.spotifyId,
    required this.name,
    required this.images,
    required this.tracks,
    required this.artists,
  });

  factory AlbumEntity.fromAlbumSimple(AlbumSimple album) {
    final images = album.images?.map((e) => e.url ?? '').toList() ?? [];

    return AlbumEntity(
      spotifyId: album.id ?? '',
      name: album.name ?? '',
      images: images,
      tracks: album.tracks?.map(TrackEntity.fromTrackSimple).toList() ?? [],
      artists: album.artists?.map(ArtistEntity.fromArtistSimple).toList() ?? [],
    );
  }

  factory AlbumEntity.fromMap(Map<String, dynamic> map) {
    return AlbumEntity(
      spotifyId: map['spotifyId'] as String,
      name: map['name'] as String,
      images:
          (map['images'] as List<dynamic>).map((e) => e.toString()).toList(),
      tracks: ((map['tracks']) as List<dynamic>)
          .map((e) => TrackEntity.fromJson(e.toString()))
          .toList(),
      artists: (map['artists'] as List<dynamic>)
          .map((e) => ArtistEntity.fromJson(e.toString()))
          .toList(),
    );
  }

  factory AlbumEntity.fromJson(String source) =>
      AlbumEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  final String name;
  final List<String> images;
  final List<TrackEntity> tracks;
  final List<ArtistEntity> artists;
  final String spotifyId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'spotifyId': spotifyId,
      'name': name,
      'images': images,
      'tracks': tracks.map((e) => e.toJson()).toList(),
      'artists': artists.map((e) => e.toJson()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
