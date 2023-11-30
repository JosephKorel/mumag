import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';

abstract class UserApiUsecaseRepository {
  ApiResult<UserEntity> insertUser({required InsertParams insertParams});
}
