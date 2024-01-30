import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/common/widgets/rating_header.dart';

class MediaContentRating extends ConsumerWidget {
  const MediaContentRating({
    required this.spotifyId,
    required this.type,
    super.key,
  });

  final String spotifyId;
  final RatingType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(mediaRatingProvider(spotifyId: spotifyId));

    return rating.when(
      data: (data) {
        if (data == null) {
          return const _MediaContentRatingError();
        }

        return MediaContentRatingLoaded(
          rating: data,
          type: type,
        );
      },
      error: (error, stackTrace) => const _MediaContentRatingError(),
      loading: _MediaContentRatingLoading.new,
    );
  }
}

class _MediaContentRatingError extends StatelessWidget {
  const _MediaContentRatingError();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.error_outline,
          size: 36,
          color: context.error,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Could not get ratings',
          style: context.titleLarge,
        ),
      ],
    );
  }
}

class _MediaContentRatingLoading extends StatelessWidget {
  const _MediaContentRatingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoadingSkeleton(
          height: 40,
          width: 80,
        ),
        SizedBox(
          height: 16,
        ),
        LoadingSkeleton(
          height: 30,
          width: 180,
        ),
      ],
    );
  }
}

class MediaContentRatingLoaded extends ConsumerWidget {
  const MediaContentRatingLoaded({
    required this.rating,
    required this.type,
    super.key,
  });

  final RatingType type;
  final List<RatingEntity> rating;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (rating.isEmpty) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => index)
                .map(
                  (e) => Icon(
                    Icons.star_outline,
                    size: 28,
                    color: context.onSurface.withOpacity(0.6),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'This ${type.label.toLowerCase()} has no ratings yet',
            style: context.bodyMedium
                .copyWith(color: context.onSurface.withOpacity(0.6)),
          ),
        ],
      );
    }

    final value = rating.fold(
          0,
          (previousValue, element) => previousValue += element.rating,
        ) /
        rating.length;

    return Column(
      children: [
        RatingHeader(rating: value, numberOfRatings: 8),
        Row(
          children: [
            Text(
              '$value',
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              ratingLabel(value),
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }
}
