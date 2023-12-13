import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RatingBottomSheet extends StatefulWidget {
  const RatingBottomSheet({
    required this.type,
    required this.onConfirm,
    required this.loading,
    super.key,
  });

  final RatingType type;
  final bool loading;
  final Future<void> Function(int rateValue) onConfirm;

  @override
  State<RatingBottomSheet> createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  RatingValue? rating;

  void onTap(RatingValue value) {
    setState(() {
      rating = value;
    });
  }

  Future<void> _onConfirm() async {
    try {
      await widget.onConfirm(rating!.score);
      if (mounted) {
        context.pop();
      }
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final type = widget.type.label;
    final ratingButtons = RatingValue.values
        .map(
          (e) => RatingButton(rating: rating, onTap: onTap, value: e),
        )
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'How would you rate this ${type.toLowerCase()}?',
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
              onPressed: rating == null || widget.loading ? null : _onConfirm,
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
