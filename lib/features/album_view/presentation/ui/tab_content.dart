import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/success_events/success_events.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/rating_bars.dart';
import 'package:mumag/common/widgets/rating_bottom_sheet.dart';
import 'package:mumag/features/album_view/domain/tabs.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/album_view/presentation/providers/rating.dart';
import 'package:mumag/features/artist_view/providers/artist.dart';
import 'package:mumag/routes/routes.dart';

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
                AlbumAboutTabContent(),
                AlbumTracksTabContent(),
                AlbumRatingTabContent(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AlbumAboutTabContent extends ConsumerWidget {
  const AlbumAboutTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider)!;
    final dateFormat = DateFormat('dd/MM/yyyy');
    final releaseDate = album.releaseDate == null
        ? ''
        : dateFormat.format(DateTime.parse(album.releaseDate!));

    final artists = album.artists == null
        ? ''
        : album.artists!
            .map(
              (e) => e.name!,
            )
            .join(',');

    void goToArtist() {
      ref
          .read(selectedArtistProvider.notifier)
          .updateState(artist: album.artists!.first);
      context.push(const ArtistViewRoute().location);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.onSurface.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Title: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: album.name ?? '',
                  ),
                ],
                style: context.titleMedium
                    .copyWith(color: context.onPrimaryContainer, fontSize: 18),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: goToArtist,
          borderRadius: BorderRadius.circular(8),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.onSurface.withOpacity(0.2)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Artist: ',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: artists,
                          ),
                        ],
                        style: context.titleMedium.copyWith(
                          color: context.onPrimaryContainer,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_outward,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.onSurface.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Release Date: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: releaseDate,
                  ),
                ],
                style: context.titleMedium
                    .copyWith(color: context.onPrimaryContainer, fontSize: 18),
              ),
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
    final album = ref.watch(viewingAlbumProvider)!;
    final tracks = album.tracks?.toList();

    if (tracks == null) {
      return const Text('This album has no tracks');
    }

    return ListView.builder(
      itemCount: tracks.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            onTap: () {},
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
                          const SizedBox(
                            height: 8,
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
          child: RatingBars(scoreList: data.map((e) => e.rating).toList()),
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
    Future<bool> onConfirm(int value) async {
      final result = await ref.read(rateAlbumProvider(rateValue: value).future);
      return result.fold((l) => false, (r) => true);
    }

    void showToast() => ref
        .read(toastMessageProvider.notifier)
        .onSuccessEvent(successEvent: InsertRatingSuccess());

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
          FilledButton(
            onPressed: () => showAppBottomSheet(
              context,
              child: RatingBottomSheet(
                onConfirm: onConfirm,
                type: RatingType.album,
                showToast: showToast,
              ),
              height: 360,
            ),
            child: const Text('Be the first one to rate it!'),
          ),
        ],
      ),
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
