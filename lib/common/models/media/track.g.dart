// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedTrackImpl _$$SavedTrackImplFromJson(Map<String, dynamic> json) =>
    _$SavedTrackImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      album: SimpleAlbum.fromJson(json['album'] as Map<String, dynamic>),
      artist: (json['artist'] as List<dynamic>)
          .map((e) => ArtistEntity.fromJson(e as String))
          .toList(),
      spotifyId: json['spotifyId'] as String,
      imageUrl: json['imageUrl'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
    );

Map<String, dynamic> _$$SavedTrackImplToJson(_$SavedTrackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'album': instance.album,
      'artist': instance.artist,
      'spotifyId': instance.spotifyId,
      'imageUrl': instance.imageUrl,
      'addedAt': instance.addedAt.toIso8601String(),
    };
