import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:spotify/spotify.dart';

final class SpotifyAuthController {
  static const url = 'mumag.music.app://callback';

  static final clientId = dotenv.env['SPOTIFY_CLIENT_ID']!;
  static final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET']!;

  static const scope =
      'playlist-modify-public,playlist-modify-private,playlist-read-private,user-read-recently-played,user-top-read,user-library-read,user-library-modify,user-read-private';

  Future<SpotifyApiCredentials> authenticate() async {
    try {
      final client = SpotifyOAuth2Client(
        customUriScheme: 'mumag.music.app',
        redirectUri: 'mumag.music.app://callback',
      );

      final authResp = await client.requestAuthorization(
        clientId: clientId,
        customParams: {'show_dialog': 'true'},
        scopes: scope.split(','),
      );

      final accessToken = await client.requestAccessToken(
        code: authResp.code.toString(),
        clientId: clientId,
        clientSecret: clientSecret,
        scopes: scope.split(','),
      );

      return SpotifyApiCredentials(
        clientId,
        clientSecret,
        accessToken: accessToken.accessToken,
        refreshToken: accessToken.refreshToken,
        expiration: accessToken.expirationDate,
        scopes: accessToken.scope,
      );
    } catch (e) {
      rethrow;
    }
  }
}
