import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/services/shared_pref/domain/credentials_repo.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:spotify/spotify.dart';

class SpotifyMock extends Mock implements SpotifyApi {}

class SpotifyApiCredentialsMock extends Mock
    implements SpotifyApiCredentialsRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  ProviderContainer createContainer({
    ProviderContainer? parent,
    List<Override> overrides = const [],
    List<ProviderObserver>? observers,
  }) {
    final container = ProviderContainer(
      parent: parent,
      overrides: overrides,
      observers: observers,
    );

    addTearDown(container.dispose);

    return container;
  }

  group('Tests for spotify provider', () {
    test('Spotify Api provider is a SpotifyApi type', () {
      final listener = Listener<SpotifyApi>();

      final container = createContainer(
        overrides: [
          credentialsImplementationProvider.overrideWith(
            (ref) => SpotifyApiCredentialsMock(),
          ),
          spotifyApiProvider.overrideWith(
            (ref) => SpotifyApi(SpotifyApiCredentials('', '')),
          ),
        ],
      )..listen<SpotifyApi>(
          spotifyApiProvider,
          listener.call,
          fireImmediately: true,
        );

      expect(container.read(spotifyApiProvider), isA<SpotifyApi>());
    });

    /* test(
        'Spotify Api gets called again when invalidating credentials impl provider',
        () {
      final listener = Listener<SpotifyApi>();

      final credentialsMock = SpotifyApiCredentialsMock();

      final initialSpotifyValue = SpotifyApi(SpotifyApiCredentials('', ''));

      final container = createContainer(
        overrides: [
          credentialsImplementationProvider.overrideWith(
            (ref) => credentialsMock,
          ),
          spotifyApiProvider.overrideWith(
            (ref) => initialSpotifyValue,
          ),
        ],
      )..listen<SpotifyApi>(
          spotifyApiProvider,
          listener.call,
          fireImmediately: true,
        );

      verify(
        () => listener(null, initialSpotifyValue),
      );

      when(
        credentialsMock.retrieveCredentials,
      ).thenAnswer(
        (invocation) => SpotifyApiCredentials('1', '2'),
      );

      // container.invalidate(credentialsImplementationProvider);

      container.invalidate(spotifyApiProvider);

      verify(
        () => listener(
          initialSpotifyValue,
          SpotifyApi(SpotifyApiCredentials('1', '2')),
        ),
      );
    }); */
  });
}
