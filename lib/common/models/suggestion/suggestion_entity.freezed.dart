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
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionEntityCopyWith<$Res> {
  factory $SuggestionEntityCopyWith(
          SuggestionEntity value, $Res Function(SuggestionEntity) then) =
      _$SuggestionEntityCopyWithImpl<$Res, SuggestionEntity>;
}

/// @nodoc
class _$SuggestionEntityCopyWithImpl<$Res, $Val extends SuggestionEntity>
    implements $SuggestionEntityCopyWith<$Res> {
  _$SuggestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuggestionEntityImplCopyWith<$Res> {
  factory _$$SuggestionEntityImplCopyWith(_$SuggestionEntityImpl value,
          $Res Function(_$SuggestionEntityImpl) then) =
      __$$SuggestionEntityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuggestionEntityImplCopyWithImpl<$Res>
    extends _$SuggestionEntityCopyWithImpl<$Res, _$SuggestionEntityImpl>
    implements _$$SuggestionEntityImplCopyWith<$Res> {
  __$$SuggestionEntityImplCopyWithImpl(_$SuggestionEntityImpl _value,
      $Res Function(_$SuggestionEntityImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SuggestionEntityImpl implements _SuggestionEntity {
  _$SuggestionEntityImpl();

  factory _$SuggestionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionEntityImplFromJson(json);

  @override
  String toString() {
    return 'SuggestionEntity()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuggestionEntityImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionEntityImplToJson(
      this,
    );
  }
}

abstract class _SuggestionEntity implements SuggestionEntity {
  factory _SuggestionEntity() = _$SuggestionEntityImpl;

  factory _SuggestionEntity.fromJson(Map<String, dynamic> json) =
      _$SuggestionEntityImpl.fromJson;
}
