import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';

class AlbumContent extends ConsumerWidget {
  const AlbumContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(album.name ?? ''),
      ),
      body: const Stack(
        children: [
          AlbumHeader(),
          Column(
            children: [
              Expanded(child: SizedBox.expand()),
              Expanded(
                flex: 3,
                child: AlbumContentView(),
              ),
            ],
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}

class AlbumHeader extends ConsumerWidget {
  const AlbumHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider)!;

    if (album.images == null) {
      return const SizedBox.shrink();
    }

    return Image(
      image: NetworkImage(album.images!.first.url!),
    );
  }
}

class AlbumContentView extends ConsumerWidget {
  const AlbumContentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: context.background,
      ),
      child: SingleChildScrollView(child: Container()),
    );
  }
}
