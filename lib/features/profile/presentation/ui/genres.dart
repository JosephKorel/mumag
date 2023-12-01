import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';

class FavoriteGenresView extends ConsumerWidget {
  const FavoriteGenresView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(userGenresProvider);
    return genres.when(
      data: (data) => Text(data.join(', ')),
      error: (error, stackTrace) => const Text('Error'),
      loading: CircularProgressIndicator.new,
    );
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