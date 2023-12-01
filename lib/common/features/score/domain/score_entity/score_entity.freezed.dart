// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScoreEntity _$ScoreEntityFromJson(Map<String, dynamic> json) {
  return _ScoreEntity.fromJson(json);
}

/// @nodoc
mixin _$ScoreEntity {
  int get id => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  int get scoredAt => throw _privateConstructorUsedError;
  ScoreType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScoreEntityCopyWith<ScoreEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreEntityCopyWith<$Res> {
  factory $ScoreEntityCopyWith(
          ScoreEntity value, $Res Function(ScoreEntity) then) =
      _$ScoreEntityCopyWithImpl<$Res, ScoreEntity>;
  @useResult
  $Res call({int id, int score, int scoredAt, ScoreType type});
}

/// @nodoc
class _$ScoreEntityCopyWithImpl<$Res, $Val extends ScoreEntity>
    implements $ScoreEntityCopyWith<$Res> {
  _$ScoreEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? score = null,
    Object? scoredAt = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      scoredAt: null == scoredAt
          ? _value.scoredAt
          : scoredAt // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScoreType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreEntityImplCopyWith<$Res>
    implements $ScoreEntityCopyWith<$Res> {
  factory _$$ScoreEntityImplCopyWith(
          _$ScoreEntityImpl value, $Res Function(_$ScoreEntityImpl) then) =
      __$$ScoreEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int score, int scoredAt, ScoreType type});
}

/// @nodoc
class __$$ScoreEntityImplCopyWithImpl<$Res>
    extends _$ScoreEntityCopyWithImpl<$Res, _$ScoreEntityImpl>
    implements _$$ScoreEntityImplCopyWith<$Res> {
  __$$ScoreEntityImplCopyWithImpl(
      _$ScoreEntityImpl _value, $Res Function(_$ScoreEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? score = null,
    Object? scoredAt = null,
    Object? type = null,
  }) {
    return _then(_$ScoreEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      scoredAt: null == scoredAt
          ? _value.scoredAt
          : scoredAt // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ScoreType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreEntityImpl implements _ScoreEntity {
  _$ScoreEntityImpl(
      {required this.id,
      required this.score,
      required this.scoredAt,
      required this.type});

  factory _$ScoreEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreEntityImplFromJson(json);

  @override
  final int id;
  @override
  final int score;
  @override
  final int scoredAt;
  @override
  final ScoreType type;

  @override
  String toString() {
    return 'ScoreEntity(id: $id, score: $score, scoredAt: $scoredAt, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.scoredAt, scoredAt) ||
                other.scoredAt == scoredAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, score, scoredAt, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreEntityImplCopyWith<_$ScoreEntityImpl> get copyWith =>
      __$$ScoreEntityImplCopyWithImpl<_$ScoreEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreEntityImplToJson(
      this,
    );
  }
}

abstract class _ScoreEntity implements ScoreEntity {
  factory _ScoreEntity(
      {required final int id,
      required final int score,
      required final int scoredAt,
      required final ScoreType type}) = _$ScoreEntityImpl;

  factory _ScoreEntity.fromJson(Map<String, dynamic> json) =
      _$ScoreEntityImpl.fromJson;

  @override
  int get id;
  @override
  int get score;
  @override
  int get scoredAt;
  @override
  ScoreType get type;
  @override
  @JsonKey(ignore: true)
  _$$ScoreEntityImplCopyWith<_$ScoreEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
