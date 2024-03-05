// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteTitlesEntityImpl _$$FavoriteTitlesEntityImplFromJson(
  Map<String, dynamic> json,
) =>
    _$FavoriteTitlesEntityImpl(
      id: json['id'] as int,
      songsTitle: json['songsTitle'] as String,
      albumsTitle: json['albumsTitle'] as String,
      artistsTitle: json['artistsTitle'] as String,
      songsLike:
          (json['songsLike'] as List<dynamic>).map((e) => e as int).toList(),
      albumsLike:
          (json['albumsLike'] as List<dynamic>).map((e) => e as int).toList(),
      artistsLike:
          (json['artistsLike'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$FavoriteTitlesEntityImplToJson(
  _$FavoriteTitlesEntityImpl instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'songsTitle': instance.songsTitle,
      'albumsTitle': instance.albumsTitle,
      'artistsTitle': instance.artistsTitle,
      'songsLike': instance.songsLike,
      'albumsLike': instance.albumsLike,
      'artistsLike': instance.artistsLike,
    };
