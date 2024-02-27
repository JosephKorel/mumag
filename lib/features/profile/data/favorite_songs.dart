/* import 'package:mumag/common/models/media/track.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';

final class FavoriteSongsImpl {
  const FavoriteSongsImpl(this._api);
  final ApiRepository _api;

  static const _path = '/favorite-songs';

  Future<void> addSongs({required List<SavedTrack> songs}) async {
    try {
      await _api.post(
        path: _path,
        params: {
          'data': songs.map((e) => e.toJson()).toList(),
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SavedTrack>> fetchSongs({
    required int userId,
    required int limit,
  }) async {
    try {
      final request = await _api.get(
        path: _path,
        query: {'userId': userId, 'limit': limit},
      );

      return (request!['data'] as List<dynamic>)
          .map((e) => SavedTrack.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
 */