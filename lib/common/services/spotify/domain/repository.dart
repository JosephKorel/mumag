import 'package:spotify/spotify.dart';

abstract base class SpotifyProfileRepository {
  Future<List<Album>> getLastAlbums();
}

abstract base class SpotifyApiRepository {
  Future<Album> fetchAlbum();
}
