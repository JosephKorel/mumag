import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
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

IconData labelIcon(double rating) {
  if (rating == 5) {
    return RatingValue.masterpiece.icon;
  }

  return RatingValue.values[rating.floor() - 1].icon;
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

  IconData rateIcon(double ratingValue) => [
        PhosphorIcons.thumbsDown(
          ratingValue >= score
              ? PhosphorIconsStyle.fill
              : PhosphorIconsStyle.light,
        ),
        PhosphorIcons.smileyMeh(
          ratingValue >= score
              ? PhosphorIconsStyle.fill
              : PhosphorIconsStyle.light,
        ),
        PhosphorIcons.thumbsUp(
          ratingValue >= score
              ? PhosphorIconsStyle.fill
              : PhosphorIconsStyle.light,
        ),
        PhosphorIcons.handsClapping(
          ratingValue >= score
              ? PhosphorIconsStyle.fill
              : PhosphorIconsStyle.light,
        ),
        PhosphorIcons.sketchLogo(
          ratingValue >= score
              ? PhosphorIconsStyle.fill
              : PhosphorIconsStyle.light,
        ),
      ][index];
}

extension RatingTypeIcon on RatingType {
  IconData get icon => [Icons.album, Icons.music_note, Icons.person][index];
}

extension RatingToSuggestion on RatingType {
  SuggestionType get suggestionType => [
        SuggestionType.album,
        SuggestionType.track,
        SuggestionType.artist,
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

  const RatingEntity._();

  factory RatingEntity.fromJson(Map<String, dynamic> json) =>
      _$RatingEntityFromJson(json);

  static List<RatingEntity> ratingsByTypeAndValue(
    List<RatingEntity> ratingList,
    RatingType? type,
    int? rating,
  ) {
    return ratingList
        .where(
          (e) =>
              (type == null || e.type == type) &&
              (rating == null || e.rating >= rating),
        )
        .toList();
  }
}
