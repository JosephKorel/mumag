import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/features/profile/domain/favorite_params.dart';
import 'package:mumag/features/profile/domain/usecase_repository.dart';

class FavoriteDatasource {
  const FavoriteDatasource(this._api);

  final ApiRepository _api;

  static const _path = '/favorite';

  Future<void> createMany({
    required FavoriteParams params,
  }) async {
    try {
      await _api.post(path: '$_path/${params.subPath}', params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<T>> findMany<T>({
    required FavoriteParams params,
  }) async {
    try {
      final baseClass = BaseFromJson<T>();
      final result = await _api.get(
        path: '$_path/${params.subPath}',
        query: params.toMap(),
      );
      final myList = result!['data'] as List<dynamic>;
      return myList
          .map((e) => baseClass.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
