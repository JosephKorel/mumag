import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';

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
    log('$rating');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: RatingValue.values
          .mapIndexed(
            (i, e) => Icon(
              rating.floor() >= i + 1 ? Icons.star : Icons.star_outline,
              color: context.primary,
              size: 28,
            ),
          )
          .toList(),
    );
  }
}
