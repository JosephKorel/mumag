import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/fab.dart';
import 'package:mumag/common/widgets/profile/content.dart';
import 'package:mumag/common/widgets/profile/main.dart';
import 'package:mumag/common/widgets/profile/profile_rating_stats.dart';
import 'package:mumag/common/widgets/suggestion/main.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';
import 'package:mumag/features/view_profile/presentation/ui/social.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ViewUserProfileView extends ConsumerWidget {
  const ViewUserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(viewingUserProfileProvider);

    return user.when(
      data: (data) => ProfileContainer(
        user: data,
        floatingActionButton: user.isLoading
            ? null
            : AnimatedFAB(
                show: true,
                onPressed: () => showAppBottomSheet(
                  context,
                  child: const SuggestionContainer(),
                  height: context.deviceHeight / 2,
                ),
                child: Icon(
                  PhosphorIcons.paperPlaneTilt(PhosphorIconsStyle.bold),
                ),
              ),
        child: Column(
          children: [
            ProfilePicture(data.avatarUrl),
            const SizedBox(
              height: 8,
            ),
            DisplayUsername(name: data.name),
            const SizedBox(
              height: 8,
            ),
            const ViewingProfileSocial(),
            const SizedBox(
              height: 8,
            ),
            ProfileBadgeGenres(
              genres: data.genres.sublist(0, 5),
            ),
            const SizedBox(
              height: 8,
            ),
            const _Ratings(),
          ],
        ),
      ),
      error: (error, stackTrace) => const Scaffold(),
      loading: ProfileLoadingScreen.new,
    );
  }
}

class _Ratings extends ConsumerWidget {
  const _Ratings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(viewingUserProfileProvider).requireValue;

    return SizedBox(
      height: user.ratings.isEmpty ? null : context.deviceHeight / 2.5,
      width: double.infinity,
      child: ProfileRatings(ratings: user.ratings),
    );
  }
}
