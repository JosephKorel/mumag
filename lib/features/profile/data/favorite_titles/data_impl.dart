import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/features/profile/domain/favorite_titles/data_params.dart';
import 'package:mumag/features/profile/domain/favorite_titles/data_repository.dart';
import 'package:mumag/features/profile/domain/favorite_titles/entity.dart';

final class FavoriteTitlesDataImpl implements FavoriteTitlesDataRepo {
  const FavoriteTitlesDataImpl(this._api);
  final ApiRepository _api;

  static const _basePath = '/favorite-titles';

  @override
  Future<FavoriteTitlesEntity> getFavoriteTitles({
    required FavoriteDataParams params,
  }) async {
    try {
      final request = await _api.get(
        path: _basePath,
        query: params.toMap(),
      );

      return FavoriteTitlesEntity.fromJson(
        request!['data'] as Map<String, dynamic>,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTitle({required FavoriteDataParams params}) async {
    try {
      await _api.put(
        path: '$_basePath/${params.path}',
        params: params.toMap(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> likeTitle({required FavoriteDataParams params}) async {
    try {
      await _api.put(
        path: '$_basePath/${params.path}',
        params: params.toMap(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
