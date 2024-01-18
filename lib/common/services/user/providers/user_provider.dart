import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/user/data/api_impl.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/features/connect/presentation/providers/connect.dart';
import 'package:mumag/features/profile/presentation/providers/social.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

const _userKey = 'user';

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

  return user.fold(
    (l) {
      ref.read(toastMessageProvider.notifier).onException(exception: l);
      return false;
    },
    (r) => r != null,
  );
}

@riverpod
class User extends _$User {
  @override
  Future<UserEntity?> build() async {
    final localData = ref.watch(localDataProvider);
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

    return user.fold((l) => null, (r) async {
      // If user is already cached, skip it
      if (localData.getString<Map<String, dynamic>>(key: _userKey) == null) {
        await localData
            .setString(
              key: _userKey,
              value: jsonEncode(userEntityToJson(r!)),
            )
            .run();
      }

      return r;
    });
  }

  Future<void> updateRatings() async {
    state = await AsyncValue.guard(() async {
      final ratings = await ref.read(userRatingsProvider.future);
      final updatedUser = state.requireValue!.copyWith(ratings: ratings);

      // Update user cache
      await ref
          .read(localDataProvider)
          .setString(
            key: _userKey,
            value: jsonEncode(userEntityToJson(updatedUser)),
          )
          .run();

      // Update user provider
      ref.invalidate(localUserProvider);

      return updatedUser;
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

      return newUser.fold((l) => state.requireValue, (r) {
        // Update user cache
        ref
            .read(localDataProvider)
            .setString(
              key: _userKey,
              value: jsonEncode(userEntityToJson(updatedUser)),
            )
            .run();

        // Update user provider
        ref.invalidate(localUserProvider);

        return r;
      });
    });
  }

  Future<void> getSocialRelations() async {
    state = await AsyncValue.guard(() async {
      ref.invalidate(mySocialRelationsProvider);

      final socialRelations = await ref.read(mySocialRelationsProvider.future);

      return socialRelations.fold(
        (l) => state.requireValue,
        (r) async {
          final updatedUser = state.requireValue!.copyWith(socialRelations: r);

          // Update user cache
          await ref
              .read(localDataProvider)
              .setString(
                key: _userKey,
                value: jsonEncode(userEntityToJson(updatedUser)),
              )
              .run();

          // Update user provider
          ref.invalidate(localUserProvider);

          return updatedUser;
        },
      );
    });
  }
}

@riverpod
UserEntity? localUser(LocalUserRef ref) {
  final localData = ref.watch(localDataProvider);
  final user = localData.getString<Map<String, dynamic>>(key: _userKey);

  if (user == null) {
    return null;
  }

  return UserEntity.fromJson(user);
}

// For mocking
class UserProviderMock extends _$User with Mock implements User {}
