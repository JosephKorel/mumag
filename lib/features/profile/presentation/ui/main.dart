import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/profile/content.dart';
import 'package:mumag/common/widgets/profile/main.dart';
import 'package:mumag/common/widgets/profile/profile_rating_stats.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/profile/presentation/ui/profile_menu.dart';
import 'package:mumag/features/profile/presentation/ui/social.dart';
import 'package:mumag/features/profile/presentation/ui/user_albums.dart';
import 'package:mumag/features/profile/presentation/ui/user_genres.dart';
import 'package:mumag/features/profile/presentation/ui/user_suggestions.dart';

class ContentRating extends ConsumerWidget {
  const ContentRating({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(localUserProvider)!;

    return SizedBox(
      height: user.ratings.isEmpty ? null : context.deviceHeight / 2.5,
      width: double.infinity,
      child: ProfileRatings(ratings: user.ratings),
    );
  }
}

class UserAvatarWidget extends ConsumerWidget {
  const UserAvatarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(localUserProvider)!;

    return ProfilePicture(user.avatarUrl);
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UserAvatarWidget(),
        SizedBox(
          height: 8,
        ),
        UserSocialRelationsWidget(),
        SizedBox(
          height: 8,
        ),
        UserProfileGenres(),
        SizedBox(
          height: 16,
        ),
        ContentRating(),
        SizedBox(
          height: 16,
        ),
        SavedAlbumsView(),
      ],
    );
  }
}

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(userProvider);
    final cachedUser = ref.watch(localUserProvider);
    final offset = ref.watch(scrollOffsetProvider);

    if (cachedUser == null && asyncUser.isLoading) {
      return const ProfileLoadingScreen();
    }

    if (asyncUser.hasError) {
      return const Scaffold();
    }

    void onScroll(double offset) =>
        ref.read(scrollOffsetProvider.notifier).onScroll(offset);

    return UserProfileView(
      user: cachedUser!,
      offset: offset,
      onScroll: onScroll,
      appBarActions: const [ProfileMenuButton()],
      floatingActionButton: const UserSuggestionsFAB(),
      child: ProfileMainView(
        user: cachedUser,
        onScroll: onScroll,
        child: const Content(),
      ),
    );
  }
}
