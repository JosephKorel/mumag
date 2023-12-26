import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/success_events/success_events.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/common/widgets/background_icon.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/rating_bars.dart';
import 'package:mumag/common/widgets/rating_bottom_sheet.dart';
import 'package:mumag/features/track_view/presentation/providers/rating.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';

class TrackRatingButtonContainer extends StatelessWidget {
  const TrackRatingButtonContainer({required this.child, super.key});

  final Widget child;

  Future<bool> _onConfirm(int value, WidgetRef ref) async {
    final result = await ref.read(rateTrackProvider(rateValue: value)).run();
    return result.fold((l) => false, (r) {
      ref.invalidate(trackRatingProvider);

      return true;
    });
  }

  void _showToast(WidgetRef ref) => ref
      .read(toastMessageProvider.notifier)
      .onSuccessEvent(successEvent: InsertRatingSuccess());

  void onPressed(BuildContext context, WidgetRef ref) {
    showAppBottomSheet(
      context,
      child: RatingBottomSheet(
        onConfirm: (val) => _onConfirm(val, ref),
        type: RatingType.track,
        showToast: () => _showToast(ref),
      ),
      height: 360,
    );
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class FirstTimeTrackRating extends ConsumerWidget {
  const FirstTimeTrackRating({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ancestorWidget =
        context.findAncestorWidgetOfExactType<TrackRatingButtonContainer>();

    return FilledButton(
      onPressed: () => ancestorWidget?.onPressed(context, ref),
      child: const Text('Be the first one to rate it!'),
    );
  }
}

class TrackRatingContainer extends StatelessWidget {
  const TrackRatingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const BackgroundIcon(icon: Icons.star),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Rating Distribution',
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Expanded(child: TrackRatingBars()),
      ],
    );
  }
}

class TrackRatingBars extends ConsumerWidget {
  const TrackRatingBars({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(trackRatingProvider);

    return rating.when(
      data: (data) {
        if (data == null) {
          return const RatingBarsError();
        }

        if (data.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Seems like no one has rated this track yet',
                  style: context.titleMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                const TrackRatingButtonContainer(
                  child: FirstTimeTrackRating(),
                ),
              ],
            ),
          );
        }

        return SizedBox.expand(
          child: RatingBars(scoreList: data.map((e) => e.rating).toList()),
        );
      },
      error: (error, stackTrace) => const RatingBarsError(),
      loading: RatingBarsLoading.new,
    );
  }
}
