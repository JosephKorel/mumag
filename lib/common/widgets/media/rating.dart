import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/media/common.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/common/widgets/media/appBar.dart';
import 'package:mumag/common/widgets/media/media_view.dart';
import 'package:mumag/common/widgets/media/suggestion_button.dart';

class MediaView extends StatefulWidget {
  const MediaView({
    required this.media,
    required this.child,
    super.key,
  });

  final MediaEntity media;
  final Widget child;

  @override
  State<MediaView> createState() => _MediaViewState();
}

class _MediaViewState extends State<MediaView> {
  int _ratingValue = 0;

  void close() {
    setState(() {
      _ratingValue = 0;
    });
  }

  void onRate(int score) {
    setState(() {
      _ratingValue = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = widget.media;
    final ratingParams = RatingBaseParams(
      type: media.type,
      spotifyId: media.spotifyId,
      rating: _ratingValue,
    );

    return MediaContentContainer(
      appBar: _ratingValue > 0
          ? RatingAppBar(
              close: close,
              ratingParams: ratingParams,
            )
          : null,
      appBarTitle: media.name,
      actions: [
        SuggestMediaButton(
          spotifyId: media.spotifyId,
          type: media.type.suggestionType,
        ),
      ],
      headerImageUrl: media.imageUrl,
      mainContent: MediaContentChild(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: MediaContentRating(
              spotifyId: media.spotifyId,
              type: media.type,
              onRate: onRate,
              ratingValue: _ratingValue,
            ),
          ),
          Expanded(child: widget.child),
        ],
      ),
      // fab: const RatingButtonContainer(child: RatingAlbumFAB()),
    );
  }
}

class MediaContentRating extends ConsumerWidget {
  const MediaContentRating({
    required this.spotifyId,
    required this.type,
    required this.onRate,
    required this.ratingValue,
    super.key,
  });

  final String spotifyId;
  final RatingType type;
  final void Function(int ratingValue) onRate;
  final int ratingValue;

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
          onRate: onRate,
          ratingValue: ratingValue,
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
    required this.onRate,
    required this.ratingValue,
    super.key,
  });

  final RatingType type;
  final List<RatingEntity> rating;
  final int ratingValue;
  final void Function(int ratingValue) onRate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (rating.isEmpty) {
      return Material(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => index)
                  .map(
                    (e) => InkWell(
                      onTap: () => onRate(e + 1),
                      borderRadius: BorderRadius.circular(8),
                      child: Icon(
                        ratingValue >= e + 1 ? Icons.star : Icons.star_outline,
                        size: 32,
                        color: ratingValue >= e + 1
                            ? context.primary
                            : context.onSurface.withOpacity(0.6),
                      ),
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
        ),
      );
    }

    final value = rating.fold(
          0,
          (previousValue, element) => previousValue += element.rating,
        ) /
        rating.length;

    return Column(
      children: [
        RatingHeader(rating: value, numberOfRatings: rating.length),
        const SizedBox(
          height: 8,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(labelIcon(value)),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  ratingLabel(value),
                  style: context.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ).animate().fadeIn().slideX(
              begin: -4,
              duration: .4.seconds,
              curve: Curves.easeOutExpo,
            ),
      ],
    );
  }
}

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
    final stars = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
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
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$numberOfRatings reviews',
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: context.background,
          ),
        ),
        stars,
        Text(
          '$numberOfRatings reviews',
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: context.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
