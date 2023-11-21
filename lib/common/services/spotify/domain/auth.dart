import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

final class SpotifyAuthController {
  static const url = 'https://mumagweb.com/auth';

  static const scope =
      'playlist-modify-public,playlist-modify-private,playlist-read-private,user-read-recently-played,user-top-read,user-library-read,user-library-modify';

  Future<String> connect() async {
    try {
      return await SpotifySdk.getAccessToken(
        clientId: dotenv.env['SPOTIFY_CLIENT_ID']!,
        redirectUrl: url,
        scope: scope,
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream<ConnectionStatus> connectionStatus() {
    return SpotifySdk.subscribeConnectionStatus();
  }
}
