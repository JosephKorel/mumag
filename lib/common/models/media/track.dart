import 'dart:convert';

import 'package:mumag/common/models/media/artist.dart';
import 'package:spotify/spotify.dart';

class TrackEntity {
  TrackEntity({
    required this.name,
    required this.artists,
  });

  factory TrackEntity.fromTrackSimple(TrackSimple track) {
    return TrackEntity(
      name: track.name ?? '',
      artists: track.artists?.map(ArtistEntity.fromArtistSimple).toList() ?? [],
    );
  }

  factory TrackEntity.fromMap(Map<String, dynamic> map) {
    return TrackEntity(
      name: map['name'] as String,
      artists: List<ArtistEntity>.from(
        (map['artists'] as List<dynamic>).map<ArtistEntity>(
          (x) => ArtistEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory TrackEntity.fromJson(String source) =>
      TrackEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  final String name;
  final List<ArtistEntity> artists;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'artists': artists.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
