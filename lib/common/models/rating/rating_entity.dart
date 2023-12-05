import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_entity.freezed.dart';
part 'rating_entity.g.dart';

enum RatingValue {
  bad(1),
  good(2),
  great(3),
  masterpiece(4);

  const RatingValue(this.score);

  final int score;
}

enum RatingType {
  album('Album'),
  track('Track'),
  artist('Artis');

  const RatingType(this.label);

  final String label;
}

extension RatingLabel on RatingValue {
  String get label => ['Bad', 'Good', 'Great', 'Masterpiece'][index];
}

@freezed
class RatingEntity with _$RatingEntity {
  factory RatingEntity({
    required int id,
    required RatingType type,
    required String spotifyId,
    required int score,
  }) = _RatingEntity;

  factory RatingEntity.fromJson(Map<String, dynamic> json) =>
      _$RatingEntityFromJson(json);
}
