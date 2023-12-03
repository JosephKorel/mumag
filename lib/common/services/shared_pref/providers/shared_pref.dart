import 'package:mumag/common/services/shared_pref/data/credentials_impl.dart';
import 'package:mumag/common/services/shared_pref/domain/credentials_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref.g.dart';

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

@riverpod
SpotifyApiCredentialsRepository credentialsImplementation(
  CredentialsImplementationRef ref,
) {
  return SpotifyApiCredentialsImpl(
    ref.watch(
      sharedPreferencesProvider,
    ),
  );
}
