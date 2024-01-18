import 'dart:convert';
import 'dart:developer';

import 'package:mumag/common/models/media/album.dart';
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
  await localData
      .setString(
        key: _albumKey,
        value: jsonEncode(
          page.items!
              .map((e) => AlbumEntity.fromAlbumSimple(e).toJson())
              .toList(),
        ),
      )
      .run();

  return page.items!.toList();
}

@riverpod
List<AlbumEntity> albumList(AlbumListRef ref) {
  final localData = ref.watch(localDataProvider);

  final data = localData.getString<List<dynamic>>(key: _albumKey);
  if (data == null) {
    return [];
  }

  try {
    final value = data.map((e) => jsonDecode(e.toString())).toList();
    final albums = value
        .map((e) => AlbumEntity.fromMap(e as Map<String, dynamic>))
        .toList();

    return albums;
  } catch (e) {
    log('THE ERROR WAS $e');
    return [];
  }
}
