import 'package:collection/collection.dart';
import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/features/profile/data/impl.dart';
import 'package:mumag/features/profile/domain/favorite_params.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';
import 'package:mumag/features/profile/domain/favorite_song/local_impl.dart';
import 'package:mumag/features/profile/domain/usecase_repository.dart';
import 'package:mumag/features/profile/usecase/impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_songs.g.dart';

@riverpod
FavoriteParams songsParams(SongsParamsRef ref) {
  final userId = ref.watch(localUserProvider)!.id;
  return CreateFavoriteParams.songs(userId: userId);
}

@riverpod
FavoriteDatasource favDatasource(FavDatasourceRef ref) {
  final api = ref.watch(apiProvider);

  return FavoriteDatasource(api);
}

@riverpod
FavoritesRepository favSongsImpl(FavSongsImplRef ref) {
  final datasource = ref.watch(favDatasourceProvider);
  return FavoriteSongUsecaseImpl(datasource);
}

@riverpod
FavoriteSongUsecase songsUsecase(SongsUsecaseRef ref) {
  final impl = ref.watch(favSongsImplProvider);
  return FavoriteSongUsecase(impl);
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
Future<bool> saveSongs(
  SaveSongsRef ref, {
  required List<SingleTrack> songs,
}) async {
  final createParams = ref
      .read(songsParamsProvider)
      .addData(songs.mapIndexed((i, e) => SingleTrack.toMap(e, i)).toList());

  final result = await ref
      .read(songsUsecaseProvider)
      .createMany(
        params: createParams,
      )
      .run();

  return result.fold((l) {
    ref.read(toastMessageProvider.notifier).onException(exception: l);

    return false;
  }, (r) {
    ref.read(localFavSongsProvider).setSongs(songs);
    ref.invalidate(userSongsProvider);

    return true;
  });
}
