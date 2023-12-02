import 'package:spotify/spotify.dart';

class ProfileInteractor {
  ProfileInteractor({required this.spotify});

  final SpotifyApi spotify;

  Future<List<String>> favoriteGenres() async {
    final recentlyPlayed = await spotify.me.recentlyPlayed(limit: 40).all();
    final topArtists = await spotify.me.topArtists().all();
    final foundArtists = <String>[];
    final artistsIdList = <String>[];
    final retrievedGenres = <String>[];

    for (final artist in topArtists) {
      if (artist.genres == null) {
        continue;
      }

      final genreList =
          artist.genres!.map<String?>((e) => e).whereType<String>().toList();
      retrievedGenres.addAll(genreList);
    }
/* 
    for (final e in recentlyPlayed) {
      final artists = e.track?.artists;

      if (artists == null) {
        continue;
      }

      if (foundArtists
          .any((element) => artists.map((e) => e.name!).contains(element))) {
        continue;
      }

      final foundGenres = artists
          .map<String?>((e) {
            if (e.name != null) {
              foundArtists.add(e.name!);
            }
            return e.id;
          })
          .whereType<String>()
          .toList();

      artistsIdList.addAll(foundGenres);
    }

    final artists = await spotify.artists.list(artistsIdList);
    final genres = artists
        .map<List<String>?>(
          (e) => e.genres,
        )
        .whereType<List<String>>()
        .expand(
          (element) => element,
        )
        .toList(); */

    return mostCommonGenres(retrievedGenres);
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
