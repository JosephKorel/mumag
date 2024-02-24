import 'package:collection/collection.dart';
import 'package:mumag/common/services/spotify_search/domain/search_params.dart';
import 'package:spotify/spotify.dart';

final class SpotifySearchUsecase {
  const SpotifySearchUsecase(this._spotifyApi);
  final SpotifyApi _spotifyApi;

  static const _limit = 10;

  Future<List<dynamic>> search({
    required SpotifySearchParams params,
  }) async {
    try {
      final result = await _spotifyApi.search
          .get(params.searchValue, types: params.searchType)
          .getPage(_limit, params.offset);

      return result.map((e) => e.items).whereNotNull().toList();
    } catch (e) {
      rethrow;
    }
  }
}
