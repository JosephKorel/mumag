import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/features/profile/data/impl.dart';
import 'package:mumag/features/profile/domain/favorite_params.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';
import 'package:mumag/features/profile/domain/usecase_repository.dart';

final class FavoriteSongUsecaseImpl implements FavoritesRepository {
  const FavoriteSongUsecaseImpl(this._impl);
  final FavoriteDatasource _impl;

  @override
  ApiResult<void> createMany({required FavoriteParams params}) {
    return TaskEither.tryCatch(
      () => _impl.createMany(params: params),
      (error, stackTrace) => CreateFavSongException(error: error),
    );
  }

  @override
  ApiResult<List<T>> findMany<T>({required FavoriteParams params}) {
    return TaskEither.tryCatch(
      () => _impl.findMany<T>(params: params),
      (error, stackTrace) => GetFavSongException(error: error),
    );
  }
}

final class FavoriteSongUsecase {
  const FavoriteSongUsecase(this._usecaseImpl);
  final FavoritesRepository _usecaseImpl;

  ApiResult<void> createMany({required FavoriteParams params}) =>
      _usecaseImpl.createMany(params: params);

  ApiResult<List<SingleTrack>> findMany({required FavoriteParams params}) =>
      _usecaseImpl.findMany<SingleTrack>(params: params);
}
