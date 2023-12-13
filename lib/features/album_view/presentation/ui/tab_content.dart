import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/album_view/domain/tabs.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';

class AlbumTabView extends ConsumerWidget {
  const AlbumTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 400,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                indicatorColor: context.primary,
                labelColor: context.primary,
                unselectedLabelColor: context.onSurface.withOpacity(0.6),
                tabs: AlbumTabs.values
                    .map(
                      (e) => Tab(
                        icon: Icon(e.icon),
                        text: e.label,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 16,
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    AlbumAboutTabContent(),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlbumAboutTabContent extends ConsumerWidget {
  const AlbumAboutTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(viewingAlbumProvider)!;
    final dateFormat = DateFormat('dd/MM/yyyy');
    final releaseDate = album.releaseDate == null
        ? ''
        : dateFormat.format(DateTime.parse(album.releaseDate!));

    final artists = album.artists == null
        ? ''
        : album.artists!
            .map(
              (e) => e.name!,
            )
            .join(',');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.primaryContainer,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Title: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: album.name ?? '',
                  ),
                ],
                style: context.titleMedium
                    .copyWith(color: context.onPrimaryContainer, fontSize: 18),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.primaryContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Artist: ',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: artists,
                          ),
                        ],
                        style: context.titleMedium.copyWith(
                          color: context.onPrimaryContainer,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_outward,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.primaryContainer,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Release Date: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: releaseDate,
                  ),
                ],
                style: context.titleMedium
                    .copyWith(color: context.onPrimaryContainer, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
