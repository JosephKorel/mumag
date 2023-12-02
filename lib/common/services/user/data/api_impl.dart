import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';

final class UserApiUsecase extends UserApiUsecaseRepository {
  UserApiUsecase(this._api);

  final ApiRepository _api;

  static const _path = '/user';

  @override
  ApiResult<UserEntity> insertUser({required InsertParams insertParams}) {
    return TaskEither.tryCatch(() async {
      final result = await _api.post(
        path: _path,
        params: insertParams.toMap(),
      );

      return UserEntity.fromJson(result);
    }, (o, s) {
      return ApiException(error: o, userMsg: 'Failed to insert user');
    });
  }

  @override
  ApiResult<UserEntity?> getUser({required GetParams getParams}) {
    return TaskEither.tryCatch(() async {
      final result = await _api.get(
        path: _path,
        query: getParams.toMap(),
      );

      return result == null ? null : UserEntity.fromJson(result);
    }, (o, s) {
      return ApiException(error: o, userMsg: 'Failed to get user');
    });
  }

  @override
  ApiResult<UserEntity> updateUser({
    required UserEntity userEntity,
  }) {
    return TaskEither.tryCatch(() async {
      final result = await _api.put(
        path: _path,
        params: userEntityToMap(userEntity),
      );

      return UserEntity.fromJson(result!);
    }, (o, s) {
      return ApiException(error: o, userMsg: 'Failed to update user');
    });
  }

  @override
  ApiResult<String> updateGenres({
    required UpdateGenresParam updateGenresParam,
  }) {
    return TaskEither.tryCatch(() async {
      final result = await _api.put(
        path: '$_path/update-genres',
        params: updateGenresParam.toMap(),
      );

      return result!['genres'] as String;
    }, (o, s) {
      return ApiException(error: o, userMsg: '');
    });
  }
}
