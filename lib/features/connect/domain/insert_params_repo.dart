import 'package:mumag/common/services/user/domain/database/user_db_events.dart';

abstract class InsertParamsRepository {
  Future<InsertParams> getUserParams({required String email});
}
