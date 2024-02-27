import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/spotify_search/domain/search_params.dart';
import 'package:mumag/common/services/spotify_search/providers/searcher.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';
import 'package:mumag/features/search/presentation/ui/search_input.dart';
import 'package:spotify/spotify.dart';

final _initialParams = SpotifySearchParams.songSearch();

class _SearchField extends ConsumerWidget {
  const _SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onChanged(String value) => ref
        .read(
          searchParamsProvider(params: _initialParams).notifier,
        )
        .onInputChange(value);

    return SearchInput(
      onChanged: onChanged,
      onClear: () => onChanged(''),
    );
  }
}

class _SongsListView extends ConsumerWidget {
  const _SongsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResult =
        ref.watch(handleSearchProvider(params: _initialParams));

    return searchResult.when(
      data: (data) {
        final songs =
            data.whereType<Track>().map(SingleTrack.fromSpotifyTrack).toList();

        return ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) => Text(songs[index].name),
        );
      },
      error: (error, stackTrace) => const Scaffold(),
      loading: CircularProgressIndicator.new,
    );
  }
}

class EditFavoriteSongsView extends ConsumerWidget {
  const EditFavoriteSongsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favorite songs'),
      ),
      body: const Column(
        children: [
          _SearchField(),
          Expanded(child: _SongsListView()),
        ],
      ),
    );
  }
}
