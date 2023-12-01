import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:spotify/spotify.dart';

class SpotifyMock extends Mock implements SpotifyApi {}

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
    test('Spotify Api provider should return SpotifyApi type', () {
      final container = createContainer(
        overrides: [
          spotifyApiProvider.overrideWith(
            (ref) => SpotifyMock(),
          ),
        ],
      );

      expect(container.read(spotifyApiProvider), isA<SpotifyApi>());
    });
  });
}
