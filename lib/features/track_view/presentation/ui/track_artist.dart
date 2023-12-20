import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';

class TrackArtists extends ConsumerWidget {
  const TrackArtists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(viewingTrackProvider)!.artists;

    if (artists == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.onSurface.withOpacity(0.1),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.people),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              artists.length == 1 ? 'Artist' : 'Artists',
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        if (artists.length == 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                artists.first.name!,
                style: context.titleMedium
                    .copyWith(color: context.onSurface.withOpacity(0.8)),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_outward),
              ),
            ],
          )
        else
          const TrackArtistsList(),
      ],
    );
  }
}

class TrackArtistsList extends ConsumerWidget {
  const TrackArtistsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(viewingTrackProvider)!.artists!;

    return Row(
      children: [
        ...artists.slice(0, 2).map(
              (element) => TextButton(
                onPressed: () {},
                child: Text(element.name!),
              ),
            ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove_red_eye),
        ),
      ],
    );
  }
}
