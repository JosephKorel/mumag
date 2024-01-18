import 'dart:convert';

import 'package:spotify/spotify.dart';

class ArtistEntity {
  ArtistEntity({
    required this.name,
    required this.spotifyId,
  });

  factory ArtistEntity.fromArtistSimple(ArtistSimple artist) {
    return ArtistEntity(name: artist.name ?? '', spotifyId: artist.id ?? '');
  }

  factory ArtistEntity.fromMap(Map<String, dynamic> map) {
    return ArtistEntity(
      name: map['name'] as String,
      spotifyId: map['spotifyId'] as String,
    );
  }

  factory ArtistEntity.fromJson(String source) =>
      ArtistEntity.fromMap(json.decode(source) as Map<String, dynamic>);
  final String name;
  final String spotifyId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'spotifyId': spotifyId,
    };
  }

  String toJson() => json.encode(toMap());
}
