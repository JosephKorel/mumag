import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/background_icon.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/artist_view/providers/artist.dart';
import 'package:mumag/routes/routes.dart';

final _dateFormat = DateFormat('dd/MM/yyyy');

class AboutTabContent extends ConsumerWidget {
  const AboutTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider).requireValue!;

    final releaseDate = album.releaseDate == null
        ? ''
        : album.releaseDate!.length == 4
            ? album.releaseDate
            : _dateFormat.format(DateTime.parse(album.releaseDate!));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AlbumTitle(title: album.name ?? ''),
          const SizedBox(
            height: 16,
          ),
          const _AlbumArtists(),
          const SizedBox(
            height: 16,
          ),
          _ReleaseDate(releaseDate: releaseDate),
        ],
      ),
    );
  }
}

class _AlbumTitle extends StatelessWidget {
  const _AlbumTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            BackgroundIcon(
              icon: Icons.album,
              size: 16,
              backgroundColor: context.primaryContainer,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Title',
              style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                  color: context.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AlbumArtists extends ConsumerWidget {
  const _AlbumArtists();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider).requireValue!;
    if (album.artists == null) {
      return const SizedBox.shrink();
    }

    void goToArtist(String artistId) {
      ref.read(viewingArtistIdProvider.notifier).updateState(id: artistId);
      context.push(const ArtistViewRoute().location);
    }

    return Column(
      children: [
        Row(
          children: [
            BackgroundIcon(
              icon: Icons.person,
              size: 16,
              backgroundColor: context.primaryContainer,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Artist',
              style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: album.artists!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      color: context.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    album.artists![index].name ?? '',
                    style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReleaseDate extends StatelessWidget {
  const _ReleaseDate({required this.releaseDate});

  final String? releaseDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            BackgroundIcon(
              icon: Icons.calendar_month,
              size: 16,
              backgroundColor: context.primaryContainer,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Release Date',
              style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            children: [
              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                  color: context.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                releaseDate ?? '',
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
