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

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(userProvider);
    final cachedUser = ref.watch(localUserProvider);
    final offset = ref.watch(scrollOffsetProvider);

    void onScroll(double offset) =>
        ref.read(scrollOffsetProvider.notifier).onScroll(offset);

    void updateGenres() {
      final user = ref.read(userProvider).requireValue!;
      final lastUpdateDifference =
          DateTime.now().difference(user.lastUpdatedAt).inDays;
      if (lastUpdateDifference >= 7) {
        ref.read(userProvider.notifier).updateGenres();
      }
    }

    return ProfileContainer(
      appBarActions: const [ProfileMenuButton()],
      asyncUser: asyncUser,
      user: cachedUser,
      offset: offset,
      child: ProfileMainView(
        user: cachedUser,
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
                ProfileGenres(
                  genres: cachedUser.genres.sublist(0, 5),
                  updateGenres: updateGenres,
                ),
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
      ),
    );
  }
}
