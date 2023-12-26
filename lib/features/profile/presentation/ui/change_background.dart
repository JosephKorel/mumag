import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as FlutterImg;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:spotify/spotify.dart';

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

    return Column(
      children: [
        Text(
          'Change profile background',
          style: context.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: albums.when(
            data: (data) => const AlbumGridView(),
            error: (error, stackTrace) => const Column(),
            loading: LoadingAlbumBottomSheet.new,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const ConfirmAlbumSelection(),
      ],
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
            (e) => AlbumGridItem(album: e),
          )
          .toList(),
    );
  }
}

class AlbumGridItem extends ConsumerWidget {
  const AlbumGridItem({required this.album, super.key});

  final AlbumSimple album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final largeImg = album.images!.first.url!;
    final mediumImg = album.images![1].url!;
    final selectedAlbum = ref.watch(selectedAlbumCoverProvider);
    final isSelected = selectedAlbum == largeImg;

    void onSelect() =>
        ref.read(selectedAlbumCoverProvider.notifier).update(largeImg);

    if (album.images == null) {
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.onSurface.withOpacity(0.4),
        ),
      );
    }

    return Material(
      child: InkWell(
        onTap: onSelect,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? context.primary : Colors.transparent,
              width: 4,
            ),
            image: DecorationImage(
              image: FlutterImg.NetworkImage(mediumImg),
              fit: BoxFit.cover,
            ),
          ),
          clipBehavior: Clip.hardEdge,
        ),
      ),
    );
  }
}

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
            )
                .animate(
                  onComplete: (controller) =>
                      controller.repeat(period: 1.seconds),
                )
                .shimmer(duration: 1.seconds),
          )
          .toList(),
    );
  }
}

class ConfirmAlbumSelection extends ConsumerWidget {
  const ConfirmAlbumSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAlbum = ref.watch(selectedAlbumCoverProvider);
    final user = ref.watch(userProvider).requireValue!;

    Future<void> onConfirm() async {
      final updateParams = UpdateUserParam(
        userEntity: user.copyWith(backgroundUrl: selectedAlbum),
      );

      final request = await ref
          .read(userApiUsecaseProvider)
          .updateUser(updateParams: updateParams)
          .run();

      request.fold((l) => null, (r) {
        context.pop();
        ref.invalidate(userProvider);
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(onPressed: context.pop, child: const Text('Cancel')),
        FilledButton(onPressed: onConfirm, child: const Text('Confirm')),
      ],
    );
  }
}
