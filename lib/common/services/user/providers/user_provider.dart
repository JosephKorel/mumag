import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/user/data/api_impl.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
UserApiUsecaseRepository userApi(UserApiRef ref) {
  final api = ref.watch(apiProvider);
  return UserApiImpl(api);
}

@riverpod
UserApiUsecase userApiUsecase(UserApiUsecaseRef ref) {
  final apiUsecase = ref.watch(userApiProvider);

  return UserApiUsecase(apiUsecase);
}

@riverpod
Future<UserEntity?> user(UserRef ref) async {
  final firebaseUser = ref.watch(authServiceProvider).currentUser();

  if (firebaseUser == null) {
    return null;
  }

  final user = await ref
      .watch(userApiUsecaseProvider)
      .getUser(
        getParams: GetParams(
          email: firebaseUser.email!,
        ),
      )
      .run();

  return user.fold((l) => null, (r) => r);
}
