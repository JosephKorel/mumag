import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/success_events/success_events.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/album_view/presentation/providers/album.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
    final album = ref.watch(viewingAlbumProvider)!;
    final user = ref.watch(userProvider).requireValue!;
    final hasRated =
        user.ratings.any((element) => element.spotifyId == album.id);

    if (hasRated) {
      final rating = user.ratings
          .firstWhere((element) => element.spotifyId == album.id)
          .rating;

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
        child: Text(
          rating.toString(),
          style: context.titleLarge.copyWith(color: context.onPrimary),
        ),
      );
    }

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
  RatingValue? rating;

  void onTap(RatingValue value) {
    setState(() {
      rating = value;
    });
  }

  Future<void> _onConfirm() async {
    final user = ref.read(userProvider).requireValue!;
    final album = ref.read(viewingAlbumProvider)!;
    final ratingBaseParams = RatingBaseParams(
      type: RatingType.album,
      spotifyId: album.id!,
      rating: rating!.score,
    );
    final insertRatingParams =
        InsertRatingParams(userId: user.id, insertParams: ratingBaseParams);

    await ref
        .read(ratingHandlerProvider.notifier)
        .call(event: insertRatingParams, shouldUpdateUser: true);

    if (ref.read(ratingHandlerProvider).hasError) {
      return;
    } else {
      ref.invalidate(albumRatingProvider);

      if (mounted) {
        context.pop();
        ref
            .read(toastMessageProvider.notifier)
            .onSuccessEvent(successEvent: InsertRatingSuccess());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ratingHandler = ref.watch(ratingHandlerProvider);
    final ratingButtons = RatingValue.values
        .map(
          (e) => RatingButton(rating: rating, onTap: onTap, value: e),
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
          child: SelectedRating(rating: rating),
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
              onPressed:
                  rating == null || ratingHandler.isLoading ? null : _onConfirm,
              child: const Text('Confirm'),
            ),
          ],
        ),
      ],
    );
  }
}

class RatingButton extends StatelessWidget {
  const RatingButton({
    required this.rating,
    required this.onTap,
    required this.value,
    super.key,
  });

  final RatingValue value;
  final RatingValue? rating;
  final void Function(RatingValue val) onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: rating == value ? null : context.onSurface.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: rating == value ? context.onSurface : Colors.transparent,
        ),
      ),
      child: InkWell(
        onTap: () => onTap(value),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Text(
            value.score.toString(),
            style: context.titleLarge.copyWith(
              color: rating == value ? context.primary : context.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedRating extends StatefulWidget {
  const SelectedRating({required this.rating, super.key});

  final RatingValue? rating;

  @override
  State<SelectedRating> createState() => _SelectedRatingState();
}

class _SelectedRatingState extends State<SelectedRating>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Future<void> _repeatAnimation() async {
    await _controller.forward(from: -8);
  }

  @override
  void dispose() {
    dispose();
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: .2.seconds);
  }

  @override
  void didUpdateWidget(covariant SelectedRating oldWidget) {
    super.didUpdateWidget(oldWidget);

    _repeatAnimation();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.rating == null) {
      return const SizedBox.expand();
    }

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhosphorIcon(
            widget.rating!.icon,
            color: context.primary,
            duotoneSecondaryOpacity: .6,
            size: 26,
          )
              .animate(
                controller: _controller,
              )
              .fadeIn()
              .slideX(
                begin: -8,
                duration: .4.seconds,
                curve: Curves.easeOutCirc,
              ),
          const SizedBox(
            width: 8,
          ),
          Text(
            widget.rating!.label,
            style: context.titleLarge
                .copyWith(fontSize: 26, color: context.primary),
          ).animate().fadeIn(duration: .2.seconds),
        ],
      ),
    );
  }
}
