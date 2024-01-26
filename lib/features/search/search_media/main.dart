import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/spotify_search/providers/search.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_widget.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/search/presentation/ui/search_input.dart';

class SearchForMediaView extends StatelessWidget {
  const SearchForMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchInputContainer(),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchMediaView()),
        ],
      ),
    );
  }
}

class SearchInputContainer extends ConsumerWidget {
  const SearchInputContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(searchMediaProvider);

    return SearchInput(
      onChanged: ref.read(searchMediaProvider.notifier).onSearch,
      provider: searchMediaProvider,
    );
  }
}

class SearchMediaView extends ConsumerStatefulWidget {
  const SearchMediaView({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchMediaViewState();
}

class _SearchMediaViewState extends ConsumerState<SearchMediaView> {
  static const increaseFactor = 8;
  final ScrollController _controller = ScrollController();
  int _offset = 0;

  void onScrollEnd() {
    if (ref.read(spotifyFullSearchProvider()).isLoading) {
      return;
    }

    _offset += increaseFactor;

    ref.read(spotifyFullSearchProvider().notifier).onScrollEnd(offset: _offset);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.atEdge && _controller.offset != 0) {
        onScrollEnd();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(spotifyFullSearchProvider());

    if (results.hasError) {
      return const Center(
        child: Icon(Icons.warning),
      );
    }

    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (results.isLoading || !results.hasValue)
            const SizedBox.shrink()
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: SuggestionWidgetEntity.parseDynamicList(
                results.requireValue,
              ).length,
              itemBuilder: (context, index) {
                final item = SuggestionWidgetEntity.parseDynamicList(
                  results.requireValue,
                )[index];
                return _SearchResultCard(
                  data: item,
                );
              },
            ),
          if (results.isLoading)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: LoadingSkeleton(height: 52),
              ),
            ),
        ],
      ),
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({
    required this.data,
  });

  final SuggestionWidgetEntity data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: () => {},
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 52,
          width: context.deviceWidth,
          child: Row(
            children: [
              Container(
                height: 32,
                width: 4,
                decoration: BoxDecoration(
                  color: context.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedImage(
                  url: data.imageUrl,
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
      ),
    );
  }
}
