// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album.dart';

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
