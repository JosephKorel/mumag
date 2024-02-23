import 'package:mumag/common/models/media/track.dart';
import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/features/profile/data/favorite_songs.dart';
import 'package:mumag/features/profile/domain/favorite_songs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_songs.g.dart';

@riverpod
FavoriteSongsLocal savedSongs(SavedSongsRef ref) {
  final spotify = ref.watch(spotifyApiProvider);
  final localStorage = ref.watch(localDataProvider);
  return FavoriteSongsLocal(
    spotify: spotify,
    localStorageUsecase: localStorage,
  );
}

@riverpod
FavoriteSongsImpl favoriteSongsImpl(FavoriteSongsImplRef ref) {
  final api = ref.watch(apiProvider);
  return FavoriteSongsImpl(api);
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

@riverpod
FavoriteSongsUsecase favoriteSongsUsecase(FavoriteSongsUsecaseRef ref) {
  final favSongsLocal = ref.watch(savedSongsProvider);
  final favSongsImpl = ref.watch(favoriteSongsImplProvider);
  return FavoriteSongsUsecase(favSongsImpl, favSongsLocal);
}

@riverpod
class FavoriteTracksOffset extends _$FavoriteTracksOffset {
  @override
  int build() {
    return 0;
  }
}

@riverpod
List<SavedTrack> userFavoriteTracks(UserFavoriteTracksRef ref) {
  final favSongsLocal = ref.watch(savedSongsProvider);

  return favSongsLocal.getTracksFromStorage();
}

@riverpod
FutureOr<void> getUserFavTracks(GetUserFavTracksRef ref) async {
  final offset = ref.watch(favoriteTracksOffsetProvider);
  final result = await ref
      .watch(favoriteSongsUsecaseProvider)
      .getFavoriteSongs(offset)
      .run();

  result.fold((l) => null, (r) => ref.invalidate(userFavoriteTracksProvider));
}
