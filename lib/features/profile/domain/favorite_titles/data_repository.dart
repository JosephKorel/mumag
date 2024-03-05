import 'package:mumag/features/profile/domain/favorite_titles/data_params.dart';
import 'package:mumag/features/profile/domain/favorite_titles/entity.dart';

abstract interface class FavoriteTitlesDataRepo {
  Future<FavoriteTitlesEntity> getFavoriteTitles(
      {required FavoriteDataParams params});

  Future<void> updateTitle({required FavoriteDataParams params});

  Future<void> likeTitle({required FavoriteDataParams params});
}
