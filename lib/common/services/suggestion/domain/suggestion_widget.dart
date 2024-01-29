import 'package:collection/collection.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/routes/routes.dart';
import 'package:spotify/spotify.dart';

/// Class for each card in suggestion
final class SuggestionWidgetEntity {
  SuggestionWidgetEntity({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.spotifyId,
    required this.type,
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
          type: SuggestionType.album,
        );

      case 'track':
        final e = data as Track;

        return SuggestionWidgetEntity(
          name: e.name ?? '',
          description: type.label,
          imageUrl: e.album?.images?.first.url ?? '',
          spotifyId: e.id ?? '',
          artist: e.artists?.map((e) => e.name ?? '').toList() ?? [],
          type: SuggestionType.track,
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
          type: SuggestionType.artist,
        );

      default:
        return SuggestionWidgetEntity(
          name: '',
          description: '',
          imageUrl: '',
          spotifyId: '',
          type: SuggestionType.artist,
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
  final SuggestionType type;

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
                type: SuggestionType.album,
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
                type: SuggestionType.track,
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
                type: SuggestionType.artist,
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
              description: e.albumType != null
                  ? AlbumType.values[e.albumType!.index].name
                  : SuggestionType.album.label,
              imageUrl: e.images?.last.url ?? '',
              spotifyId: e.id ?? '',
              artist: e.artists?.map((e) => e.name ?? '').toList() ?? [],
              type: SuggestionType.album,
            );
          }

          if (e is Track) {
            return SuggestionWidgetEntity(
              name: e.name ?? '',
              description: SuggestionType.track.label,
              imageUrl: e.album?.images?.first.url ?? '',
              spotifyId: e.id ?? '',
              artist: e.artists?.map((e) => e.name ?? '').toList() ?? [],
              type: SuggestionType.track,
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
              type: SuggestionType.artist,
            );
          }

          return null;
        })
        .whereNotNull()
        .toList();
  }

  String mediaPageRoute() {
    switch (description) {
      case 'Artist':
        return const ArtistViewRoute().location;

      case 'Album':
        return const AlbumViewRoute().location;

      case 'Track':
        return const TrackViewRoute().location;

      default:
        return '';
    }
  }
}
