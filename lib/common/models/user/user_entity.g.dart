// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      username: json['username'] as String,
      avatar: json['avatar'] as String,
      hasConnected: json['hasConnected'] as bool,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'avatar': instance.avatar,
      'hasConnected': instance.hasConnected,
    };
