import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mumag/common/models/media/album.dart';
import 'package:mumag/common/models/media/artist.dart';
import 'package:spotify/spotify.dart';

part 'track.freezed.dart';
part 'track.g.dart';

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

@freezed
class SavedTrack with _$SavedTrack {
  factory SavedTrack({
    required int id,
    required String name,
    required SimpleAlbum album,
    required List<ArtistEntity> artist,
    required String spotifyId,
    required String imageUrl,
    required DateTime addedAt,
  }) = _SavedTrack;

  factory SavedTrack.fromJson(Map<String, dynamic> json) =>
      _$SavedTrackFromJson(json);

/*   @override
  bool operator ==(Object other) => other is SavedTrack && name == other.name; */
}
