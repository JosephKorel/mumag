import 'package:mumag/common/services/spotify/domain/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'api.g.dart';

@riverpod
SpotifyAuthController spotifyAuth(SpotifyAuthRef ref) {
  return SpotifyAuthController();
}

@riverpod
class SpotifyUserToken extends _$SpotifyUserToken {
  @override
  String? build() {
    return null;
  }

  void updateToken({required String token}) => state = token;
}

@riverpod
SpotifyApi spotifyApi(SpotifyApiRef ref) {
  final token = ref.watch(spotifyUserTokenProvider)!;
  return SpotifyApi.withAccessToken(token);
}