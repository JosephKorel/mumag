import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/loading.dart';
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
          Text(
            'This album has no ratings yet',
            style: context.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('How about being the first?'),
          ),
        ],
      );
    }

    final value = rating.fold(
          0,
          (previousValue, element) => previousValue += element.score,
        ) /
        rating.length;

    return Column(
      children: [
        Text('$value'),
        const SizedBox(
          height: 16,
        ),
        const Text('Masterpiece'),
      ],
    );
  }
}

class RatingFloatingActionButton extends StatelessWidget {
  const RatingFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showAppBottomSheet(
        context,
        child: const RatingBottomSheet(),
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

class RatingBottomSheet extends ConsumerStatefulWidget {
  const RatingBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RatingBottomSheetState();
}

class _RatingBottomSheetState extends ConsumerState<RatingBottomSheet> {
  RatingValue? _rating;
  void _onTap(RatingValue value) {
    setState(() {
      _rating = value;
    });
  }

  Future<void> _onConfirm() async {
    final user = ref.read(userProvider).requireValue!;
    final album = ref.read(viewingAlbumProvider)!;
    final ratingBaseParams = RatingBaseParams(
      type: RatingType.album,
      spotifyId: album.id!,
      rating: _rating!.score,
    );
    final insertRatingParams =
        InsertRatingParams(userId: user.id, insertParams: ratingBaseParams);

    await ref
        .read(ratingHandlerProvider.notifier)
        .call(event: insertRatingParams);

    if (ref.read(ratingHandlerProvider).hasError) {
      return;
    } else {
      ref.invalidate(albumRatingProvider);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ratingHandler = ref.watch(ratingHandlerProvider);
    final ratingButtons = RatingValue.values
        .map(
          (e) => DecoratedBox(
            decoration: BoxDecoration(
              color: _rating == e ? null : context.onSurface.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _rating == e ? context.onSurface : Colors.transparent,
              ),
            ),
            child: InkWell(
              onTap: () => _onTap(e),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Text(
                  e.score.toString(),
                  style: context.titleLarge.copyWith(
                    color: _rating == e ? context.primary : context.onSurface,
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'How would you rate this album?',
          style: context.titleLarge,
        ),
        Expanded(
          child: _rating == null
              ? const SizedBox.expand()
              : Center(
                  child: Text(
                    _rating!.label,
                    style: context.titleLarge,
                  ),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ratingButtons,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilledButton(
              onPressed: context.pop,
              style: FilledButton.styleFrom(
                backgroundColor: context.onSurface.withOpacity(0.2),
                foregroundColor: context.onSurface,
              ),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: _rating == null || ratingHandler.isLoading
                  ? null
                  : _onConfirm,
              child: const Text('Confirm'),
            ),
          ],
        ),
      ],
    );
  }
}
