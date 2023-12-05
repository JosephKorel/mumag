import 'package:mumag/common/services/spotify_auth/providers/api.dart';
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
Future<List<AlbumSimple>> savedAlbums(SavedAlbumsRef ref) async {
  final spotify = ref.watch(spotifyApiProvider);
  final savedAlbums = await spotify.me.savedAlbums().getPage(5);
  final userAlbums = savedAlbums.items?.length;
  final firstAlbum = savedAlbums.items!.first;

  return [];
}
