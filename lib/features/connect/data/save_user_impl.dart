import 'package:mumag/features/connect/domain/save_user_repo.dart';
import 'package:spotify/spotify.dart';

class SaveUserImpl extends SaveUserRepository {
  SaveUserImpl(this._spotify);

  final SpotifyApi _spotify;

  @override
  Future<User> spotifyUser() async {
    try {
      final user = await _spotify.me.get();
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getProfileBackground() async {
    try {
      final lastSavedAlbum = await _spotify.me.savedAlbums().first(1);
      if (lastSavedAlbum.items == null) {
        return null;
      }
      final images = lastSavedAlbum.items!.first.images;

      return images?[0].url;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<String>> favoriteGenres() async {
    try {
      final topArtists = await _spotify.me.topArtists().all();
      final retrievedGenres = <String>[];

      for (final artist in topArtists) {
        if (artist.genres == null) {
          continue;
        }

        final genreList =
            artist.genres!.map<String?>((e) => e).whereType<String>().toList();
        retrievedGenres.addAll(genreList);
      }

      return mostCommonGenres(retrievedGenres);
    } catch (e) {
      rethrow;
    }
  }
}

List<String> mostCommonGenres(List<String> allGenres) {
  final genreMap = <String, int>{};

  for (final genre in allGenres) {
    genreMap[genre] = (genreMap[genre] ?? 0) + 1;
  }

  final validGenres = Map<String, int>.fromEntries(
    genreMap.entries.toList()
      ..sort(
        (a, b) => b.value.compareTo(a.value),
      ),
  ).keys.toList();

  return validGenres.sublist(0, 5);
}
