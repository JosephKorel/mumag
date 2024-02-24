import 'package:mumag/common/models/types/api_types.dart';

interface class BaseFromJson<T> {
  T fromJson(Map<String, dynamic> json) => throw UnimplementedError();
}

abstract interface class FavoritesRepository {
  ApiResult<void> createMany({required Map<String, dynamic> params});

  ApiResult<List<T>> findMany<T>({required int userId});
}
