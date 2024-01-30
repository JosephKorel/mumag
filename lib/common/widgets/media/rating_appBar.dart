import 'package:flutter/material.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';

class RatingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RatingAppBar({
    required this.close,
    required this.onRate,
    required this.loading,
    required this.rating,
    super.key,
  });

  final void Function() close;
  final Future<void> Function() onRate;
  final bool loading;
  final RatingType rating;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.primary,
      foregroundColor: context.onPrimary,
      title: Text(rating.label),
      leading: IconButton(onPressed: close, icon: const Icon(Icons.clear)),
    );
  }
}
