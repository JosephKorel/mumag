import 'dart:developer';

import 'package:spotify/spotify.dart';

final class SpotifyProfileImplementation {
  SpotifyProfileImplementation(this._api);

  final SpotifyApi _api;

  Me get _me => _api.me;

  @override
  Future<void> getLastAlbums() async {
    try {
      final lastPlayed = await _me.recentlyPlayed(limit: 20).getPage(20);
      if (lastPlayed.items == null) {
        throw Error();
      }
      for (var element in lastPlayed.items!) {
        if (element.track == null) {
          continue;
        }
        log(element.track!.type.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
