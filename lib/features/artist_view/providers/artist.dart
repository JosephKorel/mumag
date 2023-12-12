import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'artist.g.dart';

@riverpod
class SelectedArtist extends _$SelectedArtist {
  @override
  ArtistSimple? build() {
    return null;
  }

  void updateState({required ArtistSimple artist}) => state = artist;
}

@riverpod
FutureOr<Artist> viewingArtist(ViewingArtistRef ref) async {
  final artistId = ref.watch(selectedArtistProvider)!.id!;
  final spotify = ref.watch(spotifyApiProvider);
  final artist = await spotify.artists.get(artistId);
  return artist;
}

@riverpod
Future<List<AlbumSimple>> artistAlbums(ArtistAlbumsRef ref) async {
  final artistId = ref.watch(selectedArtistProvider)!.id!;
  final spotify = ref.watch(spotifyApiProvider);
  final albums = await spotify.artists.albums(artistId).all();
  return albums.toList();
}
