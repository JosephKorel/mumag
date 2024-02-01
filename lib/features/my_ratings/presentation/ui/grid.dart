import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/features/my_ratings/presentation/ui/item.dart';

class RatingsGrid extends StatelessWidget {
  const RatingsGrid({
    required this.ratings,
    required this.searchValue,
    super.key,
  });

  final List<RatingEntity> ratings;
  final String searchValue;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: ratings.length,
      itemBuilder: (context, index) => RatingGridItem(
        rating: ratings[index],
      ).animate().slide(
            begin: Offset(index.isEven ? -4 : 4, 0),
            duration: .8.seconds,
            curve: Curves.easeOutQuint,
          ),
    );
  }
}
