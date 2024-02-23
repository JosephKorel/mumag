import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/features/profile/domain/favorite_songs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_songs.g.dart';

@riverpod
SavedSongsUsecase savedSongs(SavedSongsRef ref) {
  final spotify = ref.watch(spotifyApiProvider);
  final localStorage = ref.watch(localDataProvider);
  return SavedSongsUsecase(
    spotify: spotify,
    localStorageUsecase: localStorage,
  );
}

@riverpod
FutureOr<List<String>> getFavoriteSongs(GetFavoriteSongsRef ref) async {
  final spotify = ref.watch(spotifyApiProvider);
  final songs = await spotify.tracks.me.saved.first(10);
  final myList = songs.items!
      .map((e) => {'artists': e.track!.artists, 'name': e.track!.name})
      .toList();

  final first = myList.first;

  return [];
}
