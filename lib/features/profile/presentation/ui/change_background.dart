import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/media/album.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/profile/presentation/providers/user_albums.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Change profile background',
          style: context.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        const Expanded(
          child: AlbumGridView(),
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
    final albums = ref.watch(albumListProvider);

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

  final AlbumEntity album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final largeImg = album.images.first;
    final mediumImg = album.images[1];
    final selectedAlbum = ref.watch(selectedAlbumCoverProvider);
    final isSelected = selectedAlbum == largeImg;

    void onSelect() =>
        ref.read(selectedAlbumCoverProvider.notifier).update(largeImg);

    if (album.images.every((element) => element.isEmpty)) {
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.onSurface.withOpacity(0.4),
        ),
      );
    }

    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      color: context.primary,
      child: Ink.image(
        image: CachedNetworkImageProvider(mediumImg),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: !isSelected ? Colors.transparent : context.primary,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onSelect,
          ),
        ),
      ),
    );
  }
}

class ConfirmAlbumSelection extends ConsumerWidget {
  const ConfirmAlbumSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const userKey = 'user';
    final selectedAlbum = ref.watch(selectedAlbumCoverProvider);
    final user = ref.watch(localUserProvider)!;

    Future<void> onConfirm() async {
      final updatedUser = user.copyWith(backgroundUrl: selectedAlbum);
      final updateParams = UpdateUserParam(
        userEntity: user.copyWith(backgroundUrl: selectedAlbum),
      );

      final request = await ref
          .read(userApiUsecaseProvider)
          .updateUser(updateParams: updateParams)
          .run();

      request.fold(
          (l) =>
              ref.read(toastMessageProvider.notifier).onException(exception: l),
          (r) async {
        // Update user cache
        await ref
            .read(localDataProvider)
            .setString(
              key: userKey,
              value: jsonEncode(userEntityToJson(updatedUser)),
            )
            .run();

        // Update user provider
        ref.read(localUserProvider.notifier).updateState(updatedUser);

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          context.pop();
        });
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
