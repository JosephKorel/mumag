import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/features/profile/domain/favorite_titles/data_params.dart';
import 'package:mumag/features/profile/domain/favorite_titles/entity.dart';

abstract interface class FavoriteTitlesUsecaseRepo {
  ApiResult<FavoriteTitlesEntity> getFavoriteTitles({
    required FavoriteDataParams params,
  });

  ApiResult<void> updateTitle({required FavoriteDataParams params});

  ApiResult<void> likeTitle({required FavoriteDataParams params});
}
