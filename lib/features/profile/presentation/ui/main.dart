import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/profile/main.dart';
import 'package:mumag/common/widgets/profile/profile_rating_stats.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/profile/presentation/ui/profile_menu.dart';
import 'package:mumag/features/profile/presentation/ui/social.dart';
import 'package:mumag/features/profile/presentation/ui/user_albums.dart';
import 'package:mumag/features/profile/presentation/ui/user_genres.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            PhosphorIcon(
              PhosphorIcons.package(),
            )
                .animate(
                  onComplete: (controller) => controller.repeat(reverse: true),
                )
                .moveY(
                  end: -2,
                  begin: 2,
                  curve: Curves.easeOut,
                  duration: 1.seconds,
                ),
            const SizedBox(
              width: 8,
            ),
            const Text('Suggestions (1)'),
          ],
        ),
      ),
      children: [
        const SizedBox(
          height: 8,
        ),
        const UserSocialRelationsWidget(),
        const SizedBox(
          height: 8,
        ),
        const UserProfileGenres(),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height:
              cachedUser.ratings.isEmpty ? null : context.deviceHeight / 2.5,
          width: double.infinity,
          child: ProfileRatings(ratings: cachedUser.ratings),
        ),
        const SizedBox(
          height: 16,
        ),
        const SavedAlbumsView(),
      ],
    );

    /*   void onScroll(double offset) =>
        ref.read(scrollOffsetProvider.notifier).onScroll(offset);


    return ProfileContainer(
      appBarActions: const [ProfileMenuButton()],
      asyncUser: asyncUser,
      user: cachedUser,
      offset: offset,
      onScroll: onScroll,
      children: cachedUser == null
          ? []
          : [
              const SizedBox(
                height: 8,
              ),
              const UserSocialRelationsWidget(),
              const SizedBox(
                height: 8,
              ),
              const UserProfileGenres(),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: cachedUser.ratings.isEmpty
                    ? null
                    : context.deviceHeight / 2.5,
                width: double.infinity,
                child: ProfileRatings(ratings: cachedUser.ratings),
              ),
              const SizedBox(
                height: 16,
              ),
              const SavedAlbumsView(),
            ],
    ); */
  }
}
