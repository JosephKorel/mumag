import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/services/shared_pref/data/credentials_impl.dart';
import 'package:mumag/common/services/shared_pref/domain/credentials_format.dart';
import 'package:mumag/common/services/shared_pref/domain/credentials_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final fakeCredentials = CredentialsFormat(
  accessToken: '123',
  refreshToken: '456',
  scopes: ['scope'],
);

class MockSpotifyApiCredentialsRepo extends Mock
    implements SpotifyApiCredentialsRepository {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  late SpotifyApiCredentialsImpl credentialsImpl;

  group('Shared Prefences test', () {
    test('Test to insert credentials', () async {
      final sharedPreferences = await SharedPreferences.getInstance();

      credentialsImpl = SpotifyApiCredentialsImpl(sharedPreferences);

      await credentialsImpl.saveCredentials(credentials: fakeCredentials);
      final insertedCredentials = CredentialsFormat.fromJson(
          sharedPreferences.getString('credentials')!);

      expect(insertedCredentials.accessToken, '123');
    });

    test('Should receive null when there is no credentials saved', () async {
      final sharedPreferences = await SharedPreferences.getInstance();

      await sharedPreferences.clear();

      credentialsImpl = SpotifyApiCredentialsImpl(sharedPreferences);

      final result = credentialsImpl.retrieveCredentials();

      // assert
      expect(result, null);
    });

    test('Insert credentials and retrieve it', () async {
      final sharedPreferences = await SharedPreferences.getInstance();

      credentialsImpl = SpotifyApiCredentialsImpl(sharedPreferences);

      await credentialsImpl.saveCredentials(credentials: fakeCredentials);

      final result = credentialsImpl.retrieveCredentials();

      // assert
      expect(result, isA<CredentialsFormat>());
    });
  });
}
