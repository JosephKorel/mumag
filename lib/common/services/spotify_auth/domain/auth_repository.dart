import 'package:spotify/spotify.dart';

abstract class SpotifyAuthRepository {
  Future<SpotifyApiCredentials> authenticate();
}
