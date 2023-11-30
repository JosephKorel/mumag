import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';

abstract class UserDatabaseRepository {
  Future<UserEntity> insertUser({required InsertParams insertParams});
}
