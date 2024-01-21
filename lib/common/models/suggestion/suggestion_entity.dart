import 'dart:convert';

import 'package:flutter/material.dart';
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
}

base class SuggestionEntity {
  const SuggestionEntity({
    required this.id,
    required this.type,
    required this.rating,
    required this.spotifyId,
  });

  factory SuggestionEntity.fromMap(Map<String, dynamic> map) {
    return SuggestionEntity(
      id: map['id'] as int,
      type: SuggestionType.values
          .where((element) => element.name == map['type'])
          .single,
      rating: map['rating'] != null ? map['rating'] as int : null,
      spotifyId: map['spotifyId'] as String,
    );
  }

  factory SuggestionEntity.fromJson(String source) =>
      SuggestionEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final SuggestionType type;
  final int? rating;
  final String spotifyId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type.name,
      'rating': rating,
      'spotifyId': spotifyId,
    };
  }

  String toJson() => json.encode(toMap());
}

final class SentSuggestion extends SuggestionEntity {
  const SentSuggestion({
    required super.id,
    required super.type,
    required super.rating,
    required super.spotifyId,
    required this.sentToId,
    required this.sentToName,
  });

  factory SentSuggestion.fromJson(String source) =>
      SentSuggestion.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SentSuggestion.fromMap(Map<String, dynamic> map) {
    return SentSuggestion(
      id: map['id'] as int,
      type: SuggestionType.values
          .where((element) => element.name == map['type'])
          .single,
      rating: map['rating'] != null ? map['rating'] as int : null,
      spotifyId: map['spotifyId'] as String,
      sentToId: int.tryParse(map['sentToId']['id'] as String)!,
      sentToName: map['sentTo']['name'] as String,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'sentTo': {'id': sentToId, 'name': sentToName},
    };
  }

  final int sentToId;
  final String sentToName;
}

final class ReceivedSuggestion extends SuggestionEntity {
  const ReceivedSuggestion({
    required super.id,
    required super.type,
    required super.rating,
    required super.spotifyId,
    required this.sentById,
    required this.sentByName,
  });

  factory ReceivedSuggestion.fromJson(String source) =>
      ReceivedSuggestion.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ReceivedSuggestion.fromMap(Map<String, dynamic> map) {
    return ReceivedSuggestion(
      id: map['id'] as int,
      type: SuggestionType.values
          .where((element) => element.name == map['type'])
          .single,
      rating: map['rating'] != null ? map['rating'] as int : null,
      spotifyId: map['spotifyId'] as String,
      sentById: map['sentBy']['id'] as int,
      sentByName: map['sentBy']['name'] as String,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'sentBy': {'id': sentById, 'name': sentByName},
    };
  }

  final int sentById;
  final String sentByName;
}
