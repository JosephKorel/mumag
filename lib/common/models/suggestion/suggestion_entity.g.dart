// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestionEntityImpl _$$SuggestionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestionEntityImpl(
      id: json['id'] as int,
      type: $enumDecode(_$SuggestionTypeEnumMap, json['type']),
      rating: json['rating'] as int,
      sentTo: json['sentTo'] as int,
      spotifyId: json['spotifyId'] as String,
    );

Map<String, dynamic> _$$SuggestionEntityImplToJson(
        _$SuggestionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SuggestionTypeEnumMap[instance.type]!,
      'rating': instance.rating,
      'sentTo': instance.sentTo,
      'spotifyId': instance.spotifyId,
    };

const _$SuggestionTypeEnumMap = {
  SuggestionType.album: 'album',
  SuggestionType.track: 'track',
  SuggestionType.artist: 'artist',
};
