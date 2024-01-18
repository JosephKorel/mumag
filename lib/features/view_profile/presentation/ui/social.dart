import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';
import 'package:mumag/common/services/social_relations/providers/local_data.dart';
import 'package:mumag/common/services/social_relations/providers/social.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/profile/presentation/providers/social.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';

class ViewingProfileSocial extends ConsumerWidget {
  const ViewingProfileSocial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitingUser = ref.watch(viewingUserProfileProvider).requireValue;
    final currentUser = ref.watch(localUserProvider)!;
    final followingUsers = ref.watch(userRelationsProvider).following;

    final isFollowing = followingUsers.any(
      (element) => element.id == visitingUser.id,
    );

    if (isFollowing) {
      return const Chip(label: Text('Following'));
    }

    final socialHandler = ref.watch(socialHandlerProvider);

    Future<void> onFollow() async {
      await ref.read(socialHandlerProvider.notifier).onAction(
            FollowUserEvent(
              currentUserId: currentUser.id,
              followingUserId: visitingUser.id,
            ),
            null,
          );

      ref.invalidate(mySocialRelationsProvider);
      await ref.read(mySocialRelationsProvider.future);
    }

    return TextButton.icon(
      onPressed: socialHandler.isLoading ? null : onFollow,
      icon: const Icon(Icons.add),
      label: const Text('Follow'),
    );
  }
}
