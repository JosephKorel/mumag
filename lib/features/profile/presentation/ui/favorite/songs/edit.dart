import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/spotify_search/domain/search_params.dart';
import 'package:mumag/common/services/spotify_search/providers/searcher.dart';
import 'package:mumag/common/widgets/favorites/card.dart';
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
          songSearchParamsProvider.notifier,
        )
        .onInputChange(value);

    return SearchInput(
      onChanged: onChanged,
      onClear: () => onChanged(''),
    );
  }
}

class _SongsListView extends ConsumerStatefulWidget {
  const _SongsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __SongsListViewState();
}

class __SongsListViewState extends ConsumerState<_SongsListView> {
  static const _increaseFactor = 8;
  final _controller = ScrollController();
  bool _loading = true;
  int _offset = 0;

  void onScrollEnd() {
    if (_loading) {
      return;
    }

    _offset += _increaseFactor;

    ref.read(songSearchParamsProvider.notifier).onScrollEnd(_offset);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.atEdge && _controller.offset != 0) {
        // onScrollEnd();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(handleSearchProvider, (previous, next) {
      _loading = next.isLoading;
    });

    final searchResult = ref.watch(handleSearchProvider);

    return searchResult.when(
      data: (data) {
        final songs =
            data.whereType<Track>().map(SingleTrack.fromSpotifyTrack).toList();
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: songs.length,
                itemBuilder: (context, index) => SearchMediaCard(
                  data: songs[index].toMediaEntity(),
                ),
              ),
            ),
            if (searchResult.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
      error: (error, stackTrace) => Scaffold(
        body: Text('$error'),
      ),
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
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _SearchField(),
            SizedBox(
              height: 16,
            ),
            Expanded(child: _SongsListView()),
          ],
        ),
      ),
    );
  }
}
