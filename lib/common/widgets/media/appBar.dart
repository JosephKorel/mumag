import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';

class MediaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MediaAppBar({required this.title, required this.actions, super.key});

  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title).animate().fadeIn(),
      leading: IconButton(
        onPressed: context.pop,
        icon: const Icon(Icons.arrow_back),
      )
          .animate()
          .slideX(begin: -4, duration: .5.seconds, curve: Curves.easeOutQuint),
      backgroundColor: context.primary.withOpacity(0.8),
      foregroundColor: context.onPrimary,
      actions: actions,
    );
  }
}

class RatingAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const RatingAppBar({
    required this.close,
    required this.ratingParams,
    super.key,
  });

  final void Function() close;
  final RatingBaseParams ratingParams;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratingProvider = ref.watch(rateMediaProvider);
    final userId = ref.watch(localUserProvider)!.id;
    final insertRatingEvent =
        InsertRatingParams(userId: userId, insertParams: ratingParams);

    Future<void> confirmRating() async {
      await ref.read(rateMediaProvider.notifier)(event: insertRatingEvent);
      close();
    }

    return AppBar(
      backgroundColor: context.primary,
      foregroundColor: context.onPrimary,
      title: Text(RatingValue.values[ratingParams.rating - 1].label)
          .animate()
          .fadeIn(),
      leading: IconButton(onPressed: close, icon: const Icon(Icons.clear))
          .animate()
          .slideX(begin: -4, duration: .5.seconds, curve: Curves.easeOutQuint),
      actions: [
        ElevatedButton.icon(
          onPressed: ratingProvider.isLoading ? null : confirmRating,
          icon: const Icon(Icons.check),
          label: Text('Rate ${ratingParams.type.label.toLowerCase()}'),
        )
            .animate()
            .slideX(begin: 4, duration: .5.seconds, curve: Curves.easeOutQuint),
      ],
    );
  }
}
