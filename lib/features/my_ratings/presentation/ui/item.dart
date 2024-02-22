import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/media/common.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/common/widgets/loading.dart';

class RatingGridItem extends ConsumerWidget {
  const RatingGridItem({
    required this.rating,
    required this.index,
    required this.media,
    required this.parentBuiltAt,
    super.key,
  });

  final RatingEntity rating;
  final int index;
  final int parentBuiltAt;
  final MediaEntity media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final builtAt = DateTime.now().millisecondsSinceEpoch;

    final shouldAnimate = builtAt - parentBuiltAt <= 40;

    return _LoadedState(
      rating: rating,
      media: media,
      index: index,
      parentBuiltAt: parentBuiltAt,
    ).animate().slide(
          begin: Offset(
            index.isEven
                ? shouldAnimate
                    ? -4
                    : 0
                : shouldAnimate
                    ? 4
                    : 0,
            0,
          ),
          duration: .8.seconds,
          curve: Curves.easeOutQuint,
        );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingSkeleton(height: double.infinity);
  }
}

class _LoadedState extends StatelessWidget {
  const _LoadedState({
    required this.rating,
    required this.media,
    required this.index,
    required this.parentBuiltAt,
    super.key,
  });

  final MediaEntity media;
  final RatingEntity rating;
  final int index;
  final int parentBuiltAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.background,
        boxShadow: [
          BoxShadow(
            color: context.onSurface.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(index.isEven ? 4 : -4, 4),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: _MediaImage(
              url: media.imageUrl ?? '',
              ratingValue: rating.rating,
              type: rating.type,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                media.name,
                style: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.onSurface.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MediaImage extends StatelessWidget {
  const _MediaImage({
    required this.url,
    required this.ratingValue,
    required this.type,
    super.key,
  });

  final String url;
  final int ratingValue;
  final RatingType type;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            CachedImage(
              url: url,
              height: double.infinity,
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.topRight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.primaryContainer,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(8)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    ratingLabel(
                      ratingValue.toDouble(),
                    ),
                    style: context.bodyMedium.copyWith(
                      color: context.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.primaryContainer,
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    type.icon,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
