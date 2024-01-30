import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/media/common.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';
import 'package:mumag/routes/routes.dart';
import 'package:spotify/spotify.dart';

class TracksTabContent extends ConsumerWidget {
  const TracksTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(getTrackProvider);
    final builtAt = DateTime.now().millisecondsSinceEpoch;
    final album = ref.watch(viewingAlbumProvider).requireValue!;
    final tracks = album.tracks?.toList();

    if (tracks == null) {
      return const Text('This album has no tracks');
    }

    void onTap(String spotifyId) {
      ref.read(getTrackProvider.notifier).updateState(spotifyId);
      const TrackViewRoute().push<void>(context);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: tracks.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => _TrackTile(
          track: tracks[index],
          onTap: onTap,
          index: index,
          parentWidgetBuiltAt: builtAt,
        ),
      ),
    );
  }
}

class _TrackTile extends StatelessWidget {
  const _TrackTile({
    required this.track,
    required this.onTap,
    required this.parentWidgetBuiltAt,
    required this.index,
  });

  final void Function(String trackId) onTap;
  final TrackSimple track;
  final int parentWidgetBuiltAt;
  final int index;

  @override
  Widget build(BuildContext context) {
    final builtAt = DateTime.now().millisecondsSinceEpoch;
    final artist = track.artists?.map((e) => e.name ?? '').join(', ');
    final shouldAnimate = builtAt - parentWidgetBuiltAt <= 60;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => onTap(track.id ?? ''),
        borderRadius: BorderRadius.circular(8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(color: context.onSurface.withOpacity(0.1)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                const CardCilinder(
                  height: 4,
                  width: 4,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        track.name ?? '',
                        style: context.titleMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            artist ?? '',
                            style: context.bodyMedium.copyWith(
                              color: context.onSurface.withOpacity(0.8),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SmallBadge(
                            text: getTrackDuration(track.duration),
                            backgroundColor: context.onSurface.withOpacity(0.1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
          begin: shouldAnimate ? 0 : 1,
          duration: .2.seconds,
          curve: Curves.easeOutQuart,
          delay: (index * 100).milliseconds,
        )
        .slideY(
          begin: shouldAnimate ? (4 + index).toDouble() : 0,
          duration: .4.seconds,
          curve: Curves.easeOutQuart,
          delay: (index * 20).milliseconds,
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
