import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spotify/spotify.dart';

part 'suggestion_entity.freezed.dart';
part 'suggestion_entity.g.dart';

enum SuggestionType {
  artist('Artist'),
  album('Album'),
  track('Track');

  const SuggestionType(this.label);

  final String label;
}

@freezed
class SuggestionEntity with _$SuggestionEntity {
  factory SuggestionEntity({
    required int id,
    required SuggestionType type,
    required int? rating,
    required int sentTo,
    required String spotifyId,
  }) = _SuggestionEntity;

  factory SuggestionEntity.fromJson(Map<String, dynamic> json) =>
      _$SuggestionEntityFromJson(json);
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
