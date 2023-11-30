import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';

final class UserApiUsecase extends UserApiUsecaseRepository {
  final ApiRepository _api;

  UserApiUsecase(this._api);

  @override
  ApiResult<UserEntity> insertUser({required InsertParams insertParams}) async {
    try {
      final result = await _api.post(
        path: 'user',
        params: insertParams.toMap(),
      );

      return Right(UserEntity.fromJson(result));
    } catch (e) {
      return Left(ApiException(errorMsg: '', userMsg: ''));
    }
  }
}
