import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/spotify_search/providers/search.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/profile/presentation/providers/suggestions.dart';
import 'package:mumag/features/suggestion/presentation/providers/sent_suggestions.dart';
import 'package:mumag/features/suggestion/presentation/ui/menu.dart';
import 'package:mumag/features/suggestion/presentation/ui/rating.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';
import 'package:mumag/routes/routes.dart';

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
            _SentSuggestionsTab(),
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
    final suggestions = ref
        .watch(userSuggestionsProvider)
        .whereType<ReceivedSuggestion>()
        .where((element) => onlyType != null ? onlyType == element.type : true)
        .toList();

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
              itemBuilder: (context, index) =>
                  _ReceivedSuggestionItem(suggestion: suggestions[index])
                      .animate()
                      .fadeIn(duration: .4.seconds)
                      .slideY(
                        begin: 4,
                        curve: Curves.easeOutQuart,
                        delay: (100 + (index * 100)).milliseconds,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReceivedSuggestionItemMedia extends ConsumerWidget {
  const _ReceivedSuggestionItemMedia({required this.suggestion});

  final ReceivedSuggestion suggestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(viewingUserIdProvider);
    final item = ref.watch(
      searchMediaByIdProvider(
        type: suggestion.type,
        spotifyId: suggestion.spotifyId,
      ),
    );

    return item.when(
      data: (data) => SizedBox(
        height: 68,
        width: context.deviceWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedImage(
                url: data!.imageUrl,
                width: 68,
                height: 68,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    data.name,
                    style: context.bodyMedium
                        .copyWith(fontWeight: FontWeight.w600),
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
                  const SizedBox(
                    height: 4,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.onSurface.withOpacity(0.7),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.person,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              suggestion.sentByName,
                              style: context.bodySmall.copyWith(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingSkeleton(
              height: 52,
              width: 52,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(child: LoadingSkeleton(height: 18)),
          ],
        ),
      ),
    );
  }
}

class _ReceivedSuggestionItem extends ConsumerWidget {
  const _ReceivedSuggestionItem({required this.suggestion});
  final ReceivedSuggestion suggestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void visitUser() {
      ref.read(viewingUserIdProvider.notifier).selectUser(suggestion.sentById);
      context.push(const ViewUserRoute().location);
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: context.onSurface.withOpacity(0.8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _ReceivedSuggestionItemMedia(suggestion: suggestion),
            ),
            SuggestionRatingButtonContainer(
              child: SuggestionMenuButton(suggestion: suggestion),
            ),
          ],
        ),
      ),
    );
  }
}

class _SentSuggestionsTab extends ConsumerStatefulWidget {
  const _SentSuggestionsTab();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __SentSuggestionsTabState();
}

class __SentSuggestionsTabState extends ConsumerState<_SentSuggestionsTab> {
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
                itemBuilder: (context, index) =>
                    _SentSuggestionItem(suggestion: data[index]),
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

class _SentSuggestionItemMedia extends ConsumerWidget {
  const _SentSuggestionItemMedia({required this.suggestion});

  final SentSuggestion suggestion;

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

class _SentSuggestionItem extends StatelessWidget {
  const _SentSuggestionItem({required this.suggestion});
  final SentSuggestion suggestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          _SentSuggestionItemMedia(suggestion: suggestion),
          Row(
            children: [
              Text(
                'Suggested by: ',
                style: context.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: Text(suggestion.sentToName),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
