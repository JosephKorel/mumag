import 'package:flutter_animate/flutter_animate.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/common/services/spotify_search/domain/search_params.dart';
import 'package:mumag/common/services/spotify_search/domain/search_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'searcher.g.dart';

@riverpod
SpotifySearchUsecase spotifySearcher(SpotifySearcherRef ref) {
  final spotify = ref.read(spotifyApiProvider);

  return SpotifySearchUsecase(spotify);
}

@riverpod
class SongSearchParams extends _$SongSearchParams {
  @override
  SpotifySearchParams build() {
    return SpotifySearchParams.songSearch();
  }

  void onInputChange(String value) =>
      state = state.copyWith(searchValue: value);

  void onScrollEnd(int offset) => state = state.copyWith(offset: offset);
}

@riverpod
FutureOr<List<dynamic>> handleSearch(
  HandleSearchRef ref,
) async {
  var disposed = false;
  final searcher = ref.watch(spotifySearcherProvider);
  final searchParams = ref.watch(songSearchParamsProvider);

  if (searchParams.searchValue.isEmpty) {
    return [];
  }

  await Future<void>.delayed(500.milliseconds);

  ref.onDispose(() {
    disposed = true;
  });

  if (disposed) {
    throw Exception();
  }

  return await searcher.search(params: searchParams);
}
