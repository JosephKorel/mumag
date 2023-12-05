import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';

final class UserApiUsecase {
  UserApiUsecase(this._apiUseCase);

  final UserApiUsecaseRepository _apiUseCase;

  ApiResult<UserEntity> insertUser({required InsertParams insertParams}) {
    return TaskEither.tryCatch(() async {
      final result = await _apiUseCase.insertUser(insertParams: insertParams);

      return result;
    }, (o, s) {
      return ApiException(error: o, userMsg: 'Failed to insert user');
    });
  }

  ApiResult<UserEntity?> getUser({required GetParams getParams}) {
    return TaskEither.tryCatch(() async {
      final result = await _apiUseCase.getUser(getParams: getParams);

      return result;
    }, (o, s) {
      return ApiException(error: o, userMsg: 'Failed to get user');
    });
  }

  ApiResult<UserEntity> updateUser({
    required UpdateUserParam updateParams,
  }) {
    return TaskEither.tryCatch(() async {
      final result = await _apiUseCase.updateUser(updateParams: updateParams);

      return result;
    }, (o, s) {
      return ApiException(error: o, userMsg: 'Failed to update user');
    });
  }

  ApiResult<String> updateGenres({
    required UpdateGenresParam updateGenresParam,
  }) {
    return TaskEither.tryCatch(() async {
      final result =
          await _apiUseCase.updateGenres(updateGenresParam: updateGenresParam);

      return result;
    }, (o, s) {
      return ApiException(error: o, userMsg: '');
    });
  }
}

final class UserApiImpl extends UserApiUsecaseRepository {
  UserApiImpl(this._api);

  final ApiRepository _api;

  static const _path = '/user';

  @override
  Future<UserEntity> insertUser({required InsertParams insertParams}) async {
    try {
      final result = await _api.post(
        path: _path,
        params: insertParams.toMap(),
      );

      return UserEntity.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity?> getUser({required GetParams getParams}) async {
    try {
      final result = await _api.get(
        path: _path,
        query: getParams.toMap(),
      );

      return result == null ? null : UserEntity.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> updateUser({
    required UpdateUserParam updateParams,
  }) async {
    try {
      final result = await _api.put(
        path: _path,
        params: updateParams.toMap(),
      );

      return UserEntity.fromJson(result!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updateGenres({
    required UpdateGenresParam updateGenresParam,
  }) async {
    try {
      final result = await _api.put(
        path: '$_path/update-genres',
        params: updateGenresParam.toMap(),
      );

      return result!['genres'] as String;
    } catch (e) {
      rethrow;
    }
  }
}
