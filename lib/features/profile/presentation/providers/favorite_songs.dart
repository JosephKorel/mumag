import 'package:collection/collection.dart';
import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/features/profile/data/favorite_song/data_impl.dart';
import 'package:mumag/features/profile/data/impl.dart';
import 'package:mumag/features/profile/domain/data_repository.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';
import 'package:mumag/features/profile/domain/favorite_song/local_impl.dart';
import 'package:mumag/features/profile/domain/favorite_song/usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_songs.g.dart';

@riverpod
FavoriteRepositoryImpl favSongsImpl(FavSongsImplRef ref) {
  final api = ref.watch(apiProvider);
  return FavoriteSongImpl(api);
}

@riverpod
LocalFavoriteSongs localFavSongs(LocalFavSongsRef ref) {
  final instance = ref.watch(localDataProvider);
  return LocalFavoriteSongs(instance);
}

@riverpod
List<SingleTrack> userSongs(UserSongsRef ref) {
  return ref.watch(localFavSongsProvider).getSongs();
}

@riverpod
FavoriteRepositoryImpl songsImpl(SongsImplRef ref) {
  final api = ref.watch(apiProvider);
  return FavoriteSongImpl(api);
}

@riverpod
FavoritesRepository songsRepository(SongsRepositoryRef ref) {
  final impl = ref.watch(songsImplProvider);
  return FavoriteSongUsecaseImpl(impl);
}

@riverpod
FavoriteSongUsecase songsUsecase(SongsUsecaseRef ref) {
  final impl = ref.watch(songsRepositoryProvider);
  return FavoriteSongUsecase(impl);
}

@riverpod
FutureOr<List<SingleTrack>> userFavSongs(UserFavSongsRef ref) async {
  final user = ref.watch(localUserProvider)!;
  final songs =
      await ref.watch(songsUsecaseProvider).findMany(userId: user.id).run();

  return songs.fold((l) {
    ref.read(toastMessageProvider.notifier).onException(exception: l);

    return [];
  }, (r) {
    ref.read(localFavSongsProvider).setSongs(r);
    ref.invalidate(userSongsProvider);
    return r;
  });
}

@riverpod
Future<bool> saveSongs(
  SaveSongsRef ref, {
  required List<SingleTrack> songs,
}) async {
  final result = await ref.read(songsUsecaseProvider).createMany(
    params: {
      'data': songs.mapIndexed((i, e) => SingleTrack.toMap(e, i)).toList(),
    },
  ).run();

  return result.fold((l) {
    ref.read(toastMessageProvider.notifier).onException(exception: l);

    return false;
  }, (r) {
    ref.read(localFavSongsProvider).setSongs(songs);
    ref.invalidate(userSongsProvider);

    return true;
  });
}
