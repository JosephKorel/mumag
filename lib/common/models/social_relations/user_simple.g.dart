// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_simple.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialUserSimpleImpl _$$SocialUserSimpleImplFromJson(
  Map<String, dynamic> json,
) =>
    _$SocialUserSimpleImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SocialUserSimpleImplToJson(
  _$SocialUserSimpleImpl instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'genres': instance.genres,
    };
