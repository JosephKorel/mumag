import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';

class UserProfileGenres extends ConsumerStatefulWidget {
  const UserProfileGenres({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserProfileGenresState();
}

class _UserProfileGenresState extends ConsumerState<UserProfileGenres> {
  void _updateGenres() {
    final user = ref.read(userProvider).requireValue!;
    final lastUpdateDifference =
        DateTime.now().difference(user.lastUpdatedAt).inDays;
    if (lastUpdateDifference >= 7) {
      ref.read(userProvider.notifier).updateGenres();
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Update user genres every 7 days
      _updateGenres();
    });
  }

  @override
  Widget build(BuildContext context) {
    final genres = ref.watch(
      userProvider.select((value) => value.requireValue!.genres.sublist(0, 5)),
    );

    final genresBadges = genres
        .map(
          (e) => Chip(
            label: Text(e.toUpperCase()),
            padding: EdgeInsets.zero,
            labelStyle: context.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: context.onPrimaryContainer,
            ),
            backgroundColor: context.primaryContainer,
          ),
        )
        .toList();

    return Wrap(
      spacing: 2,
      alignment: WrapAlignment.center,
      children: genresBadges,
    );
  }
}
