import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/theme/utils.dart';

class RatingAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const RatingAppBar({
    required this.close,
    required this.loading,
    required this.ratingParams,
    super.key,
  });

  final void Function() close;
  final bool loading;
  final RatingBaseParams ratingParams;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: context.primary,
      foregroundColor: context.onPrimary,
      title: Text(ratingParams.type.label),
      leading: IconButton(onPressed: close, icon: const Icon(Icons.clear)),
    );
  }
}
