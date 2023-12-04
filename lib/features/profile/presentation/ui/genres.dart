import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';

class FavoriteGenresView extends ConsumerWidget {
  const FavoriteGenresView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(
      userProvider.select((value) => value.requireValue!.genres),
    );

    return Text(genres.join(', '));
  }
}

/* class FavoriteGenresView extends ConsumerWidget {
  const FavoriteGenresView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotify = ref.watch(spotifyApiProvider);

    Future<void> checkAlbums() async {
      final album = await spotify.albums.get('as');
      
    }

    return ElevatedButton(onPressed: checkAlbums, child: Text('Check'));
  }
}
 */