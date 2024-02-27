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
class SearchParams extends _$SearchParams {
  @override
  SpotifySearchParams build({required SpotifySearchParams params}) {
    return params;
  }

  void onInputChange(String value) =>
      state = state.copyWith(searchValue: value);
}

@riverpod
FutureOr<List<dynamic>> handleSearch(
  HandleSearchRef ref, {
  required SpotifySearchParams params,
}) async {
  var disposed = false;
  final searcher = ref.watch(spotifySearcherProvider);
  final searchParams = ref.watch(searchParamsProvider(params: params));

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
