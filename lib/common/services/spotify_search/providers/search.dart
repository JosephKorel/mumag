import 'package:collection/collection.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/spotify_auth/providers/api.dart';
import 'package:mumag/common/services/spotify_search/adapter/search.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spotify/spotify.dart';

part 'search.g.dart';

@riverpod
class SearchMedia extends _$SearchMedia {
  @override
  String build() {
    return '';
  }

  void onSearch(String value) => state = value;
}

@riverpod
class SpotifySearch extends _$SpotifySearch {
  @override
  FutureOr<List<dynamic>> build({
    SearchType? type,
  }) async {
    final search = ref.watch(searchMediaProvider);
    final spotify = ref.watch(spotifyApiProvider);

    if (search.isEmpty) {
      return [];
    }

    var disposed = false;

    ref.onDispose(() {
      disposed = true;
    });

    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (disposed) {
      throw Exception();
    }

    final types = type != null
        ? [type]
        : [SearchType.track, SearchType.artist, SearchType.album];

    final result = await spotify.search.get(search, types: types).getPage(
          8,
        );

    final items = result.first.items;

    if (items == null) {
      return [];
    }

    return items.toList();
  }

  Future<void> onScrollEnd({
    required int offset,
    SearchType? type,
  }) async {
    final search = ref.read(searchMediaProvider);
    final spotify = ref.read(spotifyApiProvider);
    final types = type != null ? [type] : SearchType.values;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await spotify.search.get(search, types: types).getPage(
            8,
            offset,
          );

      final items = result.first.items;

      if (items == null) {
        return state.requireValue;
      }

      return [...state.requireValue, ...items];
    });
  }
}

@riverpod
FutureOr<SuggestionWidgetEntity?> searchMediaById(
  SearchMediaByIdRef ref, {
  required SuggestionType type,
  required String spotifyId,
}) async {
  final spotify = ref.watch(spotifyApiProvider);
  switch (type) {
    case SuggestionType.album:
      final item = await spotify.albums.get(spotifyId);
      return SuggestionWidgetEntity.parseSingleItem(item, type);

    case SuggestionType.track:
      final item = await spotify.tracks.get(spotifyId);
      return SuggestionWidgetEntity.parseSingleItem(item, type);

    case SuggestionType.artist:
      final item = await spotify.artists.get(spotifyId);
      return SuggestionWidgetEntity.parseSingleItem(item, type);
  }
}

@riverpod
class SpotifyFullSearch extends _$SpotifyFullSearch {
  static const searchAdapter = SearchAdapter();

  static const types = [SearchType.track, SearchType.artist, SearchType.album];

  @override
  FutureOr<List<dynamic>> build() async {
    final search = ref.watch(searchMediaProvider);
    final spotify = ref.watch(spotifyApiProvider);

    if (search.isEmpty) {
      return [];
    }

    var disposed = false;

    ref.onDispose(() {
      disposed = true;
    });

    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (disposed) {
      throw Exception();
    }

    final result = await spotify.search.get(search, types: types).getPage(
          8,
        );

    final items =
        result.map((e) => e.items).whereNotNull().expand((element) => element);

    return searchAdapter.searchForCompatibility(
      search,
      items.toList(),
    );
  }

  Future<void> onScrollEnd({
    required int offset,
  }) async {
    final search = ref.read(searchMediaProvider);
    final spotify = ref.read(spotifyApiProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await spotify.search.get(search, types: types).getPage(
            8,
            offset,
          );

      final items = result
          .map((e) => e.items)
          .whereNotNull()
          .expand((element) => element);

      final newList = searchAdapter.searchForCompatibility(
        search,
        items.toList(),
      );

      return [...state.requireValue, ...newList];
    });
  }
}
