// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreEntityImpl _$$ScoreEntityImplFromJson(Map<String, dynamic> json) =>
    _$ScoreEntityImpl(
      id: json['id'] as int,
      score: json['score'] as int,
      scoredAt: json['scoredAt'] as int,
      type: $enumDecode(_$ScoreTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ScoreEntityImplToJson(_$ScoreEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'scoredAt': instance.scoredAt,
      'type': _$ScoreTypeEnumMap[instance.type]!,
    };

const _$ScoreTypeEnumMap = {
  ScoreType.track: 'track',
  ScoreType.album: 'album',
  ScoreType.artist: 'artist',
};
