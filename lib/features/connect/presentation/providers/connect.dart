import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/connect/data/save_user_impl.dart';
import 'package:mumag/features/connect/domain/insert_params_repo.dart';
import 'package:mumag/features/connect/domain/save_user_controller.dart';
import 'package:mumag/features/connect/domain/save_user_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connect.g.dart';

@riverpod
SaveUserRepository saveUserRepo(SaveUserRepoRef ref) {
  final spotify = ref.watch(spotifyApiProvider);
  return SaveUserImpl(spotify);
}

@riverpod
InsertParamsRepository insertParams(InsertParamsRef ref) {
  return InsertParamsImpl(ref.watch(saveUserRepoProvider));
}

@riverpod
InsertUserController insertUserController(InsertUserControllerRef ref) {
  final insertParamsRepository = ref.watch(insertParamsProvider);
  final userApiRepository = ref.watch(userApiProvider);

  return InsertUserController(insertParamsRepository, userApiRepository);
}

@riverpod
ApiResult<void> createUser(CreateUserRef ref) {
  final email = ref.watch(authServiceProvider).currentUser()!.email!;

  return ref.watch(insertUserControllerProvider).newUser(email: email);
}

@riverpod
class HandleConnection extends _$HandleConnection {
  @override
  FutureOr<void> build() {}

  Future<void> connect() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final credentialsRequest =
          await ref.read(spotifyAuthControllerProvider).authenticate().run();

      final credentials = credentialsRequest.fold((l) => null, (r) => r);

      if (credentials != null && credentials.accessToken != null) {
        final saveCredentials =
            await ref.read(credentialsImplementationProvider).saveCredentials(
                  credentials: credentials,
                );

        if (!saveCredentials) {
          throw ApiException(errorMsg: 'Failed to save credentials');
        }

        ref.invalidate(spotifyApiProvider);

        final userAlreadyExists = await ref.read(userExistsProvider.future);

        if (userAlreadyExists) {
          ref.invalidate(userProvider);
          return;
        }

        final result = await ref.read(createUserProvider).run();

        return result.fold(
          (l) => AsyncError<void>(l, StackTrace.current),
          (r) => ref.invalidate(userProvider),
        );
      }
    });
  }
}
