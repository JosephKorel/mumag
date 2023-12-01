import 'package:mumag/common/services/firebase/providers/auth.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/common/services/spotify_auth/providers/credentials.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connect.g.dart';

@riverpod
class HandleConnection extends _$HandleConnection {
  @override
  FutureOr<void> build() {}

  Future<void> _saveUser() async {
    final user = await ref.read(spotifyApiProvider).me.get();
    final email = ref.watch(authServiceProvider).currentUser()!.email!;

    if (user.displayName == null) {
      return;
    }

    final saveRequest = await ref
        .read(userApiProvider)
        .insertUser(
          insertParams: InsertParams(email: email, name: user.displayName!),
        )
        .run();

    saveRequest.fold((l) => null, (r) => ref.invalidate(userProvider));
  }

  Future<void> connect() async {
    try {
      final newCredentials = await ref.read(spotifyAuthProvider).authenticate();

      if (newCredentials.accessToken != null) {
        await ref.read(credentialsImplementationProvider).saveCredentials(
              credentials: newCredentials,
            );

        ref.invalidate(credentialsControllerProvider);

        await _saveUser();
      }
    } catch (e) {
      return;
    }
  }
}
