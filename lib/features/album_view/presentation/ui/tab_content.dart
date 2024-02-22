import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/rating_bars.dart';
import 'package:mumag/features/album_view/domain/tabs.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/album_view/presentation/ui/about_tab.dart';
import 'package:mumag/features/album_view/presentation/ui/tracks_tab.dart';

class AlbumTabView extends ConsumerStatefulWidget {
  const AlbumTabView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlbumTabViewState();
}

class _AlbumTabViewState extends ConsumerState<AlbumTabView>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: AlbumTabs.values.length, vsync: this);
    _controller.addListener(() {
      ref.read(viewingRatingProvider.notifier).updateState(
            viewingRating: _controller.index == _controller.length - 1,
          );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _controller,
          indicatorColor: context.primary,
          labelColor: context.primary,
          unselectedLabelColor: context.onSurface.withOpacity(0.6),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: AlbumTabs.values
              .map(
                (e) => Tab(
                  icon: Icon(e.icon),
                  text: e.label,
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: const [
              AboutTabContent(),
              TracksTabContent(),
              AlbumRatingTabContent(),
            ],
          ),
        ),
      ],
    );
  }
}

class AlbumRatingTabContent extends ConsumerWidget {
  const AlbumRatingTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumId = ref.watch(viewingAlbumProvider).requireValue!.id;
    final rating = ref.watch(mediaRatingProvider(spotifyId: albumId ?? ''));

    return rating.when(
      data: (data) {
        if (data == null || data.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: RatingBars(scoreList: data.map((e) => e.rating).toList()),
          ),
        );
      },
      error: (error, stackTrace) => Container(),
      loading: Container.new,
    );
  }
}
