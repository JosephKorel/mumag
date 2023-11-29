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

/* @freezed
sealed class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    @Default(false) bool authenticated,
    @Default(false) bool hasSpotifyPermissions,
    @Default('') String spotifyToken,
    @Default(true) isLoading,
  }) = _AuthEntity;

  factory AuthEntity.hasPermissions() =>
      AuthEntity.authenticated().copyWith(hasSpotifyPermissions: true);

  factory AuthEntity.hasToken({required String token}) =>
      AuthEntity.hasPermissions().copyWith(spotifyToken: token);

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthEntityFromJson(json);
}
 */