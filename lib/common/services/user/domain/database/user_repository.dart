import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/common/services/user/domain/entity/user_entity.dart';

abstract class UserDatabaseRepository {
  Future<UserEntity> insertUser({required InsertParams insertParams});
}
