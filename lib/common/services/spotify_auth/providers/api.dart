import 'package:mumag/common/services/spotify_auth/data/auth.dart';
import 'package:mumag/common/services/spotify_auth/domain/credentials.dart';
import 'package:mumag/common/services/spotify_auth/providers/credentials.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'api.g.dart';

@riverpod
SpotifyAuthController spotifyAuth(SpotifyAuthRef ref) {
  return SpotifyAuthController();
}

@riverpod
SpotifyApi spotifyApi(SpotifyApiRef ref) {
  final credentialsProvider = ref.watch(credentialsControllerProvider);

  return SpotifyApi(
    credentialsProvider ??
        SpotifyApiCredentials(
          CredentialsAdapter.clientId,
          CredentialsAdapter.clientSecret,
        ),
  );
}
