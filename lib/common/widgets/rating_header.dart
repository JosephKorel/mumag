import 'package:flutter/material.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';

class RatingHeader extends StatelessWidget {
  const RatingHeader({
    required this.rating,
    required this.numberOfRatings,
    super.key,
  });

  final double rating;
  final int numberOfRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          RatingValue.values.map((e) => Icon(e.rateIcon(rating))).toList(),
    );
  }
}
