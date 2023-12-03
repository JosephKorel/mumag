import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify/spotify.dart';

final class CredentialsAdapter {
  static final clientId = dotenv.env['SPOTIFY_CLIENT_ID']!;
  static final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET']!;

  static SpotifyApiCredentials fromJson(String key) {
    final map = json.decode(key) as Map<String, dynamic>;

    return SpotifyApiCredentials(
      clientId,
      clientSecret,
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
      expiration: DateTime.parse(map['expiration'] as String),
      scopes: List<String>.from(map['scopes'] as List<dynamic>)
          .map(
            (e) => e,
          )
          .toList(),
    );
  }

  static Map<String, dynamic> toMap({
    required SpotifyApiCredentials credentials,
  }) {
    return {
      'accessToken': credentials.accessToken,
      'refreshToken': credentials.refreshToken,
      'scopes': credentials.scopes,
      'expiration': credentials.expiration.toString(),
    };
  }

  static String toJson({required SpotifyApiCredentials credentials}) {
    return jsonEncode(toMap(credentials: credentials));
  }
}
