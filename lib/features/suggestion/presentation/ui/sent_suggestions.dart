import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/spotify_search/providers/search.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/suggestion/presentation/providers/sent_suggestions.dart';
import 'package:mumag/features/suggestion/presentation/ui/card.dart';

class SentSuggestionsTab extends ConsumerStatefulWidget {
  const SentSuggestionsTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SentSuggestionsTabState();
}

class _SentSuggestionsTabState extends ConsumerState<SentSuggestionsTab> {
  SuggestionType? onlyType;

  void _filter(SuggestionType type) {
    setState(() {
      onlyType = onlyType == type ? null : type;
    });
  }

  @override
  Widget build(BuildContext context) {
    final suggestions = ref.watch(sentSuggestionsProvider);

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
            child: suggestions.when(
              data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SuggestionCardItem(
                    suggestion: data[index],
                    show: onlyType == null || onlyType == data[index].type,
                  ).animate().fadeIn(duration: .4.seconds).slideY(
                        begin: 4,
                        curve: Curves.easeOutQuart,
                        delay: (100 + (index * 100)).milliseconds,
                      ),
                ),
              ),
              error: (error, stackTrace) => const Text('Something went wrong'),
              loading: () => ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: LoadingSkeleton(height: 64),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SentSuggestionItem extends StatelessWidget {
  const _SentSuggestionItem({required this.suggestion});
  final UserSuggestion suggestion;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: context.onSurface.withOpacity(0.8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _SentSuggestionItemMedia(suggestion: suggestion),
            Row(
              children: [
                Text(
                  'Suggested to: ',
                  style: context.titleMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(suggestion.suggesterName),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SentSuggestionItemMedia extends ConsumerWidget {
  const _SentSuggestionItemMedia({required this.suggestion});

  final UserSuggestion suggestion;

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
