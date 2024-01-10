import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/spotify_search/providers/search.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';

class SuggestionContainer extends StatefulWidget {
  const SuggestionContainer({super.key});

  @override
  State<SuggestionContainer> createState() => _SuggestionContainerState();
}

class _SuggestionContainerState extends State<SuggestionContainer> {
  SuggestionType? type;

  void _onSelect(SuggestionType choice) => setState(() {
        type = choice;
      });

  void _goBack() => setState(() {
        type = null;
      });

  @override
  Widget build(BuildContext context) {
    if (type != null) {
      return _SearchContent(
        goBack: _goBack,
        type: type!,
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
  const _SearchContent({required this.goBack, required this.type});

  final void Function() goBack;
  final SuggestionType type;

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
        FilledButton(onPressed: () {}, child: const Text('Send Suggestion')),
      ],
    ).animate().slideX(
          begin: 8,
          curve: Curves.easeOutQuint,
          duration: .4.seconds,
        );
  }
}

class _SearchInput extends ConsumerWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(searchMediaProvider);

    return TextField(
      onChanged: ref.read(searchMediaProvider.notifier).onSearch,
      decoration: const InputDecoration(
        hintText: 'Search',
        icon: Icon(Icons.search),
      ),
    );
  }
}
