import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'rating_entity.freezed.dart';
part 'rating_entity.g.dart';

final labels = RatingValue.values.map((e) => e.label).toList();

String ratingLabel(double rating) {
  if (rating == 5) {
    return labels.last;
  }
  return labels[rating.floor() - 1];
}

enum RatingValue {
  bad(1),
  average(2),
  good(3),
  great(4),
  masterpiece(5);

  const RatingValue(this.score);

  final int score;
}

enum RatingType {
  album('Album'),
  track('Track'),
  artist('Artist');

  const RatingType(this.label);

  final String label;
}

extension RatingLabel on RatingValue {
  String get label => ['Bad', 'Average', 'Good', 'Great', 'Masterpiece'][index];
  IconData get icon => [
        PhosphorIconsLight.thumbsDown,
        PhosphorIconsLight.smileyMeh,
        PhosphorIconsLight.thumbsUp,
        PhosphorIconsLight.handsClapping,
        PhosphorIconsLight.sketchLogo,
      ][index];
}

@freezed
class RatingEntity with _$RatingEntity {
  factory RatingEntity({
    required int id,
    required RatingType type,
    required String spotifyId,
    required int rating,
  }) = _RatingEntity;

  factory RatingEntity.fromJson(Map<String, dynamic> json) =>
      _$RatingEntityFromJson(json);
}
