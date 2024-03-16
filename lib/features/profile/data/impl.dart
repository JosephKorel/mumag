import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/features/profile/domain/data_repository.dart';

base class FavoriteRepositoryImpl {
  const FavoriteRepositoryImpl(this._api);

  final ApiRepository _api;

  static const _path = '/favorite';

  String get path => _path;

  Future<void> createMany({
    required Map<String, dynamic> params,
  }) async {
    try {
      await _api.post(path: path, params: params);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<T>> findMany<T>({
    required int userId,
  }) async {
    try {
      final baseClass = BaseFromJson<T>();
      final result = await _api.get(path: path, query: {'userId': userId});
      final myList = result!['data'] as List<dynamic>;
      return myList
          .map((e) => baseClass.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
