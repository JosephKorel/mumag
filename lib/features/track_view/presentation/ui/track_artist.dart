import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/background_icon.dart';
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BackgroundIcon(
              icon: artists.length == 1 ? Icons.person : Icons.people,
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
        const Flexible(child: TrackArtistsList()),
      ],
    );
  }
}

class TrackArtistsList extends ConsumerWidget {
  const TrackArtistsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(viewingTrackProvider)!.artists!;

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: artists.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                artists[index].name!,
                style: context.titleMedium.copyWith(
                  color: context.onSurface.withOpacity(0.8),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_outward),
              style: IconButton.styleFrom(
                backgroundColor: context.primaryContainer,
                foregroundColor: context.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
