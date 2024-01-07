import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/profile/presentation/providers/social.dart';

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
        Chip(
          label: Text('Followers: ${relations.followers.length}'),
        ),
        const SizedBox(
          width: 16,
        ),
        Chip(
          label: Text('Following: ${relations.following.length}'),
        ),
      ],
    );
  }
}
