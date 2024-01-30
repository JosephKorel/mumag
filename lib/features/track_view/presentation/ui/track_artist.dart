import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/background_icon.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';

class TrackArtists extends ConsumerWidget {
  const TrackArtists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(getTrackProvider).requireValue!.artists;

    if (artists == null) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(
          height: 8,
        ),
        const TrackArtistsList(),
      ],
    );
  }
}

class TrackArtistsList extends ConsumerWidget {
  const TrackArtistsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(getTrackProvider).requireValue!.artists;

    if (artists == null) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: artists.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: artists.length,
            itemBuilder: (context, index) => InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => {},
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
                    artists[index].name ?? '',
                    style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationColor: context.primary.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_outward,
                    size: 16,
                    color: context.primary.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
