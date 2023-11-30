import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'credentials.g.dart';

@riverpod
class CredentialsController extends _$CredentialsController {
  @override
  SpotifyApiCredentials? build() {
    final sharedPref = ref.watch(credentialsImplementationProvider);

    return sharedPref.retrieveCredentials();
  }
}
