import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/rating_bars.dart';
import 'package:mumag/features/album_view/domain/tabs.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/artist_view/providers/artist.dart';
import 'package:mumag/routes/routes.dart';

class AlbumTabView extends ConsumerWidget {
  const AlbumTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: context.primary,
            labelColor: context.primary,
            unselectedLabelColor: context.onSurface.withOpacity(0.6),
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
          const Expanded(
            child: Material(
              child: TabBarView(
                children: [
                  AlbumAboutTabContent(),
                  AlbumTracksTabContent(),
                  AlbumRatingTabContent(),
                ],
              ),
            ),
          ),
        ],
      ),
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
      itemBuilder: (context, index) => Padding(
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
                  Text(tracks[index].name!),
                  const Icon(Icons.arrow_outward),
                ],
              ),
            ),
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
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'The album ratings will appear here',
              textAlign: TextAlign.center,
              style: context.titleLarge.copyWith(
                color: context.onSurface.withOpacity(0.7),
              ),
            ),
          );
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
