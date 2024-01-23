import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/suggestion/presentation/providers/viewing_suggestion.dart';
import 'package:mumag/features/suggestion/presentation/ui/rating.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';

enum SuggestionMenuOptions {
  rate('Rate'),
  viewMedia('View'),
  visit('Visit'),
  delete('Remove');

  const SuggestionMenuOptions(this.label);

  final String label;
}

class SuggestionMenuButton extends ConsumerWidget {
  const SuggestionMenuButton({required this.suggestion, super.key});

  final ReceivedSuggestion suggestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(viewingSuggestionProvider);
    ref.watch(viewingTrackProvider);

    void openRatingBottomSheet() {
      ref.read(viewingSuggestionProvider.notifier).updateState(suggestion);

      final ancestor = context
          .findAncestorWidgetOfExactType<SuggestionRatingButtonContainer>()!;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ancestor.onPressed(context, ref);
      });
    }

    void viewMediaPage() {}

    void onSelected(SuggestionMenuOptions item) {
      switch (item) {
        case SuggestionMenuOptions.rate:
          openRatingBottomSheet();
        case SuggestionMenuOptions.viewMedia:
        // context.pushNamed(suggestion.type.)

        case SuggestionMenuOptions.visit:
        //TODO - visit user
        case SuggestionMenuOptions.delete:
        //TODO - open dialog to confirm delete
      }
    }

    return PopupMenuButton<SuggestionMenuOptions>(
      onSelected: onSelected,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      icon: Icon(
        Icons.more_vert,
        color: context.primary,
      ),
      // splashRadius: Material.defaultSplashRadius / 1.5,
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<SuggestionMenuOptions>>[
        PopupMenuItem<SuggestionMenuOptions>(
          value: SuggestionMenuOptions.rate,
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: context.onBackground,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(SuggestionMenuOptions.rate.label),
            ],
          ),
        ),
        PopupMenuItem<SuggestionMenuOptions>(
          value: SuggestionMenuOptions.viewMedia,
          child: Row(
            children: [
              Icon(
                suggestion.type.icon,
                color: context.onBackground,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${SuggestionMenuOptions.viewMedia.label} ${suggestion.type.name}',
              ),
            ],
          ),
        ),
        PopupMenuItem<SuggestionMenuOptions>(
          value: SuggestionMenuOptions.visit,
          child: Row(
            children: [
              Icon(
                Icons.person,
                color: context.onBackground,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${SuggestionMenuOptions.visit.label} ${suggestion.sentByName}',
              ),
            ],
          ),
        ),
        PopupMenuItem<SuggestionMenuOptions>(
          value: SuggestionMenuOptions.delete,
          child: Row(
            children: [
              Icon(
                Icons.close,
                color: context.onBackground,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                SuggestionMenuOptions.delete.label,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
