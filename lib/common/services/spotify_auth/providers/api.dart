import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/data/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'api.g.dart';

@riverpod
SpotifyAuthController spotifyAuth(SpotifyAuthRef ref) {
  return SpotifyAuthController();
}

@riverpod
SpotifyApi spotifyApi(SpotifyApiRef ref) {
  final sharedPref = ref.watch(credentialsImplementationProvider);

  return SpotifyApi(sharedPref.retrieveCredentials()!);
}
