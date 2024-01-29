import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/common/widgets/rating_header.dart';

/// Main Container that renders the page
class MediaContentContainer extends StatelessWidget {
  const MediaContentContainer({
    required this.appBarTitle,
    required this.headerImageUrl,
    required this.mainContent,
    this.actions,
    super.key,
    this.fab,
  });

  final String appBarTitle;
  final String? headerImageUrl;
  final List<Widget>? actions;
  final Widget mainContent;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: context.primary.withOpacity(0.8),
        foregroundColor: context.onPrimary,
        actions: actions,
      ),
      body: Stack(
        children: [
          MediaContentHeader(url: headerImageUrl),
          Column(
            children: [
              const Expanded(child: SizedBox.expand()),
              Expanded(
                flex: 2,
                child: mainContent,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: fab,
      extendBodyBehindAppBar: true,
    );
  }
}

class MediaContentError extends StatelessWidget {
  const MediaContentError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oops'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.error_outline,
              color: context.error,
              size: 32,
            )
                .animate(
                  onComplete: (controller) => controller.repeat(reverse: true),
                )
                .slideY(
                  begin: .2,
                  duration: 2.seconds,
                  curve: Curves.easeOutQuint,
                ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Something went wrong',
              style: context.titleLarge.copyWith(
                color: context.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MediaContentLoading extends StatelessWidget {
  const MediaContentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoadingSkeleton(height: 300),
          Column(
            children: [
              const Expanded(child: SizedBox.expand()),
              Expanded(
                flex: 3,
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      color: context.background,
                    ),
                    child: const Column(
                      children: [
                        LoadingSkeleton(
                          height: 68,
                          width: 68,
                          borderRadius: 34,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        LoadingSkeleton(
                          height: 18,
                          width: 180,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// The top image of the page
class MediaContentHeader extends StatelessWidget {
  const MediaContentHeader({required this.url, super.key});

  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return const SizedBox.shrink();
    }

    return CachedImage(
      url: url!,
      height: MediaQuery.of(context).size.height / 2.4,
      width: double.infinity,
    );
  }
}

class MediaContentChild extends StatelessWidget {
  const MediaContentChild({
    required this.asyncRating,
    required this.type,
    required this.children,
    super.key,
  });

  final List<Widget> children;
  final RatingType type;
  final AsyncValue<List<RatingEntity>?> asyncRating;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: context.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: MediaContentRating(asyncRating: asyncRating, type: type),
          ),
          ...children,
        ],
      ),
    );
  }
}

class MediaContentRating extends ConsumerWidget {
  const MediaContentRating({
    required this.asyncRating,
    required this.type,
    super.key,
  });

  final RatingType type;
  final AsyncValue<List<RatingEntity>?> asyncRating;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return asyncRating.when(
      data: (data) {
        if (data == null) {
          return const MediaContentRatingError();
        }

        return MediaContentRatingLoaded(
          rating: data,
          type: type,
        );
      },
      error: (error, stackTrace) => const MediaContentRatingError(),
      loading: MediaContentRatingLoading.new,
    );
  }
}

class MediaContentRatingError extends StatelessWidget {
  const MediaContentRatingError({super.key});

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

class MediaContentRatingLoading extends StatelessWidget {
  const MediaContentRatingLoading({super.key});

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
