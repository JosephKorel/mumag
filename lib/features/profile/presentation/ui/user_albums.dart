import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/widgets/profile/albums.dart';
import 'package:mumag/features/profile/presentation/providers/user_albums.dart';

class UserAlbums extends ConsumerWidget {
  const UserAlbums({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumsProvider = ref.watch(userSavedAlbumsProvider);
    final albums = ref.watch(albumListProvider);

    return UserAlbumsView(
      asyncAlbums: albumsProvider,
      savedAlbums: albums,
    );
  }
}
