import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/rating_bars.dart';
import 'package:mumag/common/widgets/rating_bottom_sheet.dart';
import 'package:mumag/features/album_view/domain/tabs.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/album_view/presentation/ui/about_tab.dart';
import 'package:mumag/features/album_view/presentation/ui/tracks_tab.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';
import 'package:mumag/routes/routes.dart';
import 'package:spotify/spotify.dart';

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
          child: Material(
            child: TabBarView(
              controller: _controller,
              children: const [
                AboutTabContent(),
                TracksTabContent(),
                AlbumRatingTabContent(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AlbumTracksTabContent extends ConsumerWidget {
  const AlbumTracksTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(getTrackProvider);
    final album = ref.watch(viewingAlbumProvider).requireValue!;
    final tracks = album.tracks?.toList();

    if (tracks == null) {
      return const Text('This album has no tracks');
    }

    void onTap(TrackSimple track) {
      ref.read(getTrackProvider.notifier).updateState(track.id!);
      const TrackViewRoute().push<void>(context);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: tracks.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              onTap: () => onTap(tracks[index]),
              borderRadius: BorderRadius.circular(8),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: context.onSurface.withOpacity(0.2)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              tracks[index].name!,
                              style: context.titleMedium,
                            ),
                            Text(
                              getTrackDuration(tracks[index].duration),
                              style: context.bodyMedium.copyWith(
                                color: context.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_outward),
                    ],
                  ),
                ),
              ),
            ).animate().fadeIn(delay: (index == 0 ? .1 : index / 12).seconds),
          ),
        ),
      ),
    );
  }
}

class AlbumRatingTabContent extends ConsumerWidget {
  const AlbumRatingTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(albumRatingProvider);

    return rating.when(
      data: (data) {
        if (data == null || data.isEmpty) {
          return const FirstRateButton();
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

class FirstRateButton extends ConsumerWidget {
  const FirstRateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Seems like no one has rated this album yet',
            style: context.titleMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          const RatingButtonContainer(child: FirstTimeRating()),
        ],
      ),
    );
  }
}

class FirstTimeRating extends ConsumerWidget {
  const FirstTimeRating({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ancestorWidget =
        context.findAncestorWidgetOfExactType<RatingButtonContainer>();

    return FilledButton(
      onPressed: () => ancestorWidget?.onPressed(context, ref),
      child: const Text('Be the first one to rate it!'),
    );
  }
}

String getTrackDuration(Duration? duration) {
  if (duration == null) {
    return '';
  }
  final durationInSeconds = duration.inSeconds % 60;

  return '${duration.inMinutes}:${durationInSeconds < 10 ? '0$durationInSeconds' : durationInSeconds}';
}
