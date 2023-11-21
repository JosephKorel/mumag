/* import 'dart:developer';

import 'package:spotify_sdk/spotify_sdk.dart';

final class SpotifyProfileImplementation {
  SpotifyProfileImplementation();

  @override
  Future<void> getLastAlbums() async {
    try {
      final lastPlayed =
          await SpotifySdk.getLibraryState(spotifyUri: spotifyUri);

      log(element.track!.type.toString());
    } catch (e) {
      rethrow;
    }
  }
}
 */