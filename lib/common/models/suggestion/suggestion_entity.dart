import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion_entity.freezed.dart';
part 'suggestion_entity.g.dart';

enum SuggestionType {
  album('Album'),
  track('Track'),
  artist('Artist');

  const SuggestionType(this.label);

  final String label;
}

@freezed
class SuggestionEntity with _$SuggestionEntity {
  factory SuggestionEntity() = _SuggestionEntity;

  factory SuggestionEntity.fromJson(Map<String, dynamic> json) =>
      _$SuggestionEntityFromJson(json);
}

extension SuggestionTypeIcon on SuggestionType {
  IconData get icon =>
      [Icons.album, Icons.music_note_sharp, Icons.person][index];
}
