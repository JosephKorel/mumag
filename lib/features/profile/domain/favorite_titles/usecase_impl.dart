import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/features/profile/domain/favorite_titles/data_params.dart';
import 'package:mumag/features/profile/domain/favorite_titles/data_repository.dart';
import 'package:mumag/features/profile/domain/favorite_titles/entity.dart';
import 'package:mumag/features/profile/domain/favorite_titles/usecase_repository.dart';

final class FavoriteTitlesUsecaseImpl implements FavoriteTitlesUsecaseRepo {
  const FavoriteTitlesUsecaseImpl(this._repo);
  final FavoriteTitlesDataRepo _repo;

  @override
  ApiResult<FavoriteTitlesEntity> getFavoriteTitles({
    required FavoriteDataParams params,
  }) {
    return TaskEither.tryCatch(
      () => _repo.getFavoriteTitles(params: params),
      (error, stackTrace) => GetFavTitlesException(error: error),
    );
  }

  @override
  ApiResult<void> updateTitle({required FavoriteDataParams params}) {
    return TaskEither.tryCatch(
      () => _repo.updateTitle(params: params),
      (error, stackTrace) => GetFavTitlesException(error: error),
    );
  }

  @override
  ApiResult<void> likeTitle({required FavoriteDataParams params}) {
    return TaskEither.tryCatch(
      () => _repo.likeTitle(params: params),
      (error, stackTrace) => GetFavTitlesException(error: error),
    );
  }
}

final class FavoriteTitlesUsecase {
  const FavoriteTitlesUsecase(this._repo);

  final FavoriteTitlesUsecaseRepo _repo;

  ApiResult<FavoriteTitlesEntity> getFavoriteTitles({
    required FavoriteDataParams params,
  }) {
    return _repo.getFavoriteTitles(params: params);
  }

  ApiResult<void> updateTitle({required FavoriteDataParams params}) {
    return _repo.updateTitle(params: params);
  }

  ApiResult<void> likeTitle({required FavoriteDataParams params}) {
    return _repo.likeTitle(params: params);
  }
}
