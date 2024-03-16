// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimpleAlbumImpl _$$SimpleAlbumImplFromJson(Map<String, dynamic> json) =>
    _$SimpleAlbumImpl(
      name: json['name'] as String,
      spotifyId: json['spotifyId'] as String,
    );

Map<String, dynamic> _$$SimpleAlbumImplToJson(_$SimpleAlbumImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'spotifyId': instance.spotifyId,
    };

_$SimpleArtistImpl _$$SimpleArtistImplFromJson(Map<String, dynamic> json) =>
    _$SimpleArtistImpl(
      name: json['name'] as String,
      spotifyId: json['spotifyId'] as String,
    );

Map<String, dynamic> _$$SimpleArtistImplToJson(_$SimpleArtistImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'spotifyId': instance.spotifyId,
    };

_$SingleTrackImpl _$$SingleTrackImplFromJson(Map<String, dynamic> json) =>
    _$SingleTrackImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      album: SimpleAlbum.fromJson(json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>)
          .map((e) => SimpleArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      spotifyId: json['spotifyId'] as String,
      imageUrl: json['imageUrl'] as String,
      index: json['index'] as int? ?? 0,
    );

Map<String, dynamic> _$$SingleTrackImplToJson(_$SingleTrackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'album': instance.album,
      'artists': instance.artists,
      'spotifyId': instance.spotifyId,
      'imageUrl': instance.imageUrl,
      'index': instance.index,
    };
