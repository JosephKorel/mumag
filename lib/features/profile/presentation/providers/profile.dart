import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/profile/domain/profile_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'profile.g.dart';

@riverpod
FutureOr<User> userProfile(UserProfileRef ref) async {
  final spotify = ref.watch(spotifyApiProvider);
  final spotifyUser = await spotify.me.get();
  return spotifyUser;
}

@riverpod
Future<List<String>> userGenres(UserGenresRef ref) async {
  final spotify = ref.watch(spotifyApiProvider);
  final currentUser = ref.watch(userProvider).requireValue!;
  if (currentUser.genres.isEmpty) {
    final genres = await ProfileInteractor(spotify: spotify).favoriteGenres();
    await ref
        .read(userApiProvider)
        .updateGenres(
          updateGenresParam: UpdateGenresParam(
            userId: currentUser.id,
            genres: genres.join(','),
          ),
        )
        .run();

    ref.invalidate(userProvider);
  }

  return currentUser.genres;
}
