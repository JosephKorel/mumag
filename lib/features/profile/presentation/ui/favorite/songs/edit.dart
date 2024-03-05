import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/spotify_search/providers/searcher.dart';
import 'package:mumag/common/widgets/favorites/card.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';
import 'package:mumag/features/profile/presentation/ui/favorite/songs/controller.dart';
import 'package:mumag/features/search/presentation/ui/search_input.dart';
import 'package:spotify/spotify.dart';

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
  const _SongsListView({
    required this.onSongTap,
    super.key,
  });
  final void Function(SingleTrack track) onSongTap;

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
                itemBuilder: (context, index) => InkWell(
                  onTap: () => widget.onSongTap(songs[index]),
                  child: SearchMediaCard(
                    data: songs[index].toMediaEntity(),
                  ),
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

class _SearchSongsToAddView extends ConsumerWidget {
  const _SearchSongsToAddView({
    required this.onSongTap,
    super.key,
  });

  final void Function(SingleTrack track) onSongTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favorite songs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const _SearchField(),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: _SongsListView(
                onSongTap: onSongTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedSongsTab extends StatelessWidget {
  const _SelectedSongsTab({
    required this.selectedSongs,
    required this.onSongTap,
    super.key,
  });

  final List<SingleTrack> selectedSongs;
  final void Function(SingleTrack track) onSongTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: selectedSongs.length,
      itemBuilder: (context, index) => SearchMediaCard(
        data: selectedSongs[index].toMediaEntity(),
        trailling: IconButton(
          onPressed: () => onSongTap(selectedSongs[index]),
          icon: const Icon(
            Icons.close,
          ),
        ),
      ),
    );
  }
}

class FavoriteSongsEditionView extends StatefulWidget {
  const FavoriteSongsEditionView({super.key});

  @override
  State<FavoriteSongsEditionView> createState() =>
      _FavoriteSongsEditionViewState();
}

class _FavoriteSongsEditionViewState extends State<FavoriteSongsEditionView>
    with FavoriteSongsEditionController {
  void _onSongTap(SingleTrack track) {
    setState(() {
      _onSongTap(track);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              const Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),
              Tab(
                icon: const Icon(Icons.check),
                text: 'Selected (${selectedSongs.length})',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _SearchSongsToAddView(
              onSongTap: _onSongTap,
            ),
            _SelectedSongsTab(
              selectedSongs: selectedSongs,
              onSongTap: _onSongTap,
            ),
          ],
        ),
      ),
    );
  }
}
