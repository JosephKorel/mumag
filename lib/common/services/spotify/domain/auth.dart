import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

const accessToken =
    'BQCqgzzotKejE0I0H4jPEipwVTmtzKCRJk-uILuxiejZi1msvNMMFzePb3_nnhZcPFzNeNdHeJmyMIuVmGQmvR0HbFVoCaWavh48s_CGeaoZH-w097rxb-NkYpmG5o4KxaqsnUeRDlzNEcf3P62POoAYn9Rz2CuCySqXL1DuLZMJ0fDLyPtY4TdYG_1ei6n0gNiBpUSVYOw3XtSJ2haxjMf-dMRA_1PYcBfBzs-1D87AEMui28tqRyvl9abSiJOguDED316BCY8yzRWGgRuqt7gs';
const refreshToken =
    'AQABDDVOSnWYUuCWLkAVEc065ryGILVqwJxml3QK6sCr8dK1roNkATcZeArrPIbZgDHed2NV8SB6AVRNGu3_-6tyEm8Heh2MNp4cj5F9hzmDP0BEGfzrcDFIr_jHaho2OvI';

final class SpotifyAuthController {
  static const url = 'mumag.music.app://callback';

  static final clientId = dotenv.env['SPOTIFY_CLIENT_ID']!;
  static final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET']!;

  static const scope =
      'playlist-modify-public,playlist-modify-private,playlist-read-private,user-read-recently-played,user-top-read,user-library-read,user-library-modify,user-read-private';

  SpotifyApiCredentials get baseCredentials => SpotifyApiCredentials(
        clientId,
        clientSecret,
        accessToken: accessToken,
        refreshToken: refreshToken,
        scopes: scope.split(','),
      );

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

  Future<SpotifyApiCredentials> authenticate() async {
    try {
      SpotifyOAuth2Client client = SpotifyOAuth2Client(
        customUriScheme: 'mumag.music.app',
        redirectUri: 'mumag.music.app://callback',
      );

      final authResp = await client.requestAuthorization(
          clientId: clientId,
          customParams: {'show_dialog': 'true'},
          scopes: scope.split(','));

      final accessToken = await client.requestAccessToken(
        code: authResp.code.toString(),
        clientId: clientId,
        clientSecret: clientSecret,
      );

      log('ACCESS TOKEN IS ${accessToken.accessToken}');
      log('REFRESH TOKEN IS ${accessToken.refreshToken}');

      return SpotifyApiCredentials(
        clientId,
        clientSecret,
        accessToken: accessToken.accessToken,
        refreshToken: accessToken.refreshToken,
        expiration: accessToken.expirationDate,
        scopes: scope.split(','),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> connectRemote() async {
    try {
      return await SpotifySdk.connectToSpotifyRemote(
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
