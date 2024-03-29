// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocialUserSimple _$SocialUserSimpleFromJson(Map<String, dynamic> json) {
  return _SocialUserSimple.fromJson(json);
}

/// @nodoc
mixin _$SocialUserSimple {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialUserSimpleCopyWith<SocialUserSimple> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialUserSimpleCopyWith<$Res> {
  factory $SocialUserSimpleCopyWith(
          SocialUserSimple value, $Res Function(SocialUserSimple) then) =
      _$SocialUserSimpleCopyWithImpl<$Res, SocialUserSimple>;
  @useResult
  $Res call({int id, String name, String avatarUrl, List<String> genres});
}

/// @nodoc
class _$SocialUserSimpleCopyWithImpl<$Res, $Val extends SocialUserSimple>
    implements $SocialUserSimpleCopyWith<$Res> {
  _$SocialUserSimpleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = null,
    Object? genres = null,
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
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialUserSimpleImplCopyWith<$Res>
    implements $SocialUserSimpleCopyWith<$Res> {
  factory _$$SocialUserSimpleImplCopyWith(_$SocialUserSimpleImpl value,
          $Res Function(_$SocialUserSimpleImpl) then) =
      __$$SocialUserSimpleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String avatarUrl, List<String> genres});
}

/// @nodoc
class __$$SocialUserSimpleImplCopyWithImpl<$Res>
    extends _$SocialUserSimpleCopyWithImpl<$Res, _$SocialUserSimpleImpl>
    implements _$$SocialUserSimpleImplCopyWith<$Res> {
  __$$SocialUserSimpleImplCopyWithImpl(_$SocialUserSimpleImpl _value,
      $Res Function(_$SocialUserSimpleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = null,
    Object? genres = null,
  }) {
    return _then(_$SocialUserSimpleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialUserSimpleImpl implements _SocialUserSimple {
  _$SocialUserSimpleImpl(
      {required this.id,
      required this.name,
      required this.avatarUrl,
      required final List<String> genres})
      : _genres = genres;

  factory _$SocialUserSimpleImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialUserSimpleImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String avatarUrl;
  final List<String> _genres;
  @override
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'SocialUserSimple(id: $id, name: $name, avatarUrl: $avatarUrl, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialUserSimpleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatarUrl,
      const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialUserSimpleImplCopyWith<_$SocialUserSimpleImpl> get copyWith =>
      __$$SocialUserSimpleImplCopyWithImpl<_$SocialUserSimpleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialUserSimpleImplToJson(
      this,
    );
  }
}

abstract class _SocialUserSimple implements SocialUserSimple {
  factory _SocialUserSimple(
      {required final int id,
      required final String name,
      required final String avatarUrl,
      required final List<String> genres}) = _$SocialUserSimpleImpl;

  factory _SocialUserSimple.fromJson(Map<String, dynamic> json) =
      _$SocialUserSimpleImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get avatarUrl;
  @override
  List<String> get genres;
  @override
  @JsonKey(ignore: true)
  _$$SocialUserSimpleImplCopyWith<_$SocialUserSimpleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
