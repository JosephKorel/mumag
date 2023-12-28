import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/profile/content.dart';
import 'package:mumag/common/widgets/profile/main.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/profile/presentation/ui/profile_menu.dart';
import 'package:mumag/features/profile/presentation/ui/user_albums.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.primary.withOpacity(0.4),
        actions: const [ProfileMenuButton()],
      ),
      user: user,
      offset: offset,
      child: ProfileMainView(
        currentUserProfile: true,
        updateGenres: updateGenres,
        user: user.requireValue!,
        onScroll: onScroll,
        children: const [
          SizedBox(
            height: 16,
          ),
          SavedAlbumsView(),
        ],
      ),
    );
  }
}
