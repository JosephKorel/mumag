import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/shared_pref/usecase/local_data.dart';
import 'package:mumag/features/profile/domain/favorite_titles/entity.dart';

final class FavoriteTitlesLocal {
  const FavoriteTitlesLocal(this._localStorage);

  final LocalStorageUsecase _localStorage;

  static const _key = 'favoriteTitles';

  FavoriteTitlesEntity getFavoriteTitles() {
    final document = _localStorage.getString<Map<String, dynamic>>(key: _key);
    return document == null
        ? FavoriteTitlesEntity.initialValue()
        : FavoriteTitlesEntity.fromJson(document);
  }

  ApiResult<void> setFavoriteTitles({
    required FavoriteTitlesEntity favoriteTitles,
  }) {
    return TaskEither.tryCatch(
      () async => _localStorage.setString(
        key: _key,
        value: jsonEncode(favoriteTitles.toJson()),
      ),
      (error, stackTrace) => FailedToSaveFavException(error: error),
    );
  }
}
