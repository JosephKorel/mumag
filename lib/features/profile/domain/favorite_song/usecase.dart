import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/features/profile/data/impl.dart';
import 'package:mumag/features/profile/domain/data_repository.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';

final class FavoriteSongUsecaseImpl implements FavoritesRepository {
  const FavoriteSongUsecaseImpl(this._impl);
  final FavoriteRepositoryImpl _impl;

  @override
  ApiResult<void> createMany({required Map<String, dynamic> params}) {
    return TaskEither.tryCatch(
      () => _impl.createMany(params: params),
      (error, stackTrace) => CreateFavSongException(error: error),
    );
  }

  @override
  ApiResult<List<T>> findMany<T>({required int userId}) {
    return TaskEither.tryCatch(
      () => _impl.findMany<T>(userId: userId),
      (error, stackTrace) => CreateFavSongException(error: error),
    );
  }
}

final class FavoriteSongUsecase {
  const FavoriteSongUsecase(this._usecaseImpl);
  final FavoritesRepository _usecaseImpl;

  ApiResult<void> createMany({required Map<String, dynamic> params}) =>
      _usecaseImpl.createMany(params: params);

  ApiResult<List<SingleTrack>> findMany({required int userId}) =>
      _usecaseImpl.findMany<SingleTrack>(userId: userId);
}
