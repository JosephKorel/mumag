import 'package:flutter/material.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';

const _ratingTypes = [RatingType.artist, RatingType.album, RatingType.track];

class ProfileRatingStatsContainer extends StatelessWidget {
  const ProfileRatingStatsContainer({required this.ratings, super.key});

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
