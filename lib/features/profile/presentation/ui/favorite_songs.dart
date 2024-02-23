import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/features/profile/presentation/providers/favorite_songs.dart';

class FavoriteSongs extends ConsumerWidget {
  const FavoriteSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(userFavoriteTracksProvider);
    return Container();
  }
}
