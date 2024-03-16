// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SimpleAlbum _$SimpleAlbumFromJson(Map<String, dynamic> json) {
  return _SimpleAlbum.fromJson(json);
}

/// @nodoc
mixin _$SimpleAlbum {
  String get name => throw _privateConstructorUsedError;
  String get spotifyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleAlbumCopyWith<SimpleAlbum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleAlbumCopyWith<$Res> {
  factory $SimpleAlbumCopyWith(
          SimpleAlbum value, $Res Function(SimpleAlbum) then) =
      _$SimpleAlbumCopyWithImpl<$Res, SimpleAlbum>;
  @useResult
  $Res call({String name, String spotifyId});
}

/// @nodoc
class _$SimpleAlbumCopyWithImpl<$Res, $Val extends SimpleAlbum>
    implements $SimpleAlbumCopyWith<$Res> {
  _$SimpleAlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? spotifyId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimpleAlbumImplCopyWith<$Res>
    implements $SimpleAlbumCopyWith<$Res> {
  factory _$$SimpleAlbumImplCopyWith(
          _$SimpleAlbumImpl value, $Res Function(_$SimpleAlbumImpl) then) =
      __$$SimpleAlbumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String spotifyId});
}

/// @nodoc
class __$$SimpleAlbumImplCopyWithImpl<$Res>
    extends _$SimpleAlbumCopyWithImpl<$Res, _$SimpleAlbumImpl>
    implements _$$SimpleAlbumImplCopyWith<$Res> {
  __$$SimpleAlbumImplCopyWithImpl(
      _$SimpleAlbumImpl _value, $Res Function(_$SimpleAlbumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? spotifyId = null,
  }) {
    return _then(_$SimpleAlbumImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleAlbumImpl implements _SimpleAlbum {
  _$SimpleAlbumImpl({required this.name, required this.spotifyId});

  factory _$SimpleAlbumImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleAlbumImplFromJson(json);

  @override
  final String name;
  @override
  final String spotifyId;

  @override
  String toString() {
    return 'SimpleAlbum(name: $name, spotifyId: $spotifyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleAlbumImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.spotifyId, spotifyId) ||
                other.spotifyId == spotifyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, spotifyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleAlbumImplCopyWith<_$SimpleAlbumImpl> get copyWith =>
      __$$SimpleAlbumImplCopyWithImpl<_$SimpleAlbumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleAlbumImplToJson(
      this,
    );
  }
}

abstract class _SimpleAlbum implements SimpleAlbum {
  factory _SimpleAlbum(
      {required final String name,
      required final String spotifyId}) = _$SimpleAlbumImpl;

  factory _SimpleAlbum.fromJson(Map<String, dynamic> json) =
      _$SimpleAlbumImpl.fromJson;

  @override
  String get name;
  @override
  String get spotifyId;
  @override
  @JsonKey(ignore: true)
  _$$SimpleAlbumImplCopyWith<_$SimpleAlbumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SimpleArtist _$SimpleArtistFromJson(Map<String, dynamic> json) {
  return _SimpleArtist.fromJson(json);
}

/// @nodoc
mixin _$SimpleArtist {
  String get name => throw _privateConstructorUsedError;
  String get spotifyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleArtistCopyWith<SimpleArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleArtistCopyWith<$Res> {
  factory $SimpleArtistCopyWith(
          SimpleArtist value, $Res Function(SimpleArtist) then) =
      _$SimpleArtistCopyWithImpl<$Res, SimpleArtist>;
  @useResult
  $Res call({String name, String spotifyId});
}

/// @nodoc
class _$SimpleArtistCopyWithImpl<$Res, $Val extends SimpleArtist>
    implements $SimpleArtistCopyWith<$Res> {
  _$SimpleArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? spotifyId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimpleArtistImplCopyWith<$Res>
    implements $SimpleArtistCopyWith<$Res> {
  factory _$$SimpleArtistImplCopyWith(
          _$SimpleArtistImpl value, $Res Function(_$SimpleArtistImpl) then) =
      __$$SimpleArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String spotifyId});
}

/// @nodoc
class __$$SimpleArtistImplCopyWithImpl<$Res>
    extends _$SimpleArtistCopyWithImpl<$Res, _$SimpleArtistImpl>
    implements _$$SimpleArtistImplCopyWith<$Res> {
  __$$SimpleArtistImplCopyWithImpl(
      _$SimpleArtistImpl _value, $Res Function(_$SimpleArtistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? spotifyId = null,
  }) {
    return _then(_$SimpleArtistImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleArtistImpl implements _SimpleArtist {
  _$SimpleArtistImpl({required this.name, required this.spotifyId});

  factory _$SimpleArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleArtistImplFromJson(json);

  @override
  final String name;
  @override
  final String spotifyId;

  @override
  String toString() {
    return 'SimpleArtist(name: $name, spotifyId: $spotifyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleArtistImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.spotifyId, spotifyId) ||
                other.spotifyId == spotifyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, spotifyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleArtistImplCopyWith<_$SimpleArtistImpl> get copyWith =>
      __$$SimpleArtistImplCopyWithImpl<_$SimpleArtistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleArtistImplToJson(
      this,
    );
  }
}

abstract class _SimpleArtist implements SimpleArtist {
  factory _SimpleArtist(
      {required final String name,
      required final String spotifyId}) = _$SimpleArtistImpl;

  factory _SimpleArtist.fromJson(Map<String, dynamic> json) =
      _$SimpleArtistImpl.fromJson;

  @override
  String get name;
  @override
  String get spotifyId;
  @override
  @JsonKey(ignore: true)
  _$$SimpleArtistImplCopyWith<_$SimpleArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SingleTrack _$SingleTrackFromJson(Map<String, dynamic> json) {
  return _SingleTrack.fromJson(json);
}

/// @nodoc
mixin _$SingleTrack {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  SimpleAlbum get album => throw _privateConstructorUsedError;
  List<SimpleArtist> get artists => throw _privateConstructorUsedError;
  String get spotifyId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleTrackCopyWith<SingleTrack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleTrackCopyWith<$Res> {
  factory $SingleTrackCopyWith(
          SingleTrack value, $Res Function(SingleTrack) then) =
      _$SingleTrackCopyWithImpl<$Res, SingleTrack>;
  @useResult
  $Res call(
      {int id,
      String name,
      SimpleAlbum album,
      List<SimpleArtist> artists,
      String spotifyId,
      String imageUrl,
      int index});

  $SimpleAlbumCopyWith<$Res> get album;
}

/// @nodoc
class _$SingleTrackCopyWithImpl<$Res, $Val extends SingleTrack>
    implements $SingleTrackCopyWith<$Res> {
  _$SingleTrackCopyWithImpl(this._value, this._then);

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
    Object? artists = null,
    Object? spotifyId = null,
    Object? imageUrl = null,
    Object? index = null,
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
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<SimpleArtist>,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$SingleTrackImplCopyWith<$Res>
    implements $SingleTrackCopyWith<$Res> {
  factory _$$SingleTrackImplCopyWith(
          _$SingleTrackImpl value, $Res Function(_$SingleTrackImpl) then) =
      __$$SingleTrackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      SimpleAlbum album,
      List<SimpleArtist> artists,
      String spotifyId,
      String imageUrl,
      int index});

  @override
  $SimpleAlbumCopyWith<$Res> get album;
}

/// @nodoc
class __$$SingleTrackImplCopyWithImpl<$Res>
    extends _$SingleTrackCopyWithImpl<$Res, _$SingleTrackImpl>
    implements _$$SingleTrackImplCopyWith<$Res> {
  __$$SingleTrackImplCopyWithImpl(
      _$SingleTrackImpl _value, $Res Function(_$SingleTrackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? album = null,
    Object? artists = null,
    Object? spotifyId = null,
    Object? imageUrl = null,
    Object? index = null,
  }) {
    return _then(_$SingleTrackImpl(
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
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<SimpleArtist>,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleTrackImpl extends _SingleTrack {
  _$SingleTrackImpl(
      {required this.id,
      required this.name,
      required this.album,
      required final List<SimpleArtist> artists,
      required this.spotifyId,
      required this.imageUrl,
      this.index = 0})
      : _artists = artists,
        super._();

  factory _$SingleTrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleTrackImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final SimpleAlbum album;
  final List<SimpleArtist> _artists;
  @override
  List<SimpleArtist> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  final String spotifyId;
  @override
  final String imageUrl;
  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'SingleTrack(id: $id, name: $name, album: $album, artists: $artists, spotifyId: $spotifyId, imageUrl: $imageUrl, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleTrackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.album, album) || other.album == album) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.spotifyId, spotifyId) ||
                other.spotifyId == spotifyId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      album,
      const DeepCollectionEquality().hash(_artists),
      spotifyId,
      imageUrl,
      index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleTrackImplCopyWith<_$SingleTrackImpl> get copyWith =>
      __$$SingleTrackImplCopyWithImpl<_$SingleTrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleTrackImplToJson(
      this,
    );
  }
}

abstract class _SingleTrack extends SingleTrack {
  factory _SingleTrack(
      {required final int id,
      required final String name,
      required final SimpleAlbum album,
      required final List<SimpleArtist> artists,
      required final String spotifyId,
      required final String imageUrl,
      final int index}) = _$SingleTrackImpl;
  _SingleTrack._() : super._();

  factory _SingleTrack.fromJson(Map<String, dynamic> json) =
      _$SingleTrackImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  SimpleAlbum get album;
  @override
  List<SimpleArtist> get artists;
  @override
  String get spotifyId;
  @override
  String get imageUrl;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$SingleTrackImplCopyWith<_$SingleTrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
