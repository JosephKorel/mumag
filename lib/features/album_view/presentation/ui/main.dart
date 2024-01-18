import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/theme_provider.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/album_view/presentation/ui/content.dart';

class AlbumMainView extends ConsumerWidget {
  const AlbumMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(viewingAlbumProvider);
    final albumColors = ref.watch(albumColorSchemeProvider);
    final appTheme = ref.watch(appThemeProvider);

    return albumColors.when(
      data: (data) => Theme(
        data: appTheme.copyWith(colorScheme: data.light),
        child: const AlbumContent(),
      ),
      error: (error, stackTrace) => const Scaffold(),
      loading: Scaffold.new,
    );
  }
}
