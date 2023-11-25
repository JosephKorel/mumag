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
  // final token = ref.watch(spotifyUserTokenProvider)!;
  return SpotifyApi.withAccessToken(
      'BQCwPuJ8plh1CJlQgcVWKYE6nxCfJ8TIxnYZsSWzg7z84NjA7hF9LQ4aWw3OibWHs_9DNKIvZc1vcg5wY_Q6UDuLbVAsclj1z3tcB2m7yXhM58eY9X16LEFZjxAKYpmEs0NX1m7B_1nZmg98-wfxi9daY0qVX7VahbRUiSICWDIToIKNpKCwyvZto5-VtghtjuZn6jIE9Zk4IFgHrk7wCCYGz_B88kdR6z7TcLnzsBkPKOZyxdEVykU4si-fCSwk_cIm6JTt8X6imV4pOLqoeg');
}
