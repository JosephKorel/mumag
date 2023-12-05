import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';

abstract class UserApiUsecaseRepository {
  Future<UserEntity> insertUser({required InsertParams insertParams});

  Future<UserEntity?> getUser({required GetParams getParams});

  Future<UserEntity> updateUser({
    required UpdateUserParam updateParams,
  });

  Future<String> updateGenres({
    required UpdateGenresParam updateGenresParam,
  });
}
