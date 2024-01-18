import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/fab.dart';
import 'package:mumag/common/widgets/profile/content.dart';
import 'package:mumag/common/widgets/profile/main.dart';
import 'package:mumag/common/widgets/suggestion/main.dart';
import 'package:mumag/features/profile/presentation/providers/profile.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';
import 'package:mumag/features/view_profile/presentation/ui/social.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ViewUserProfileView extends ConsumerWidget {
  const ViewUserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(viewingUserProfileProvider);
    final offset = ref.watch(scrollOffsetProvider);

    void onScroll(double offset) =>
        ref.read(scrollOffsetProvider.notifier).onScroll(offset);

    return ProfileContainer(
      asyncUser: user,
      user: user.value,
      offset: offset,
      onScroll: onScroll,
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
      children: user.isLoading
          ? []
          : [
              const ViewingProfileSocial(),
              ProfileGenres(genres: user.requireValue.genres.sublist(0, 5)),
              const SizedBox(
                height: 8,
              ),
            ],
    );
  }
}
