import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserFavoriteSongs extends ConsumerWidget {
  const UserFavoriteSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            const Text('My 10 favorite songs'),
            IconButton(
              onPressed: () => context.push('/favorites/songs'),
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ],
    );
  }
}
