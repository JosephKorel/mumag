import 'package:mumag/common/services/spotify_auth/providers/api.dart';
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
    required SearchType type,
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

    final result = await spotify.search.get(search, types: [type]).getPage(
      8,
    );

    final items = result.first.items;

    if (items == null) {
      return [];
    }

    return items.toList();
  }

  Future<void> onScrollEnd({
    required SearchType type,
    required int offset,
  }) async {
    final search = ref.read(searchMediaProvider);
    final spotify = ref.read(spotifyApiProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await spotify.search.get(search, types: [type]).getPage(
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
