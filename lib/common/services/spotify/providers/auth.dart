import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify/providers/api.dart';
import 'package:mumag/common/services/spotify/providers/credentials.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

part 'auth.g.dart';

@riverpod
Future<bool> connectSpotify(ConnectSpotifyRef ref) async {
  final authController = ref.watch(spotifyAuthProvider);

  try {
    final connected = await authController.connectRemote();
    /* final token = await authController.connect();
    log(token); */
    return connected;
  } catch (e) {
    return false;
  }
}

@riverpod
class SpotifyClient extends _$SpotifyClient {
  @override
  SpotifyApiCredentials build() {
    return ref.watch(spotifyAuthProvider).baseCredentials;
  }

  Future<void> updateCredentials() async {
    try {
      final newCredentials = await ref.read(spotifyAuthProvider).authenticate();

      if (newCredentials.accessToken != null) {
        final spotifyCredentials =
            await SpotifyApi(newCredentials).getCredentials();

        ref.read(credentialsImplementationProvider).saveCredentials(
              credentials: spotifyCredentials,
            );
      }

      ref.invalidate(credentialsControllerProvider);
      state = newCredentials;
    } catch (e) {
      rethrow;
    }
  }

  void update({required SpotifyApiCredentials credentials}) {
    state = credentials;
  }
}

@riverpod
Stream<ConnectionStatus> capabilities(CapabilitiesRef ref) {
  return SpotifySdk.subscribeConnectionStatus();
}

/* @riverpod
Stream<ConnectionStatus> spotifyPermissions(
    SpotifyPermissionsRef ref) async {
  final hasConnected = await ref.watch(connectSpotifyProvider.future);

  return SpotifySdk.subscribeConnectionStatus();
}
 */