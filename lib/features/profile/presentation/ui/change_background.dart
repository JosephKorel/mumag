import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';

class ChangeBackgroundBottomSheet extends ConsumerStatefulWidget {
  const ChangeBackgroundBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangeBackgroundBottomSheetState();
}

class _ChangeBackgroundBottomSheetState
    extends ConsumerState<ChangeBackgroundBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final albums = ref.watch(savedAlbumsProvider);

    return albums.when(
      data: (data) => const LoadingAlbumBottomSheet(),
      error: (error, stackTrace) => const Column(),
      loading: LoadingAlbumBottomSheet.new,
    );
  }
}

class AlbumGridView extends ConsumerStatefulWidget {
  const AlbumGridView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlbumGridViewState();
}

class _AlbumGridViewState extends ConsumerState<AlbumGridView> {
  @override
  Widget build(BuildContext context) {
    final albums = ref.watch(savedAlbumsProvider).requireValue;

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: albums
          .map(
            (e) => DecoratedBox(
              decoration: BoxDecoration(
                color: context.onSurface.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
          .toList(),
    );
  }
}

/* Column(
        children: [
          Text(
            'Change profile background',
            style: context.titleLarge,
          ),
        ],
      ), */

class LoadingAlbumBottomSheet extends ConsumerWidget {
  const LoadingAlbumBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingSkeletons = List.generate(
      4,
      (index) => index,
    );

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: loadingSkeletons
          .map(
            (e) => DecoratedBox(
              decoration: BoxDecoration(
                color: context.onSurface.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
          .toList(),
    );
  }
}
