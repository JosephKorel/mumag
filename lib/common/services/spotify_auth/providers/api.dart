import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/data/auth.dart';
import 'package:mumag/common/services/spotify_auth/data/auth_impl.dart';
import 'package:mumag/common/services/spotify_auth/domain/auth_repository.dart';
import 'package:mumag/common/services/spotify_auth/domain/credentials.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'api.g.dart';

@riverpod
SpotifyAuthRepository spotifyAuth(SpotifyAuthRef ref) {
  return SpotifyAuthImpl();
}

@riverpod
SpotifyAuthController spotifyAuthController(SpotifyAuthControllerRef ref) {
  return SpotifyAuthController(ref.watch(spotifyAuthProvider));
}

@riverpod
SpotifyApi spotifyApi(SpotifyApiRef ref) {
  final credentials =
      ref.watch(credentialsImplementationProvider).retrieveCredentials();

  return SpotifyApi(
    credentials ??
        SpotifyApiCredentials(
          CredentialsAdapter.clientId,
          CredentialsAdapter.clientSecret,
        ),
  );
}
