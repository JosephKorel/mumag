import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';

class SuggestionContainer extends StatefulWidget {
  const SuggestionContainer({super.key});

  @override
  State<SuggestionContainer> createState() => _SuggestionContainerState();
}

class _SuggestionContainerState extends State<SuggestionContainer> {
  bool selectedType = false;
  @override
  Widget build(BuildContext context) {
    return const _SelectSuggestionType();
  }
}

class _SelectSuggestionType extends ConsumerWidget {
  const _SelectSuggestionType();

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
              onPressed: () {},
              icon: Icon(e.icon),
              label: Text(e.label),
            ),
          ),
        ),
      ],
    );
  }
}
