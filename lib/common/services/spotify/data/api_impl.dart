/* import 'package:mumag/common/services/spotify/domain/repository.dart';
import 'package:spotify/spotify.dart';

final class SpotifyApiImplementation extends SpotifyApiRepository {
  SpotifyApiImplementation(this._api);

  final SpotifyApi _api;

  @override
  Future<Album> fetchAlbum() {
    _api.search.get('aas', types: [SearchType.album]);
  }
}
 */