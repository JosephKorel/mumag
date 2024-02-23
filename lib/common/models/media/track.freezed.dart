// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedTrack _$SavedTrackFromJson(Map<String, dynamic> json) {
  return _SavedTrack.fromJson(json);
}

/// @nodoc
mixin _$SavedTrack {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  SimpleAlbum get album => throw _privateConstructorUsedError;
  List<ArtistEntity> get artist => throw _privateConstructorUsedError;
  String get spotifyId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  DateTime get addedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedTrackCopyWith<SavedTrack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedTrackCopyWith<$Res> {
  factory $SavedTrackCopyWith(
          SavedTrack value, $Res Function(SavedTrack) then) =
      _$SavedTrackCopyWithImpl<$Res, SavedTrack>;
  @useResult
  $Res call(
      {int id,
      String name,
      SimpleAlbum album,
      List<ArtistEntity> artist,
      String spotifyId,
      String imageUrl,
      DateTime addedAt});

  $SimpleAlbumCopyWith<$Res> get album;
}

/// @nodoc
class _$SavedTrackCopyWithImpl<$Res, $Val extends SavedTrack>
    implements $SavedTrackCopyWith<$Res> {
  _$SavedTrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? album = null,
    Object? artist = null,
    Object? spotifyId = null,
    Object? imageUrl = null,
    Object? addedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as SimpleAlbum,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as List<ArtistEntity>,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SimpleAlbumCopyWith<$Res> get album {
    return $SimpleAlbumCopyWith<$Res>(_value.album, (value) {
      return _then(_value.copyWith(album: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavedTrackImplCopyWith<$Res>
    implements $SavedTrackCopyWith<$Res> {
  factory _$$SavedTrackImplCopyWith(
          _$SavedTrackImpl value, $Res Function(_$SavedTrackImpl) then) =
      __$$SavedTrackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      SimpleAlbum album,
      List<ArtistEntity> artist,
      String spotifyId,
      String imageUrl,
      DateTime addedAt});

  @override
  $SimpleAlbumCopyWith<$Res> get album;
}

/// @nodoc
class __$$SavedTrackImplCopyWithImpl<$Res>
    extends _$SavedTrackCopyWithImpl<$Res, _$SavedTrackImpl>
    implements _$$SavedTrackImplCopyWith<$Res> {
  __$$SavedTrackImplCopyWithImpl(
      _$SavedTrackImpl _value, $Res Function(_$SavedTrackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? album = null,
    Object? artist = null,
    Object? spotifyId = null,
    Object? imageUrl = null,
    Object? addedAt = null,
  }) {
    return _then(_$SavedTrackImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      album: null == album
          ? _value.album
          : album // ignore: cast_nullable_to_non_nullable
              as SimpleAlbum,
      artist: null == artist
          ? _value._artist
          : artist // ignore: cast_nullable_to_non_nullable
              as List<ArtistEntity>,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedTrackImpl implements _SavedTrack {
  _$SavedTrackImpl(
      {required this.id,
      required this.name,
      required this.album,
      required final List<ArtistEntity> artist,
      required this.spotifyId,
      required this.imageUrl,
      required this.addedAt})
      : _artist = artist;

  factory _$SavedTrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedTrackImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final SimpleAlbum album;
  final List<ArtistEntity> _artist;
  @override
  List<ArtistEntity> get artist {
    if (_artist is EqualUnmodifiableListView) return _artist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artist);
  }

  @override
  final String spotifyId;
  @override
  final String imageUrl;
  @override
  final DateTime addedAt;

  @override
  String toString() {
    return 'SavedTrack(id: $id, name: $name, album: $album, artist: $artist, spotifyId: $spotifyId, imageUrl: $imageUrl, addedAt: $addedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedTrackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.album, album) || other.album == album) &&
            const DeepCollectionEquality().equals(other._artist, _artist) &&
            (identical(other.spotifyId, spotifyId) ||
                other.spotifyId == spotifyId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      album,
      const DeepCollectionEquality().hash(_artist),
      spotifyId,
      imageUrl,
      addedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedTrackImplCopyWith<_$SavedTrackImpl> get copyWith =>
      __$$SavedTrackImplCopyWithImpl<_$SavedTrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedTrackImplToJson(
      this,
    );
  }
}

abstract class _SavedTrack implements SavedTrack {
  factory _SavedTrack(
      {required final int id,
      required final String name,
      required final SimpleAlbum album,
      required final List<ArtistEntity> artist,
      required final String spotifyId,
      required final String imageUrl,
      required final DateTime addedAt}) = _$SavedTrackImpl;

  factory _SavedTrack.fromJson(Map<String, dynamic> json) =
      _$SavedTrackImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  SimpleAlbum get album;
  @override
  List<ArtistEntity> get artist;
  @override
  String get spotifyId;
  @override
  String get imageUrl;
  @override
  DateTime get addedAt;
  @override
  @JsonKey(ignore: true)
  _$$SavedTrackImplCopyWith<_$SavedTrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
