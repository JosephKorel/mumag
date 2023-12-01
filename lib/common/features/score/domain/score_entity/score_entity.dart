import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_entity.freezed.dart';
part 'score_entity.g.dart';

enum ScoreType { track, album, artist }

@freezed
class ScoreEntity with _$ScoreEntity {
  factory ScoreEntity({
    required int id,
    required int score,
    required int scoredAt,
    required ScoreType type,
  }) = _ScoreEntity;

  factory ScoreEntity.fromJson(Map<String, dynamic> json) =>
      _$ScoreEntityFromJson(json);
}
