import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
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
class User extends _$User {
  @override
  Future<UserEntity?> build() async {
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

  void updateRatings(List<RatingEntity> ratings) {
    final newState = state.requireValue!.copyWith(ratings: ratings);
    state = AsyncData(newState);
  }
}

// For mocking
class UserProviderMock extends _$User with Mock implements User {}
