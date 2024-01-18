import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/spotify_search/providers/search.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_widget.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';

class SuggestionContainer extends StatefulWidget {
  const SuggestionContainer({super.key});

  @override
  State<SuggestionContainer> createState() => _SuggestionContainerState();
}

class _SuggestionContainerState extends State<SuggestionContainer> {
  SuggestionType? type;
  String? selectedMediaId;

  void _onSelect(SuggestionType choice) => setState(() {
        type = choice;
      });

  void _goBack() => setState(() {
        type = null;
      });

  void _handleSelect(String id) => setState(() => selectedMediaId = id);

  @override
  Widget build(BuildContext context) {
    if (type != null) {
      return _SearchContent(
        goBack: _goBack,
        type: type!,
        selectedMediaId: selectedMediaId,
        handleSelect: _handleSelect,
      );
    }

    return _SelectSuggestionType(
      onSelect: _onSelect,
    );
  }
}

class _SelectSuggestionType extends ConsumerWidget {
  const _SelectSuggestionType({required this.onSelect});

  final void Function(SuggestionType choice) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(viewingUserProfileProvider).requireValue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            text: 'Make a suggestion to: ',
            children: [
              TextSpan(
                text: user.name,
                style: context.titleLarge.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
            style: context.titleLarge,
          ),
        ),
        ...SuggestionType.values.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: FilledButton.icon(
              onPressed: () => onSelect(e),
              icon: Icon(e.icon),
              label: Text(e.label),
            ),
          ),
        ),
      ],
    ).animate().slideX(
          begin: -8,
          curve: Curves.easeOutQuint,
          duration: .4.seconds,
        );
  }
}

class _SearchContent extends ConsumerWidget {
  const _SearchContent({
    required this.goBack,
    required this.type,
    required this.selectedMediaId,
    required this.handleSelect,
  });

  final void Function() goBack;
  final SuggestionType type;
  final String? selectedMediaId;
  final void Function(String id) handleSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconButton(onPressed: goBack, icon: const Icon(Icons.arrow_back)),
            RichText(
              text: TextSpan(
                text: 'Suggest a: ',
                children: [
                  TextSpan(
                    text: type.label,
                    style: context.titleLarge.copyWith(
                      color: context.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
                style: context.titleLarge,
              ),
            ),
          ],
        ),
        const _SearchInput(),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          child: _SearchResults(
            type: type,
            selectedMediaId: selectedMediaId,
            handleSelect: handleSelect,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        FilledButton(
          onPressed: selectedMediaId == null ? null : () {},
          child: const Text('Send Suggestion'),
        ),
      ],
    ).animate().slideX(
          begin: 8,
          curve: Curves.easeOutQuint,
          duration: .4.seconds,
        );
  }
}

class _SearchInput extends ConsumerStatefulWidget {
  const _SearchInput();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __SearchInputState();
}

class __SearchInputState extends ConsumerState<_SearchInput> {
  final _controller = TextEditingController();

  void _clear() {
    _controller.clear();
    ref.invalidate(searchMediaProvider);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(searchMediaProvider);

    return TextField(
      onChanged: ref.read(searchMediaProvider.notifier).onSearch,
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Search',
        icon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: _controller.value.text.isEmpty ? null : _clear,
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }
}

class _SearchResults extends ConsumerStatefulWidget {
  const _SearchResults({
    required this.type,
    required this.selectedMediaId,
    required this.handleSelect,
  });

  final SuggestionType type;
  final String? selectedMediaId;
  final void Function(String id) handleSelect;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __SearchResultsState();
}

class __SearchResultsState extends ConsumerState<_SearchResults> {
  static const increaseFactor = 8;
  final ScrollController _controller = ScrollController();
  int _offset = 0;

  void onScrollEnd() {
    if (ref.read(spotifySearchProvider(type: widget.type.type)).isLoading) {
      return;
    }

    _offset += increaseFactor;

    ref
        .read(spotifySearchProvider(type: widget.type.type).notifier)
        .onScrollEnd(type: widget.type.type, offset: _offset);
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
    final results = ref.watch(spotifySearchProvider(type: widget.type.type));

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
          if (results.isLoading && !results.hasValue)
            const SizedBox.shrink()
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: results.requireValue.length,
              itemBuilder: (context, index) {
                final item = SuggestionWidgetEntity.parseList(
                  results.requireValue,
                  widget.type,
                )[index];
                return _SearchResultCard(
                  type: widget.type,
                  data: item,
                  selectedMediaId: widget.selectedMediaId,
                  handleSelect: widget.handleSelect,
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
    required this.type,
    required this.data,
    required this.selectedMediaId,
    required this.handleSelect,
  });

  final SuggestionType type;
  final SuggestionWidgetEntity data;
  final String? selectedMediaId;
  final void Function(String id) handleSelect;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedMediaId == data.spotifyId;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: () => handleSelect(data.spotifyId),
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 52,
          width: context.deviceWidth,
          child: Row(
            children: [
              Container(
                height: isSelected ? double.infinity : 32,
                width: 4,
                decoration: BoxDecoration(
                  color: context.primary.withOpacity(isSelected ? 1 : 0.4),
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
                      style: context.titleMedium.copyWith(
                        color: isSelected ? context.primary : null,
                        fontWeight: isSelected ? FontWeight.w700 : null,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data.description,
                      style: context.bodyMedium.copyWith(
                        color: context.onSurface.withOpacity(0.7),
                        fontStyle: FontStyle.italic,
                      ),
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
