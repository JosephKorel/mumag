import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/social_relations/providers/local_data.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/providers/suggestion.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/image.dart';

class SuggestMediaButton extends StatelessWidget {
  const SuggestMediaButton({
    required this.spotifyId,
    required this.type,
    super.key,
  });

  final String spotifyId;
  final SuggestionType type;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      showAppBottomSheet(
        context,
        child: _SuggestionUsers(spotifyId: spotifyId, type: type),
        height: context.deviceHeight / 2,
      );
    }

    return IconButton(onPressed: onPressed, icon: const Icon(Icons.share))
        .animate()
        .slideX(begin: 4, duration: .5.seconds, curve: Curves.easeOutQuint);
  }
}

class _SuggestionUsers extends ConsumerStatefulWidget {
  const _SuggestionUsers({required this.spotifyId, required this.type});

  final String spotifyId;
  final SuggestionType type;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __SuggestionUsersState();
}

class __SuggestionUsersState extends ConsumerState<_SuggestionUsers> {
  final selectedUsers = <int>[];
  bool loading = false;

  void _onSelect(int id) {
    setState(() {
      if (selectedUsers.contains(id)) {
        selectedUsers.remove(id);
      } else {
        selectedUsers.add(id);
      }
    });
  }

  Future<void> _sendSuggestions() async {
    setState(() {
      loading = true;
    });

    final user = ref.read(localUserProvider)!;
    final suggestionsToSend = selectedUsers
        .map(
          (e) => InsertSuggestionParams(
            suggestedBy: user.id,
            suggestedTo: e,
            spotifyId: widget.spotifyId,
            type: widget.type,
          ),
        )
        .toList();

    final result = await ref.read(
      sendManySuggestionsProvider(
        event: InsertManySuggestionsParams(params: suggestionsToSend),
      ).future,
    );

    if (result) {
      if (mounted) {
        context.pop();
      }

      ref
          .read(toastMessageProvider.notifier)
          .onSuccessEvent(successEvent: suggestionsToSend.first.successMsg!);
      return;
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Choose one or more users to send it',
          style: context.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: _UsersList(
            selectedUsers: selectedUsers,
            onSelect: _onSelect,
          ),
        ),
        FilledButton(
          onPressed: selectedUsers.isEmpty || loading ? null : _sendSuggestions,
          child: Text(
            selectedUsers.isEmpty
                ? 'Send to...'
                : 'Send to ${selectedUsers.length} ${selectedUsers.length == 1 ? 'person' : 'people'}',
          ),
        ),
      ],
    );
  }
}

class _UsersList extends ConsumerWidget {
  const _UsersList({required this.selectedUsers, required this.onSelect});
  final List<int> selectedUsers;
  final void Function(int id) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userRelationsProvider);
    return ListView.builder(
      itemCount: users.following.length,
      itemBuilder: (context, index) {
        final user = users.following[index];
        final selected = selectedUsers.contains(user.id);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: _ResultCard(
            selected: selected,
            user: user,
            onSelect: onSelect,
          ),
        );
      },
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.selected,
    required this.user,
    required this.onSelect,
  });

  final bool selected;
  final SocialUserSimple user;
  final void Function(int id) onSelect;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onSelect(user.id),
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Container(
              height: selected ? double.infinity : 32,
              width: 4,
              decoration: BoxDecoration(
                color: context.primary.withOpacity(selected ? 1 : 0.4),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedImage(
                url: user.avatarUrl,
                width: 52,
                height: 52,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              user.name,
              style: context.titleMedium.copyWith(
                color: selected ? context.primary : null,
                fontWeight: selected ? FontWeight.w700 : null,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
