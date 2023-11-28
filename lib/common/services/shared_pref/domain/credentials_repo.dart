import 'package:mumag/common/services/shared_pref/domain/credentials_format.dart';

abstract class SpotifyApiCredentialsRepository {
  Future<bool> saveCredentials({required CredentialsFormat credentials});

  CredentialsFormat? retrieveCredentials();
}
