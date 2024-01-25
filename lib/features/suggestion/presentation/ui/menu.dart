import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/success_events/success_events.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:mumag/features/suggestion/presentation/providers/viewing_suggestion.dart';
import 'package:mumag/features/suggestion/presentation/ui/rating.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';
import 'package:mumag/routes/routes.dart';

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

  final UserSuggestion suggestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(viewingSuggestionProvider);
    ref.watch(getTrackProvider);
    ref.watch(viewingAlbumProvider);
    ref.watch(viewingUserIdProvider);

    void openRatingBottomSheet() {
      ref.read(viewingSuggestionProvider.notifier).updateState(suggestion);

      final ancestor = context
          .findAncestorWidgetOfExactType<SuggestionRatingButtonContainer>()!;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ancestor.onPressed(context, ref);
      });
    }

    void visitUser() {
      ref
          .read(viewingUserIdProvider.notifier)
          .selectUser(suggestion.suggesterId);
      context.push(const ViewUserRoute().location);
    }

    Future<bool> onDelete() async {
      final deleted = await ref.read(deleteSuggestionProvider.future);

      if (deleted) {
        // Close the dialog
        context.pop();
      }

      ref
          .read(toastMessageProvider.notifier)
          .onSuccessEvent(successEvent: const DeleteSuggestionSuccess());

      return deleted;
    }

    void onSelected(SuggestionMenuOptions item) {
      switch (item) {
        case SuggestionMenuOptions.rate:
          openRatingBottomSheet();
        case SuggestionMenuOptions.viewMedia:
          _visitMedia(context, suggestion, ref);

        case SuggestionMenuOptions.visit:
          visitUser();
        case SuggestionMenuOptions.delete:
          ref.read(viewingSuggestionProvider.notifier).updateState(suggestion);
          _deleteSuggestion(context, ref, suggestion, onDelete);
      }
    }

    return PopupMenuButton<SuggestionMenuOptions>(
      onSelected: onSelected,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      icon: Icon(
        Icons.more_vert,
        color: context.primary,
      ),
      surfaceTintColor: context.background,
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<SuggestionMenuOptions>>[
        if (suggestion.rating == null)
          PopupMenuItem<SuggestionMenuOptions>(
            value: SuggestionMenuOptions.rate,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: context.onBackground.withOpacity(0.6),
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
                color: context.onBackground.withOpacity(0.6),
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
                color: context.onBackground.withOpacity(0.6),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${SuggestionMenuOptions.visit.label} ${suggestion.suggesterName}',
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
                color: context.onBackground.withOpacity(0.6),
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

class _ConfirmDeleteSuggestionButton extends ConsumerStatefulWidget {
  const _ConfirmDeleteSuggestionButton({required this.onDelete});

  final Future<bool> Function() onDelete;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __ConfirmDeleteSuggestionButtonState();
}

class __ConfirmDeleteSuggestionButtonState
    extends ConsumerState<_ConfirmDeleteSuggestionButton> {
  bool loading = false;

  Future<void> _confirm() async {
    setState(() {
      loading = true;
    });
    await widget.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: loading ? null : _confirm,
      style: FilledButton.styleFrom(
        foregroundColor: context.onError,
        backgroundColor: context.error,
      ),
      child: const Text('Remove'),
    );
  }
}

void _visitMedia(
  BuildContext context,
  SuggestionEntity suggestion,
  WidgetRef ref,
) {
  switch (suggestion.type) {
    case SuggestionType.artist:
      return;
    case SuggestionType.album:
      ref
          .read(viewingAlbumProvider.notifier)
          .updateState(albumId: suggestion.spotifyId);
      context.push(const AlbumViewRoute().location);

    case SuggestionType.track:
      ref.read(getTrackProvider.notifier).updateState(suggestion.spotifyId);
      context.push(const TrackViewRoute().location);
  }
}

void _deleteSuggestion(
  BuildContext context,
  WidgetRef ref,
  UserSuggestion suggestion,
  Future<bool> Function() onDelete,
) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Hang On'),
        content: Text(
          "Are you sure you want to remove ${suggestion.suggesterName}'s suggestion?",
        ),
        actions: [
          TextButton(onPressed: context.pop, child: const Text('Cancel')),
          _ConfirmDeleteSuggestionButton(
            onDelete: onDelete,
          ),
        ],
      );
    },
  );
}
