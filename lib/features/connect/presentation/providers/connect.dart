import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/connect/data/save_user_impl.dart';
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
SaveUserController saveUserController(SaveUserControllerRef ref) {
  return SaveUserController(
    ref.watch(saveUserRepoProvider),
    ref.watch(userApiProvider),
  );
}

@riverpod
ApiResult<void> createUser(CreateUserRef ref) {
  final email = ref.watch(authServiceProvider).currentUser()!.email!;

  return ref.watch(saveUserControllerProvider).newUser(email: email);
}

@riverpod
class HandleConnection extends _$HandleConnection {
  @override
  FutureOr<void> build() {}

  // Save the user in database
  /*  TaskEither<AppException, void> _saveUser() {
    return TaskEither.tryCatch(
      () async {
        final userDocument = await ref.read(userProvider.future);

        if (userDocument != null) {
          ref.invalidate(userProvider);
          return;
        }

        final email = ref.watch(authServiceProvider).currentUser()!.email!;

        final insertUser = await ref
            .read(saveUserControllerProvider)
            .newUser(email: email)
            .run();

        return insertUser.fold(
          (l) => l,
          (r) {},
        );
      },
      (error, stackTrace) => CreateUserException(error: error),
    );
  } */

  Future<void> connect() async {
    try {
      final newCredentials = await ref.read(spotifyAuthProvider).authenticate();

      if (newCredentials.accessToken != null) {
        await ref.read(credentialsImplementationProvider).saveCredentials(
              credentials: newCredentials,
            );

        ref.invalidate(spotifyApiProvider);

        final result = await ref.read(createUserProvider).run();

        result.fold(
          (l) => AsyncError<void>(l, StackTrace.current),
          (r) => ref.invalidate(userProvider),
        );
      }
    } catch (e) {
      return;
    }
  }
}
