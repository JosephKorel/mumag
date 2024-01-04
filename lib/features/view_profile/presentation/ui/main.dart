import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/widgets/profile/content.dart';
import 'package:mumag/common/widgets/profile/main.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/profile/presentation/providers/social.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';

class ViewUserProfileView extends ConsumerWidget {
  const ViewUserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(viewingUserProfileProvider);
    final offset = ref.watch(scrollOffsetProvider);
    final socialAsyncValue = ref.watch(mySocialRelationsProvider);

    void onScroll(double offset) =>
        ref.read(scrollOffsetProvider.notifier).onScroll(offset);

    return ProfileContainer(
      user: user,
      offset: offset,
      child: ProfileMainView(
        currentUserProfile: false,
        user: user,
        socialAsyncValue: socialAsyncValue,
        onScroll: onScroll,
        children: const [
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
