import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'user_albums.g.dart';

const _albumKey = 'userAlbums';

@riverpod
Future<List<AlbumSimple>> userSavedAlbums(UserSavedAlbumsRef ref) async {
  final localData = ref.watch(localDataProvider);
  final spotify = ref.watch(spotifyApiProvider);
  final page = await spotify.me.savedAlbums().getPage(5);
  if (page.items == null) {
    return [];
  }

  // Cache albums
  localData.setString(
    key: _albumKey,
    value: page.items!.map((e) => e.toString()).toString(),
  );

  return page.items!.toList();
}

@riverpod
List<AlbumSimple> albumList(AlbumListRef ref) {
  const albumKey = 'userAlbums';
  final localData = ref.watch(localDataProvider);

  final data = localData.getString<List<dynamic>>(key: albumKey);
  if (data == null) {
    return [];
  }

  return data
      .map((e) => AlbumSimple.fromJson(e as Map<String, dynamic>))
      .toList();
}
