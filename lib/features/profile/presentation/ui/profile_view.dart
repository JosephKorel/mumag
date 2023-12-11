import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/profile/presentation/ui/user_albums.dart';

class ProfileMainView extends ConsumerStatefulWidget {
  const ProfileMainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileMainViewState();
}

class _ProfileMainViewState extends ConsumerState<ProfileMainView> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        ref
            .read(scrollOffsetProvider.notifier)
            .onScroll(_scrollController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).requireValue!;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            color: context.background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ProfilePicture(),
                Text(
                  user.name,
                  style: context.titleLarge.copyWith(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                const FavoriteGenres(),
                const SizedBox(
                  height: 8,
                ),
                const UserRatingStats(),
                const SizedBox(
                  height: 16,
                ),
                const SavedAlbumsView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePicture extends ConsumerWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImg = ref.watch(
      userProvider.select((value) => value.requireValue!.avatarUrl),
    );

    if (profileImg == null) {
      return Center(
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const Icon(
            Icons.person,
            size: 52,
          ),
        ),
      );
    }

    return Center(
      child: CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(profileImg),
      ),
    );
  }
}

class UserRatingStats extends ConsumerWidget {
  const UserRatingStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratings = ref.watch(
      userProvider.select((value) => value.requireValue!.ratings),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Ratings',
          style: context.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  '${ratings.where((element) => element.type == RatingType.artist).length}',
                  style: context.titleLarge.copyWith(color: context.primary),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  RatingType.artist.label,
                  style: context.titleMedium,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '${ratings.where((element) => element.type == RatingType.album).length}',
                  style: context.titleLarge.copyWith(color: context.primary),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  RatingType.album.label,
                  style: context.titleMedium,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '${ratings.where((element) => element.type == RatingType.track).length}',
                  style: context.titleLarge.copyWith(color: context.primary),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  RatingType.track.label,
                  style: context.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class FavoriteGenres extends ConsumerWidget {
  const FavoriteGenres({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(
      userProvider.select((value) => value.requireValue!.genres),
    );

    final genresBadges = genres
        .map(
          (e) => DecoratedBox(
            decoration: BoxDecoration(
              color: context.primary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: context.primary.withOpacity(0.4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                e.toUpperCase(),
                style: context.bodyMedium.copyWith(
                  color: context.onPrimary,
                ),
              ),
            ),
          ),
        )
        .toList();

    return Wrap(
      runSpacing: 8,
      spacing: 8,
      alignment: WrapAlignment.center,
      children: genresBadges,
    );
  }
}
