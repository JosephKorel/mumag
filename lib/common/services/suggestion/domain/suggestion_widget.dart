import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:spotify/spotify.dart';

/// Class for each card in suggestion
final class SuggestionWidgetEntity {
  SuggestionWidgetEntity({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.spotifyId,
    this.artist,
  });

  // Artist, album or track name
  final String name;

  // The type of it, artist, album or track
  final String description;
  final List<String>? artist;
  final String imageUrl;
  final String spotifyId;

  static List<SuggestionWidgetEntity> parseList(
    List<dynamic> data,
    SuggestionType type,
  ) {
    switch (type.name) {
      case 'album':
        return data
            .whereType<AlbumSimple>()
            .map(
              (e) => SuggestionWidgetEntity(
                name: e.name ?? '',
                description: type.label,
                imageUrl: e.images?.last.url ?? '',
                spotifyId: e.id ?? '',
                artist: e.artists?.map((e) => e.name ?? '').toList() ?? [],
              ),
            )
            .toList();

      case 'track':
        // log('THIS IS THE DATA: ${data.whereType<TrackSimple>().first.}');
        return data
            .whereType<Track>()
            .map(
              (e) => SuggestionWidgetEntity(
                name: e.name ?? '',
                description: type.label,
                imageUrl: e.album?.images?.first.url ?? '',
                spotifyId: e.id ?? '',
                artist: e.artists?.map((e) => e.name ?? '').toList() ?? [],
              ),
            )
            .toList();

      case 'artist':
        return data
            .whereType<Artist>()
            .map(
              (e) => SuggestionWidgetEntity(
                name: e.name ?? '',
                description: type.label,
                imageUrl: e.images == null || e.images!.isEmpty
                    ? ''
                    : e.images!.last.url ?? '',
                spotifyId: e.id ?? '',
              ),
            )
            .toList();

      default:
        return [];
    }
  }
}
