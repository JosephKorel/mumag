import 'package:mumag/common/services/shared_pref/domain/credentials_format.dart';
import 'package:mumag/common/services/shared_pref/domain/credentials_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const credentialsKey = 'credentials';

final class SpotifyApiCredentialsImpl extends SpotifyApiCredentialsRepository {
  SpotifyApiCredentialsImpl(this._sharedPref);

  final SharedPreferences _sharedPref;

  @override
  Future<bool> saveCredentials({required CredentialsFormat credentials}) async {
    return await _sharedPref.setString(credentialsKey, credentials.toJson());
  }

  @override
  CredentialsFormat? retrieveCredentials() {
    final retrievedKey = _sharedPref.getString(credentialsKey);
    return retrievedKey == null
        ? null
        : CredentialsFormat.fromJson(retrievedKey);
  }
}
