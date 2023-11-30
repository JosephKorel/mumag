import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify/spotify.dart';

final class CredentialsAdapter {
  static final clientId = dotenv.env['SPOTIFY_CLIENT_ID']!;
  static final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET']!;

  static SpotifyApiCredentials fromJson(String key) {
    final map = json.decode(key);

    return SpotifyApiCredentials(
      clientId,
      clientSecret,
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
      expiration: DateTime.parse(map['expiration']),
      scopes: List.from(map['scopes'] as List<dynamic>)
          .map(
            (e) => e.toString(),
          )
          .toList(),
    );
  }

  static Map<String, dynamic> toMap(
      {required SpotifyApiCredentials credentials}) {
    return {
      'accessToken': credentials.accessToken,
      'refreshToken': credentials.refreshToken,
      'scopes': credentials.scopes,
      'expiration': credentials.expiration.toString()
    };
  }

  static String toJson({required SpotifyApiCredentials credentials}) {
    return jsonEncode(toMap(credentials: credentials));
  }
}
