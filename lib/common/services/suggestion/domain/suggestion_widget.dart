import 'package:collection/collection.dart';
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

  factory SuggestionWidgetEntity.parseSingleItem(
    dynamic data,
    SuggestionType type,
  ) {
    switch (type.name) {
      case 'album':
        final e = data as AlbumSimple;
        return SuggestionWidgetEntity(
          name: e.name ?? '',
          description: type.label,
          imageUrl: e.images?.last.url ?? '',
          spotifyId: e.id ?? '',
          artist: e.artists?.map((e) => e.name ?? '').toList() ?? [],
        );

      case 'track':
        final e = data as Track;

        return SuggestionWidgetEntity(
          name: e.name ?? '',
          description: type.label,
          imageUrl: e.album?.images?.first.url ?? '',
          spotifyId: e.id ?? '',
          artist: e.artists?.map((e) => e.name ?? '').toList() ?? [],
        );

      case 'artist':
        final e = data as Artist;

        return SuggestionWidgetEntity(
          name: e.name ?? '',
          description: type.label,
          imageUrl: e.images == null || e.images!.isEmpty
              ? ''
              : e.images!.last.url ?? '',
          spotifyId: e.id ?? '',
        );

      default:
        return SuggestionWidgetEntity(
          name: '',
          description: '',
          imageUrl: '',
          spotifyId: '',
        );
    }
  }

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

  static List<SuggestionWidgetEntity> parseDynamicList(
    List<dynamic> data,
  ) {
    return data
        .map((e) {
          if (e is AlbumSimple) {
            return SuggestionWidgetEntity(
              name: e.name ?? '',
              description: SuggestionType.album.label,
              imageUrl: e.images?.last.url ?? '',
              spotifyId: e.id ?? '',
              artist: e.artists?.map((e) => e.name ?? '').toList() ?? [],
            );
          }

          if (e is Track) {
            return SuggestionWidgetEntity(
              name: e.name ?? '',
              description: SuggestionType.track.label,
              imageUrl: e.album?.images?.first.url ?? '',
              spotifyId: e.id ?? '',
              artist: e.artists?.map((e) => e.name ?? '').toList() ?? [],
            );
          }

          if (e is Artist) {
            return SuggestionWidgetEntity(
              name: e.name ?? '',
              description: SuggestionType.artist.label,
              imageUrl: e.images == null || e.images!.isEmpty
                  ? ''
                  : e.images!.last.url ?? '',
              spotifyId: e.id ?? '',
            );
          }

          return null;
        })
        .whereNotNull()
        .toList();
  }
}
