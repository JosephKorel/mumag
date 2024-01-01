import 'dart:async';

import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/user/data/api_impl.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/features/connect/presentation/providers/connect.dart';
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
Future<bool> userExists(UserExistsRef ref) async {
  final firebaseUser = ref.watch(authServiceProvider).currentUser();

  if (firebaseUser == null) {
    return false;
  }

  final user = await ref
      .watch(userApiUsecaseProvider)
      .getUser(
        getParams: GetParams(
          email: firebaseUser.email!,
        ),
      )
      .run();

  return user.fold((l) => false, (r) => r != null);
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

    return user.fold((l) => throw l, (r) => r);
  }

  Future<void> updateRatings() async {
    state = await AsyncValue.guard(() async {
      final ratings = await ref.read(userRatingsProvider.future);
      return state.requireValue!.copyWith(ratings: ratings);
    });
  }

  Future<void> updateGenres() async {
    state = await AsyncValue.guard(() async {
      final genres = await ref.read(saveUserRepoProvider).favoriteGenres();
      final updatedUser = state.requireValue!
          .copyWith(genres: genres, lastUpdatedAt: DateTime.now());

      final newUser = await ref
          .read(userApiUsecaseProvider)
          .updateUser(
            updateParams: UpdateUserParam(
              userEntity: updatedUser,
            ),
          )
          .run();

      return newUser.fold((l) => state.requireValue, (r) => r);
    });
  }
}

// For mocking
class UserProviderMock extends _$User with Mock implements User {}
