import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/spotify_search/providers/search.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/common/widgets/loading.dart';
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
        body: const TabBarView(
          children: [
            _ReceivedSuggestionsTab(),
            _ReceivedSuggestionsTab(),
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
                    onSelected: (value) {},
                    selected: false,
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
              itemBuilder: (context, index) =>
                  _SuggestionItem(suggestion: suggestions[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionItemMedia extends ConsumerWidget {
  const _SuggestionItemMedia({required this.suggestion});

  final SuggestionEntity suggestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(
      searchMediaByIdProvider(
        type: suggestion.type,
        spotifyId: suggestion.spotifyId,
      ),
    );

    return item.when(
      data: (data) => SizedBox(
        height: 52,
        width: context.deviceWidth,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedImage(
                url: data!.imageUrl,
                width: 52,
                height: 52,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.name,
                    style: context.titleMedium.copyWith(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        '${data.description} ${data.artist != null ? ' by ' : ''}',
                        style: context.bodyMedium.copyWith(
                          color: context.onSurface.withOpacity(0.7),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      if (data.artist != null)
                        Expanded(
                          child: Text(
                            data.artist!.join(', '),
                            style: context.bodyMedium.copyWith(
                              color: context.onSurface.withOpacity(0.7),
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: Icon(Icons.warning),
      ),
      loading: () => const SizedBox(
        height: 52,
        child: Row(
          children: [
            LoadingSkeleton(
              height: 52,
              width: 52,
            ),
            SizedBox(
              width: 8,
            ),
            LoadingSkeleton(height: 18),
          ],
        ),
      ),
    );
  }
}

class _SuggestionItem extends StatelessWidget {
  const _SuggestionItem({required this.suggestion});
  final SuggestionEntity suggestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          _SuggestionItemMedia(suggestion: suggestion),
          Row(
            children: [
              Text(
                'Suggested by: ',
                style: context.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('josephKorelTeste'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
