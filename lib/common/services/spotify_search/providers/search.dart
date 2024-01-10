import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'search.g.dart';

@riverpod
class SearchMedia extends _$SearchMedia {
  @override
  String build() {
    return '';
  }

  void onSearch(String value) => state = value;
}

@riverpod
FutureOr<String> spotifySearch(
  SpotifySearchRef ref, {
  required SearchType type,
}) async {
  final search = ref.watch(searchMediaProvider);
  final spotify = ref.watch(spotifyApiProvider);

  var disposed = false;

  ref.onDispose(() {
    disposed = true;
  });

  await Future<void>.delayed(const Duration(milliseconds: 500));

  if (disposed) {
    throw Exception();
  }

  final result = await spotify.search.get(search, types: [type]).getPage(
    8,
  );

  final resultItems = result.first;

  return '';
}
