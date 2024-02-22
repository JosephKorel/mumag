import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/background_icon.dart';
import 'package:mumag/common/widgets/rating_bars.dart';
import 'package:mumag/routes/routes.dart';

const _ratingTypes = [RatingType.artist, RatingType.album, RatingType.track];

class ProfileRatings extends StatelessWidget {
  const ProfileRatings({required this.ratings, super.key});

  final List<RatingEntity> ratings;

  @override
  Widget build(BuildContext context) {
    void onBarTap(int barIndex) {
      context.push(MyRatingsRoute(rating: barIndex + 1).location);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const BackgroundIcon(icon: Icons.star),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Ratings',
              style: context.titleLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        _ProfileRatingStatsContainer(ratings: ratings),
        if (ratings.isNotEmpty) ...[
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: RatingBars(
              scoreList: ratings.map((e) => e.rating).toList(),
              onBarTap: onBarTap,
            ),
          ),
        ],
      ],
    );
  }
}

class _ProfileRatingStatsContainer extends StatelessWidget {
  const _ProfileRatingStatsContainer({required this.ratings});

  final List<RatingEntity> ratings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _ratingTypes
          .map((e) => _RatingStatItem(ratings: ratings, type: e))
          .toList(),
    );
  }
}

class _RatingStatItem extends StatelessWidget {
  const _RatingStatItem({required this.ratings, required this.type});

  final RatingType type;
  final List<RatingEntity> ratings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${ratings.where((element) => element.type == type).length}',
          style: context.titleLarge.copyWith(color: context.primary),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '${type.label}s',
          style: context.titleMedium,
        ),
      ],
    );
  }
}
