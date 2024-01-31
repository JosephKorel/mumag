import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/fab.dart';
import 'package:mumag/common/widgets/profile/main.dart';
import 'package:mumag/common/widgets/suggestion/main.dart';
import 'package:mumag/features/view_profile/presentation/providers/view_user.dart';
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
        child: const Text('Ha'),
      ),
      error: (error, stackTrace) => const Scaffold(),
      loading: ProfileLoadingScreen.new,
    );
  }
}
