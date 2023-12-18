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
                    Text(
                      '$e',
                      style: context.titleMedium
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TweenAnimationBuilder(
                      tween: Tween(
                        begin: 0,
                        end: barHeight(height, greatestValue, e),
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

double barHeight(double maxHeight, int greatestScore, int scoreCount) {
  final percentage = (scoreCount * maxHeight * .78) / greatestScore;
  return percentage == 0 ? 10 : percentage;
}
