import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/fab.dart';
import 'package:mumag/common/widgets/rating_bottom_sheet.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';

class RatingAlbumFAB extends ConsumerWidget {
  const RatingAlbumFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ancestorWidget =
        context.findAncestorWidgetOfExactType<RatingButtonContainer>();
    final viewingRating = ref.watch(viewingRatingProvider);
    final album = ref.watch(viewingAlbumProvider)!;
    final user = ref.watch(userProvider).requireValue!;
    final hasRated =
        user.ratings.any((element) => element.spotifyId == album.id);

    if (hasRated) {
      final rating = user.ratings
          .firstWhere((element) => element.spotifyId == album.id)
          .rating;

      return AnimatedFAB(
        show: !viewingRating,
        onPressed: () => ancestorWidget?.onPressed(context, ref),
        child: Text(
          rating.toString(),
          style: context.titleLarge.copyWith(color: context.onPrimary),
        ),
      );
    }

    return AnimatedFAB(
      onPressed: () => ancestorWidget?.onPressed(context, ref),
      show: !viewingRating,
      child: Icon(
        Icons.star,
        color: context.onPrimary,
      ),
    );
  }
}
