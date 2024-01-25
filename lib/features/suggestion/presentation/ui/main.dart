import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/features/profile/presentation/providers/suggestions.dart';
import 'package:mumag/features/suggestion/presentation/ui/card.dart';
import 'package:mumag/features/suggestion/presentation/ui/sent_suggestions.dart';

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
        body: const TabBarView(
          children: [
            _ReceivedSuggestionsTab(),
            SentSuggestionsTab(),
          ],
        ),
      ),
    );
  }
}

class _ReceivedSuggestionsTab extends ConsumerStatefulWidget {
  const _ReceivedSuggestionsTab();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __ReceivedSuggestionsTabState();
}

class __ReceivedSuggestionsTabState
    extends ConsumerState<_ReceivedSuggestionsTab> {
  SuggestionType? onlyType;

  void _filter(SuggestionType type) {
    setState(() {
      onlyType = onlyType == type ? null : type;
    });
  }

  @override
  Widget build(BuildContext context) {
    final suggestions = ref.watch(userSuggestionsProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: SuggestionType.values
                .map(
                  (e) => ChoiceChip(
                    onSelected: (value) => _filter(e),
                    selected: onlyType == e,
                    showCheckmark: false,
                    label: Row(
                      children: [
                        Icon(
                          e.icon,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(e.label),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SuggestionCardItem(
                  suggestion: suggestions[index],
                  show: onlyType == null || onlyType == suggestions[index].type,
                ).animate().fadeIn(duration: .4.seconds).slideY(
                      begin: 4,
                      curve: Curves.easeOutQuart,
                      delay: (100 + (index * 100)).milliseconds,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
