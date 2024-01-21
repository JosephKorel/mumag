import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/features/profile/presentation/providers/suggestions.dart';

class MySugggestionsView extends StatelessWidget {
  const MySugggestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Suggestions'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Received',
              ),
              Tab(
                text: 'Sent',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: []),
      ),
    );
  }
}

class _ReceivedSuggestions extends ConsumerWidget {
  const _ReceivedSuggestions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(userSuggestionsProvider);
    return ListView.builder(
      itemBuilder: (context, index) => const Text('A'),
    );
  }
}
