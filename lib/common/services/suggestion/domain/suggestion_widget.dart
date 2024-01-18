import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:spotify/spotify.dart';

/// Class for each card in suggestion
final class SuggestionWidgetEntity {
  SuggestionWidgetEntity({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.spotifyId,
  });

  // Artist, album or track name
  final String name;

  // The type of it, artist, album or track
  final String description;
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
              ),
            )
            .toList();

      case 'track':
        return data
            .whereType<TrackSimple>()
            .map(
              (e) => SuggestionWidgetEntity(
                name: e.name ?? '',
                description: type.label,
                imageUrl: e.artists?.first.images?.last.url ?? '',
                spotifyId: e.id ?? '',
              ),
            )
            .toList();

      case 'artist':
        return data
            .whereType<AlbumSimple>()
            .map(
              (e) => SuggestionWidgetEntity(
                name: e.name ?? '',
                description: type.label,
                imageUrl: e.images?.last.url ?? '',
                spotifyId: e.id ?? '',
              ),
            )
            .toList();

      default:
        return [];
    }
  }
}
