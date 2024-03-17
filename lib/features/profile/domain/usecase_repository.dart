import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/features/profile/domain/favorite_params.dart';

interface class BaseFromJson<T> {
  T fromJson(Map<String, dynamic> json) => throw UnimplementedError();
}

abstract interface class FavoritesRepository {
  ApiResult<void> createMany({required FavoriteParams params});

  ApiResult<List<T>> findMany<T>({required FavoriteParams params});
}
