// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _AuthState.fromJson(json);
    case 'unauthenticated':
      return Unauthenticated.fromJson(json);
    case 'loading':
      return Loading.fromJson(json);
    case 'authenticated':
      return Authenticated.fromJson(json);
    case 'hasCredentials':
      return HasCredentials.fromJson(json);
    case 'connectedUser':
      return ConnectedUser.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AuthState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() hasCredentials,
    required TResult Function() connectedUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? hasCredentials,
    TResult? Function()? connectedUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? hasCredentials,
    TResult Function()? connectedUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Loading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(HasCredentials value) hasCredentials,
    required TResult Function(ConnectedUser value) connectedUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Loading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(HasCredentials value)? hasCredentials,
    TResult? Function(ConnectedUser value)? connectedUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Loading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(HasCredentials value)? hasCredentials,
    TResult Function(ConnectedUser value)? connectedUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthStateImpl implements _AuthState {
  _$AuthStateImpl({final String? $type}) : $type = $type ?? 'default';

  factory _$AuthStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthStateImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() hasCredentials,
    required TResult Function() connectedUser,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? hasCredentials,
    TResult? Function()? connectedUser,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? hasCredentials,
    TResult Function()? connectedUser,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Loading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(HasCredentials value) hasCredentials,
    required TResult Function(ConnectedUser value) connectedUser,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Loading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(HasCredentials value)? hasCredentials,
    TResult? Function(ConnectedUser value)? connectedUser,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Loading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(HasCredentials value)? hasCredentials,
    TResult Function(ConnectedUser value)? connectedUser,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthStateImplToJson(
      this,
    );
  }
}

abstract class _AuthState implements AuthState {
  factory _AuthState() = _$AuthStateImpl;

  factory _AuthState.fromJson(Map<String, dynamic> json) =
      _$AuthStateImpl.fromJson;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$UnauthenticatedImpl implements Unauthenticated {
  _$UnauthenticatedImpl({final String? $type})
      : $type = $type ?? 'unauthenticated';

  factory _$UnauthenticatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnauthenticatedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() hasCredentials,
    required TResult Function() connectedUser,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? hasCredentials,
    TResult? Function()? connectedUser,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? hasCredentials,
    TResult Function()? connectedUser,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Loading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(HasCredentials value) hasCredentials,
    required TResult Function(ConnectedUser value) connectedUser,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Loading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(HasCredentials value)? hasCredentials,
    TResult? Function(ConnectedUser value)? connectedUser,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Loading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(HasCredentials value)? hasCredentials,
    TResult Function(ConnectedUser value)? connectedUser,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnauthenticatedImplToJson(
      this,
    );
  }
}

abstract class Unauthenticated implements AuthState {
  factory Unauthenticated() = _$UnauthenticatedImpl;

  factory Unauthenticated.fromJson(Map<String, dynamic> json) =
      _$UnauthenticatedImpl.fromJson;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LoadingImpl implements Loading {
  _$LoadingImpl({final String? $type}) : $type = $type ?? 'loading';

  factory _$LoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() hasCredentials,
    required TResult Function() connectedUser,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? hasCredentials,
    TResult? Function()? connectedUser,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? hasCredentials,
    TResult Function()? connectedUser,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Loading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(HasCredentials value) hasCredentials,
    required TResult Function(ConnectedUser value) connectedUser,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Loading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(HasCredentials value)? hasCredentials,
    TResult? Function(ConnectedUser value)? connectedUser,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Loading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(HasCredentials value)? hasCredentials,
    TResult Function(ConnectedUser value)? connectedUser,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingImplToJson(
      this,
    );
  }
}

abstract class Loading implements AuthState {
  factory Loading() = _$LoadingImpl;

  factory Loading.fromJson(Map<String, dynamic> json) = _$LoadingImpl.fromJson;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthenticatedImpl implements Authenticated {
  _$AuthenticatedImpl({final String? $type}) : $type = $type ?? 'authenticated';

  factory _$AuthenticatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticatedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthenticatedImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() hasCredentials,
    required TResult Function() connectedUser,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? hasCredentials,
    TResult? Function()? connectedUser,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? hasCredentials,
    TResult Function()? connectedUser,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Loading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(HasCredentials value) hasCredentials,
    required TResult Function(ConnectedUser value) connectedUser,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Loading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(HasCredentials value)? hasCredentials,
    TResult? Function(ConnectedUser value)? connectedUser,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Loading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(HasCredentials value)? hasCredentials,
    TResult Function(ConnectedUser value)? connectedUser,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticatedImplToJson(
      this,
    );
  }
}

abstract class Authenticated implements AuthState {
  factory Authenticated() = _$AuthenticatedImpl;

  factory Authenticated.fromJson(Map<String, dynamic> json) =
      _$AuthenticatedImpl.fromJson;
}

/// @nodoc
abstract class _$$HasCredentialsImplCopyWith<$Res> {
  factory _$$HasCredentialsImplCopyWith(_$HasCredentialsImpl value,
          $Res Function(_$HasCredentialsImpl) then) =
      __$$HasCredentialsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HasCredentialsImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$HasCredentialsImpl>
    implements _$$HasCredentialsImplCopyWith<$Res> {
  __$$HasCredentialsImplCopyWithImpl(
      _$HasCredentialsImpl _value, $Res Function(_$HasCredentialsImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$HasCredentialsImpl implements HasCredentials {
  _$HasCredentialsImpl({final String? $type})
      : $type = $type ?? 'hasCredentials';

  factory _$HasCredentialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$HasCredentialsImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.hasCredentials()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HasCredentialsImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() hasCredentials,
    required TResult Function() connectedUser,
  }) {
    return hasCredentials();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? hasCredentials,
    TResult? Function()? connectedUser,
  }) {
    return hasCredentials?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? hasCredentials,
    TResult Function()? connectedUser,
    required TResult orElse(),
  }) {
    if (hasCredentials != null) {
      return hasCredentials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Loading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(HasCredentials value) hasCredentials,
    required TResult Function(ConnectedUser value) connectedUser,
  }) {
    return hasCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Loading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(HasCredentials value)? hasCredentials,
    TResult? Function(ConnectedUser value)? connectedUser,
  }) {
    return hasCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Loading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(HasCredentials value)? hasCredentials,
    TResult Function(ConnectedUser value)? connectedUser,
    required TResult orElse(),
  }) {
    if (hasCredentials != null) {
      return hasCredentials(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HasCredentialsImplToJson(
      this,
    );
  }
}

abstract class HasCredentials implements AuthState {
  factory HasCredentials() = _$HasCredentialsImpl;

  factory HasCredentials.fromJson(Map<String, dynamic> json) =
      _$HasCredentialsImpl.fromJson;
}

/// @nodoc
abstract class _$$ConnectedUserImplCopyWith<$Res> {
  factory _$$ConnectedUserImplCopyWith(
          _$ConnectedUserImpl value, $Res Function(_$ConnectedUserImpl) then) =
      __$$ConnectedUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectedUserImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ConnectedUserImpl>
    implements _$$ConnectedUserImplCopyWith<$Res> {
  __$$ConnectedUserImplCopyWithImpl(
      _$ConnectedUserImpl _value, $Res Function(_$ConnectedUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ConnectedUserImpl implements ConnectedUser {
  _$ConnectedUserImpl({final String? $type}) : $type = $type ?? 'connectedUser';

  factory _$ConnectedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectedUserImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.connectedUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectedUserImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() hasCredentials,
    required TResult Function() connectedUser,
  }) {
    return connectedUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function()? authenticated,
    TResult? Function()? hasCredentials,
    TResult? Function()? connectedUser,
  }) {
    return connectedUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? hasCredentials,
    TResult Function()? connectedUser,
    required TResult orElse(),
  }) {
    if (connectedUser != null) {
      return connectedUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Loading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(HasCredentials value) hasCredentials,
    required TResult Function(ConnectedUser value) connectedUser,
  }) {
    return connectedUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(Loading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(HasCredentials value)? hasCredentials,
    TResult? Function(ConnectedUser value)? connectedUser,
  }) {
    return connectedUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Loading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(HasCredentials value)? hasCredentials,
    TResult Function(ConnectedUser value)? connectedUser,
    required TResult orElse(),
  }) {
    if (connectedUser != null) {
      return connectedUser(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectedUserImplToJson(
      this,
    );
  }
}

abstract class ConnectedUser implements AuthState {
  factory ConnectedUser() = _$ConnectedUserImpl;

  factory ConnectedUser.fromJson(Map<String, dynamic> json) =
      _$ConnectedUserImpl.fromJson;
}
