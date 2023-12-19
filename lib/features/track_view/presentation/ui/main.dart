import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/widgets/media_view.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';

class TrackMainView extends ConsumerWidget {
  const TrackMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final track = ref.watch(viewingTrackProvider)!;
    final album = ref.watch(viewingAlbumProvider)!;

    return MediaContentContainer(
      appBarTitle: track.name ?? '',
      headerImageUrl: album.images?.first.url,
      mainContent: Container(),
    );
  }
}
