import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'user_albums.g.dart';

@riverpod
Future<List<AlbumSimple>> userSavedAlbums(UserSavedAlbumsRef ref) async {
  final spotify = ref.watch(spotifyApiProvider);
  final albums = await spotify.me.savedAlbums().all(10);
  return albums.toList();
}
