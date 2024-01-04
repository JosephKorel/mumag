import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/widgets/loading.dart';

typedef SocialAsyncValue
    = AsyncValue<Either<AppException, UserSocialRelations>>;

class UserSocialRelationsWidget extends ConsumerWidget {
  const UserSocialRelationsWidget({required this.socialAsyncValue, super.key});

  final SocialAsyncValue socialAsyncValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      children: [
        LoadingSkeleton(
          height: 40,
          width: 80,
        ),
        SizedBox(
          width: 16,
        ),
        LoadingSkeleton(
          height: 40,
          width: 80,
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
