import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/spotify_search/providers/searcher.dart';
import 'package:mumag/common/widgets/favorites/card.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/profile/domain/favorite_song/entity.dart';
import 'package:mumag/features/profile/presentation/ui/favorite/songs/controller.dart';
import 'package:mumag/features/search/presentation/ui/search_input.dart';

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

class __SongsListViewState extends ConsumerState<_SongsListView>
    with FavoriteSongsEditionController {
  static const _increaseFactor = 8;

  void _onScrollEnd() {
    if (loading) {
      return;
    }

    offset += _increaseFactor;

    ref.read(songSearchParamsProvider.notifier).onScrollEnd(offset);
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.atEdge && controller.offset != 0) {
        _onScrollEnd();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(handleSearchProvider, (previous, next) {
      loading = next.isLoading;
      if (next.hasValue) {
        addSongs(next.requireValue);
      }
    });

    final searchResult = ref.watch(handleSearchProvider);

    if (searchResult.hasError) {
      return const Center(
        child: Text('Something wrong'),
      );
    }

    if (!searchResult.hasValue && loading) {
      return const _LoadingListView();
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: controller,
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
  }
}

class _LoadingListView extends StatelessWidget {
  const _LoadingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        6,
        (index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: LoadingSkeleton(height: 80),
        ),
      ),
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
    return Padding(
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
      onSongTap(track);
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
