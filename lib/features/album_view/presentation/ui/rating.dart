import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/success_events/success_events.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/common/widgets/rating_bottom_sheet.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';

class AlbumRating extends ConsumerWidget {
  const AlbumRating({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(albumRatingProvider);
    return rating.when(
      data: (data) {
        if (data == null) {
          return const AlbumRatingError();
        }

        return const AlbumRatingLoaded();
      },
      error: (error, stackTrace) => const AlbumRatingError(),
      loading: AlbumRatingLoading.new,
    );
  }
}

class AlbumRatingError extends StatelessWidget {
  const AlbumRatingError({super.key});

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

class AlbumRatingLoading extends StatelessWidget {
  const AlbumRatingLoading({super.key});

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

class AlbumRatingLoaded extends ConsumerWidget {
  const AlbumRatingLoaded({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(albumRatingProvider).requireValue!;

    if (rating.isEmpty) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => index)
                .map(
                  (e) => Icon(
                    Icons.star_outline,
                    size: 34,
                    color: context.onSurface.withOpacity(0.6),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'This album has no ratings yet',
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
        Text(
          '$value',
          style:
              context.titleLarge.copyWith(color: context.primary, fontSize: 28),
        ),
        Text(
          ratingLabel(value),
          style: context.titleLarge.copyWith(color: context.primary),
        ),
      ],
    );
  }
}

class RatingFloatingActionButton extends ConsumerWidget {
  const RatingFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewingRating = ref.watch(viewingRatingProvider);
    final album = ref.watch(viewingAlbumProvider)!;
    final user = ref.watch(userProvider).requireValue!;
    final hasRated =
        user.ratings.any((element) => element.spotifyId == album.id);
    final ratingHandler = ref.watch(ratingHandlerProvider);
    final buttonAnimations = viewingRating
        ? [
            SlideEffect(
              end: const Offset(0, 8),
              duration: 2.seconds,
              curve: Curves.easeInCirc,
            ),
          ]
        : [
            SlideEffect(
              begin: const Offset(0, 8),
              duration: 2.seconds,
              curve: Curves.easeOutCirc,
            ),
          ];

    Future<void> onConfirm(int value) async {
      final user = ref.read(userProvider).requireValue!;
      final album = ref.read(viewingAlbumProvider)!;
      final ratingBaseParams = RatingBaseParams(
        type: RatingType.album,
        spotifyId: album.id!,
        rating: value,
      );
      final insertRatingParams =
          InsertRatingParams(userId: user.id, insertParams: ratingBaseParams);

      await ref
          .read(ratingHandlerProvider.notifier)
          .call(event: insertRatingParams, shouldUpdateUser: true);

      if (ref.read(ratingHandlerProvider).hasError) {
        throw Error();
      } else {
        ref.invalidate(albumRatingProvider);

        ref
            .read(toastMessageProvider.notifier)
            .onSuccessEvent(successEvent: InsertRatingSuccess());
      }
    }

    if (hasRated) {
      final rating = user.ratings
          .firstWhere((element) => element.spotifyId == album.id)
          .rating;

      return Animate(
        effects: buttonAnimations,
        child: FloatingActionButton(
          onPressed: () => showAppBottomSheet(
            context,
            child: RatingBottomSheet(
              loading: ratingHandler.isLoading,
              onConfirm: onConfirm,
              type: RatingType.album,
            ),
            height: 360,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: context.primary,
          child: Text(
            rating.toString(),
            style: context.titleLarge.copyWith(color: context.onPrimary),
          ),
        ),
      );
    }

    return FloatingActionButton(
      onPressed: () => showAppBottomSheet(
        context,
        child: RatingBottomSheet(
          loading: ratingHandler.isLoading,
          onConfirm: onConfirm,
          type: RatingType.album,
        ),
        height: 360,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: context.primary,
      child: const Icon(Icons.star),
    );
  }
}
