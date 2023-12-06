// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingEntityImpl _$$RatingEntityImplFromJson(Map<String, dynamic> json) =>
    _$RatingEntityImpl(
      id: json['id'] as int,
      type: $enumDecode(_$RatingTypeEnumMap, json['type']),
      spotifyId: json['spotifyId'] as String,
      score: json['score'] as int,
    );

Map<String, dynamic> _$$RatingEntityImplToJson(_$RatingEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RatingTypeEnumMap[instance.type],
      'spotifyId': instance.spotifyId,
      'score': instance.score,
    };

const _$RatingTypeEnumMap = {
  RatingType.album: 'album',
  RatingType.track: 'track',
  RatingType.artist: 'artist',
};
