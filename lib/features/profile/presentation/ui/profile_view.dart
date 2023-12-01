import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/profile/presentation/ui/genres.dart';

class UserProfileView extends ConsumerWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProfileProvider).requireValue;

    Future<void> checkAlbum() async {}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(user.displayName!),
            if (user.images != null) Image.network(user.images![0].url!),
            ElevatedButton(
              onPressed: checkAlbum,
              child: const Text('Check genres'),
            ),
            const FavoriteGenresView(),
          ],
        ),
      ),
    );
  }
}
