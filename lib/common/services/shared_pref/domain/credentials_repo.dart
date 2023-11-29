import 'package:spotify/spotify.dart';

abstract class SpotifyApiCredentialsRepository {
  Future<bool> saveCredentials({required SpotifyApiCredentials credentials});

  SpotifyApiCredentials? retrieveCredentials();
}
