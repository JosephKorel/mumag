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
  final savedAlbums = await spotify.me.savedAlbums().getPage(6);

  return savedAlbums.items?.toList() ?? [];
}

@riverpod
class SelectedAlbumCover extends _$SelectedAlbumCover {
  @override
  String? build() {
    return null;
  }

  void update(String url) => state = url;
}

@riverpod
class ScrollOffset extends _$ScrollOffset {
  @override
  double build() {
    return 0;
  }

  void onScroll(double offset) => state = offset;
}
