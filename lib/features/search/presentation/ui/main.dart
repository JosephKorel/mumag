import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/features/search/presentation/ui/card.dart';
import 'package:mumag/routes/routes.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void searchUsers() => context.push(const SearchUserRoute().location);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchOptionCard(
              icon: Icons.person_2_outlined,
              onPressed: searchUsers,
              buttonLabel: '!Find people with similar taste',
            ),
            SearchOptionCard(
              icon: Icons.album,
              onPressed: searchUsers,
              buttonLabel: 'Search for music content',
            ),
          ],
        ),
      ),
    );
  }
}
