import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mumag/common/services/shared_pref/domain/credentials_repo.dart';
import 'package:mumag/common/services/spotify_auth/domain/credentials.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/spotify.dart';

const credentialsKey = 'credentials';

final class SpotifyApiCredentialsImpl extends SpotifyApiCredentialsRepository {
  SpotifyApiCredentialsImpl(this._sharedPref);

  final SharedPreferences _sharedPref;

  static final clientId = dotenv.env['SPOTIFY_CLIENT_ID']!;
  static final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET']!;

  @override
  Future<bool> saveCredentials({
    required SpotifyApiCredentials credentials,
  }) async {
    return _sharedPref.setString(
      credentialsKey,
      CredentialsAdapter.toJson(
        credentials: credentials,
      ),
    );
  }

  @override
  SpotifyApiCredentials? retrieveCredentials() {
    final retrievedKey = _sharedPref.getString(credentialsKey);

    if (retrievedKey != null) {
      return CredentialsAdapter.fromJson(retrievedKey);
    }
    return null;
  }

  void deleteCredentials() {
    _sharedPref.remove(credentialsKey);
  }
}
