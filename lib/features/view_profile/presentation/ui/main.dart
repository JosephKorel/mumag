import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
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
        appBarActions: const [
          _SendSuggestion(),
          SizedBox(
            width: 8,
          ),
        ],
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

class _SendSuggestion extends StatelessWidget {
  const _SendSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() => showAppBottomSheet(
          context,
          child: const SuggestionContainer(),
          height: context.deviceHeight / 2,
        );

    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: context.onPrimary,
        foregroundColor: context.primary,
      ),
      icon: const Icon(PhosphorIconsBold.paperPlaneTilt),
      label: const Text('Send suggestion'),
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
