import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mumag/routes/routes.dart';
import 'package:spotify/spotify.dart';

enum SuggestionType {
  artist('Artist'),
  album('Album'),
  track('Track');

  const SuggestionType(this.label);

  final String label;
}

extension SuggestionTypeIcon on SuggestionType {
  IconData get icon =>
      [Icons.person, Icons.album, Icons.music_note_sharp][index];
}

extension ToSpotifyType on SuggestionType {
  SearchType get type => [
        SearchType.artist,
        SearchType.album,
        SearchType.track,
      ][index];

  // Route name for each type
  String get pageRoute => [
        const ArtistViewRoute().location,
        const AlbumViewRoute().location,
        const TrackViewRoute().location,
      ][index];
}

base class SuggestionEntity {
  const SuggestionEntity({
    required this.id,
    required this.type,
    required this.rating,
    required this.spotifyId,
    required this.createdAt,
  });

  factory SuggestionEntity.fromMap(Map<String, dynamic> map) {
    return SuggestionEntity(
      id: map['id'] as int,
      type: SuggestionType.values
          .where((element) => element.name == map['type'])
          .single,
      rating: map['rating'] != null ? map['rating'] as int : null,
      spotifyId: map['spotifyId'] as String,
      createdAt: map['createdAt'] as DateTime,
    );
  }

  factory SuggestionEntity.fromJson(String source) =>
      SuggestionEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final SuggestionType type;
  final int? rating;
  final String spotifyId;
  final DateTime createdAt;

  Map<String, dynamic> toMap({bool receivedSuggestion = false}) {
    return <String, dynamic>{
      'id': id,
      'type': type.name,
      'rating': rating,
      'spotifyId': spotifyId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());
}

final class UserSuggestion extends SuggestionEntity {
  const UserSuggestion({
    required super.id,
    required super.type,
    required super.rating,
    required super.spotifyId,
    required super.createdAt,
    required this.suggesterId,
    required this.suggesterName,
  });

  factory UserSuggestion.fromJson(String source) =>
      UserSuggestion.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserSuggestion.fromMap(Map<String, dynamic> map) {
    return UserSuggestion(
      id: map['id'] as int,
      type: SuggestionType.values
          .where((element) => element.name == map['type'])
          .single,
      rating: map['rating'] != null ? map['rating'] as int : null,
      spotifyId: map['spotifyId'] as String,
      suggesterId: map['suggester']['id'] as int,
      suggesterName: map['suggester']['name'] as String,
      createdAt: map['createdAt'] == null
          ? DateTime.now()
          : DateTime.parse(map['createdAt'] as String).toUtc(),
    );
  }

  @override
  Map<String, dynamic> toMap({bool receivedSuggestion = false}) {
    return {
      ...super.toMap(),
      'suggester': {'id': suggesterId, 'name': suggesterName},
    };

    if (receivedSuggestion) {
      return {
        ...super.toMap(),
        'sentBy': {'id': suggesterId, 'name': suggesterName},
      };
    }

    return {
      ...super.toMap(),
      'sentTo': {'id': suggesterId, 'name': suggesterName},
    };
  }

  final int suggesterId;
  final String suggesterName;
}
