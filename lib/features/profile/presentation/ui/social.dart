import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';
import 'package:mumag/common/services/social_relations/providers/social.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/profile/presentation/providers/social.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';
import 'package:mumag/routes/routes.dart';

class UserSocialRelationsWidget extends ConsumerStatefulWidget {
  const UserSocialRelationsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserSocialRelationsWidgetState();
}

class _UserSocialRelationsWidgetState
    extends ConsumerState<UserSocialRelationsWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(userProvider.notifier).getSocialRelations();
  }

  @override
  Widget build(BuildContext context) {
    final socialAsyncValue = ref.watch(mySocialRelationsProvider);

    return socialAsyncValue.when(
      data: (data) => data.fold(
        (l) => const _ErrorState(),
        (r) => _LoadedState(relations: r),
      ),
      error: (error, stackTrace) => const _ErrorState(),
      loading: _LoadingState.new,
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Chip(
          label: Row(
            children: [
              Text('Followers: '),
              LoadingSkeleton(
                height: 16,
                width: 16,
                borderRadius: 4,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Chip(
          label: Row(
            children: [
              Text('Following: '),
              LoadingSkeleton(
                height: 16,
                width: 16,
                borderRadius: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Chip(label: Text('Followers: !')),
        SizedBox(
          width: 16,
        ),
        Chip(label: Text('Following: !')),
      ],
    );
  }
}

class _LoadedState extends StatelessWidget {
  const _LoadedState({required this.relations});

  final UserSocialRelations relations;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          child: Container(
            width: 120,
            height: 38,
            decoration: BoxDecoration(
              color: context.onSurface.withOpacity(0.1),
              borderRadius: BorderRadius.circular(48),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(48),
              onTap: () => showAppBottomSheet(
                context,
                child: const FollowersList(),
                height: context.deviceHeight / 2,
              ),
              child: Center(
                child: Text(
                  'Followers: ${relations.followers.length}',
                  style:
                      context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Material(
          child: Container(
            width: 120,
            height: 38,
            decoration: BoxDecoration(
              color: context.onSurface.withOpacity(0.1),
              borderRadius: BorderRadius.circular(48),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(48),
              onTap: () => showAppBottomSheet(
                context,
                child: const FollowingList(),
                height: context.deviceHeight / 2,
              ),
              child: Center(
                child: Text(
                  'Following: ${relations.following.length}',
                  style:
                      context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FollowersList extends ConsumerWidget {
  const FollowersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followers = ref.watch(
      userProvider
          .select((value) => value.requireValue!.socialRelations.followers),
    );
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

    final following = ref.watch(
      userProvider
          .select((value) => value.requireValue!.socialRelations.following),
    );
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
              itemBuilder: (context, index) =>
                  _FollowingUserTile(user: following[index]),
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
    final currentUserId = ref.watch(userProvider).requireValue!.id;
    void unfollow() {
      ref.read(socialHandlerProvider.notifier).onAction(
            UnfollowUserEvent(
              currentUserId: currentUserId,
              followingUserId: user.id,
            ),
            ref.read(userProvider.notifier).getSocialRelations,
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
