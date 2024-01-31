import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';
import 'package:mumag/common/services/social_relations/providers/local_data.dart';
import 'package:mumag/common/services/social_relations/providers/social.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/features/profile/presentation/providers/social.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';
import 'package:mumag/routes/routes.dart';

class UserSocialRelationsWidget extends ConsumerWidget {
  const UserSocialRelationsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialAsyncValue = ref.watch(mySocialRelationsProvider);

    if (socialAsyncValue.hasError) {
      return const _ErrorState();
    }

    return const _LoadedState();
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialRelationsBadge(label: 'Followers: !', loading: false),
        SizedBox(
          width: 16,
        ),
        SocialRelationsBadge(label: 'Following: !', loading: false),
      ],
    );
  }
}

class _LoadedState extends ConsumerWidget {
  const _LoadedState();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final socialAsyncValue = ref.watch(mySocialRelationsProvider);
    final relations = ref.watch(userRelationsProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialRelationsBadge(
          loading: false,
          label: 'Followers: ${relations.followers.length}',
          onTap: () => showAppBottomSheet(
            context,
            child: const FollowersList(),
            height: context.deviceHeight / 2,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        SocialRelationsBadge(
          loading: false,
          label: 'Following: ${relations.following.length}',
          onTap: () => showAppBottomSheet(
            context,
            child: const FollowingList(),
            height: context.deviceHeight / 2,
          ),
        ),
      ],
    );
  }
}

class SocialRelationsBadge extends StatelessWidget {
  const SocialRelationsBadge({
    required this.label,
    required this.loading,
    this.onTap,
    super.key,
  });

  final String label;
  final bool loading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 120,
        height: 38,
        decoration: BoxDecoration(
          color: context.onSurface.withOpacity(0.1),
          borderRadius: BorderRadius.circular(48),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(48),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(
          target: loading ? 1 : 0,
          onComplete: (controller) =>
              loading ? controller.repeat() : controller.stop(),
        )
        .shimmer(duration: 1.seconds);
  }
}

class FollowersList extends ConsumerWidget {
  const FollowersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followers = ref
        .watch(
          userRelationsProvider,
        )
        .followers;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Followers',
          style: context.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        if (followers.isEmpty)
          Text(
            'You have no followers yet',
            textAlign: TextAlign.center,
            style: context.titleMedium,
          )
        else
          Expanded(
            child: ListView.builder(
              itemCount: followers.length,
              itemBuilder: (context, index) =>
                  _FollowerUserTile(user: followers[index]),
            ),
          ),
      ],
    );
  }
}

class _FollowerUserTile extends ConsumerWidget {
  const _FollowerUserTile({required this.user});
  final SocialUserSimple user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        CachedImage(url: user.avatarUrl),
        Expanded(child: Text(user.name)),
        const Icon(Icons.arrow_outward),
      ],
    );
  }
}

class FollowingList extends ConsumerWidget {
  const FollowingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(viewingUserIdProvider);

    final following = ref
        .watch(
          userRelationsProvider,
        )
        .following;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Following',
          style: context.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        if (following.isEmpty)
          Text(
            'You are not following anyone yet',
            textAlign: TextAlign.center,
            style: context.titleMedium,
          )
        else
          Expanded(
            child: ListView.builder(
              itemCount: following.length,
              itemBuilder: (context, index) => _FollowingUserTile(
                user: following[index],
              ),
            ),
          ),
      ],
    );
  }
}

class _FollowingUserTile extends ConsumerWidget {
  const _FollowingUserTile({required this.user});
  final SocialUserSimple user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialHandler = ref.watch(socialHandlerProvider);
    final currentUserId = ref.watch(localUserProvider)!.id;

    Future<void> unfollow() async {
      await ref.read(socialHandlerProvider.notifier).onAction(
        UnfollowUserEvent(
          currentUserId: currentUserId,
          followingUserId: user.id,
        ),
        () async {
          await Future.value(ref.refresh(mySocialRelationsProvider));
        },
      );
    }

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        ref.read(viewingUserIdProvider.notifier).selectUser(user.id);
        context.push(const ViewUserRoute().location);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            clipBehavior: Clip.hardEdge,
            child: CachedImage(
              url: user.avatarUrl,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  user.name,
                  style: context.titleMedium,
                ),
                const SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_outward,
                  color: context.onSurface.withOpacity(0.8),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: socialHandler.isLoading ? null : unfollow,
            child: const Text('Unfollow'),
          ),
        ],
      ),
    );
  }
}
