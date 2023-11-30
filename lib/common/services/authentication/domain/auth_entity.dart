import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';
part 'auth_entity.g.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState() = _AuthState;

  factory AuthState.unauthenticated() = Unauthenticated;

  factory AuthState.loading() = Loading;

  factory AuthState.authenticated() = Authenticated;

  factory AuthState.hasCredentials() = HasCredentials;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
