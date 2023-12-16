import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/success_events/success_events.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/fab.dart';
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

    void showToast() => ref
        .read(toastMessageProvider.notifier)
        .onSuccessEvent(successEvent: InsertRatingSuccess());

    Future<bool> onConfirm(int value) async {
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

      if (ratingHandler.hasError) {
        return false;
      }
      ref.invalidate(albumRatingProvider);

      return true;
    }

    if (hasRated) {
      final rating = user.ratings
          .firstWhere((element) => element.spotifyId == album.id)
          .rating;

      return AnimatedFAB(
        show: !viewingRating,
        onPressed: () => showAppBottomSheet(
          context,
          child: RatingBottomSheet(
            loading: ratingHandler.isLoading,
            onConfirm: onConfirm,
            type: RatingType.album,
            showToast: showToast,
          ),
          height: 360,
        ),
        loading: false,
        child: Text(
          rating.toString(),
          style: context.titleLarge.copyWith(color: context.onPrimary),
        ),
      );
    }

    return AnimatedFAB(
      onPressed: () => showAppBottomSheet(
        context,
        child: RatingBottomSheet(
          loading: ratingHandler.isLoading,
          onConfirm: onConfirm,
          type: RatingType.album,
          showToast: showToast,
        ),
        height: 360,
      ),
      show: !viewingRating,
      loading: false,
      child: const Icon(Icons.star),
    );
  }
}
