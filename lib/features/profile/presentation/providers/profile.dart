import 'package:mumag/common/services/spotify_auth/providers/api.dart';
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

  return ProfileInteractor(spotify: spotify).favoriteGenres();
}
