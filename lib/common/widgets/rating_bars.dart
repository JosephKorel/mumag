import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';

class RatingBars extends StatefulWidget {
  const RatingBars({required this.scoreList, super.key});

  final List<int> scoreList;

  @override
  State<RatingBars> createState() => _RatingBarsState();
}

class _RatingBarsState extends State<RatingBars> {
  final _scoreCount = {for (final e in RatingValue.values) e.name: 0};

  void _feedScores() {
    for (final score in widget.scoreList) {
      final scoreLabel =
          RatingValue.values.singleWhere((element) => element.score == score);
      _scoreCount[scoreLabel.name] = _scoreCount[scoreLabel.name]! + 1;
    }
  }

  @override
  void initState() {
    super.initState();
    _feedScores();
  }

  @override
  Widget build(BuildContext context) {
    final greatestValue = Map<String, int>.fromEntries(
      _scoreCount.entries.toList()
        ..sort(
          (a, b) => b.value.compareTo(a.value),
        ),
    ).values.first;

    final scores = _scoreCount.values.toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: scores
              .mapIndexed(
                (i, e) => Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RatingQuantity(quantity: e),
                    TweenAnimationBuilder(
                      tween: Tween(
                        begin: 0,
                        end: _barHeight(height, greatestValue, e),
                      ),
                      curve: Curves.easeOutCirc,
                      duration: 2.seconds,
                      builder: (context, value, child) => Container(
                        height: value.toDouble(),
                        width: 40,
                        decoration: BoxDecoration(color: context.primary),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      RatingValue.values[i].label,
                      style: context.titleMedium
                          .copyWith(color: context.onSurface.withOpacity(0.8)),
                    ),
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class RatingBarsLoading extends StatelessWidget {
  const RatingBarsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    _barLoadingHeightValues.shuffle();

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            5,
            (index) => Container(
              height: height * _barLoadingHeightValues[index],
              width: 40,
              decoration: BoxDecoration(
                color: context.onSurface.withOpacity(0.2),
              ),
            )
                .animate(
                  onComplete: (controller) => controller.repeat(),
                )
                .shimmer(duration: 1.seconds),
          ),
        );
      },
    );
  }
}

class RatingBarsError extends StatelessWidget {
  const RatingBarsError({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.onSurface.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_amber,
                size: 48,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Something went wrong when loading ratings',
                style:
                    context.titleMedium.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ).animate().fadeIn(),
        ),
      ),
    );
  }
}

class RatingQuantity extends StatelessWidget {
  const RatingQuantity({required this.quantity, super.key});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: context.primaryContainer,
      labelStyle: context.titleMedium.copyWith(
        fontWeight: FontWeight.w600,
        color: context.onPrimaryContainer,
      ),
      label: Text(
        '$quantity',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ).animate().fadeIn().slideY(
          begin: -4,
          duration: .8.seconds,
          curve: Curves.bounceOut,
        );
  }
}

double _barHeight(double maxHeight, int greatestScore, int scoreCount) {
  final percentage = (scoreCount * maxHeight * .68) / greatestScore;
  return percentage == 0 ? 10 : percentage;
}

final _barLoadingHeightValues = [.6, .8, .4, .2, .5];
