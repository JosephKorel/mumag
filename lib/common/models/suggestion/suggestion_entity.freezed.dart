// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SuggestionEntity _$SuggestionEntityFromJson(Map<String, dynamic> json) {
  return _SuggestionEntity.fromJson(json);
}

/// @nodoc
mixin _$SuggestionEntity {
  int get id => throw _privateConstructorUsedError;
  SuggestionType get type => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  int get sentTo => throw _privateConstructorUsedError;
  String get spotifyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestionEntityCopyWith<SuggestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionEntityCopyWith<$Res> {
  factory $SuggestionEntityCopyWith(
          SuggestionEntity value, $Res Function(SuggestionEntity) then) =
      _$SuggestionEntityCopyWithImpl<$Res, SuggestionEntity>;
  @useResult
  $Res call(
      {int id, SuggestionType type, int rating, int sentTo, String spotifyId});
}

/// @nodoc
class _$SuggestionEntityCopyWithImpl<$Res, $Val extends SuggestionEntity>
    implements $SuggestionEntityCopyWith<$Res> {
  _$SuggestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? rating = null,
    Object? sentTo = null,
    Object? spotifyId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SuggestionType,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      sentTo: null == sentTo
          ? _value.sentTo
          : sentTo // ignore: cast_nullable_to_non_nullable
              as int,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionEntityImplCopyWith<$Res>
    implements $SuggestionEntityCopyWith<$Res> {
  factory _$$SuggestionEntityImplCopyWith(_$SuggestionEntityImpl value,
          $Res Function(_$SuggestionEntityImpl) then) =
      __$$SuggestionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, SuggestionType type, int rating, int sentTo, String spotifyId});
}

/// @nodoc
class __$$SuggestionEntityImplCopyWithImpl<$Res>
    extends _$SuggestionEntityCopyWithImpl<$Res, _$SuggestionEntityImpl>
    implements _$$SuggestionEntityImplCopyWith<$Res> {
  __$$SuggestionEntityImplCopyWithImpl(_$SuggestionEntityImpl _value,
      $Res Function(_$SuggestionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? rating = null,
    Object? sentTo = null,
    Object? spotifyId = null,
  }) {
    return _then(_$SuggestionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SuggestionType,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      sentTo: null == sentTo
          ? _value.sentTo
          : sentTo // ignore: cast_nullable_to_non_nullable
              as int,
      spotifyId: null == spotifyId
          ? _value.spotifyId
          : spotifyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionEntityImpl implements _SuggestionEntity {
  _$SuggestionEntityImpl(
      {required this.id,
      required this.type,
      required this.rating,
      required this.sentTo,
      required this.spotifyId});

  factory _$SuggestionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionEntityImplFromJson(json);

  @override
  final int id;
  @override
  final SuggestionType type;
  @override
  final int rating;
  @override
  final int sentTo;
  @override
  final String spotifyId;

  @override
  String toString() {
    return 'SuggestionEntity(id: $id, type: $type, rating: $rating, sentTo: $sentTo, spotifyId: $spotifyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.sentTo, sentTo) || other.sentTo == sentTo) &&
            (identical(other.spotifyId, spotifyId) ||
                other.spotifyId == spotifyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, rating, sentTo, spotifyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionEntityImplCopyWith<_$SuggestionEntityImpl> get copyWith =>
      __$$SuggestionEntityImplCopyWithImpl<_$SuggestionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionEntityImplToJson(
      this,
    );
  }
}

abstract class _SuggestionEntity implements SuggestionEntity {
  factory _SuggestionEntity(
      {required final int id,
      required final SuggestionType type,
      required final int rating,
      required final int sentTo,
      required final String spotifyId}) = _$SuggestionEntityImpl;

  factory _SuggestionEntity.fromJson(Map<String, dynamic> json) =
      _$SuggestionEntityImpl.fromJson;

  @override
  int get id;
  @override
  SuggestionType get type;
  @override
  int get rating;
  @override
  int get sentTo;
  @override
  String get spotifyId;
  @override
  @JsonKey(ignore: true)
  _$$SuggestionEntityImplCopyWith<_$SuggestionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
