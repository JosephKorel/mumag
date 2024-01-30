import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/background_icon.dart';
import 'package:mumag/common/widgets/rating_bars.dart';

class UserRatingsWidget extends ConsumerWidget {
  const UserRatingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratings = ref.watch(
      localUserProvider.select((value) => value!.ratings),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const BackgroundIcon(icon: Icons.star),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Ratings',
              style: context.titleLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: RatingBars(
            scoreList: ratings.map((e) => e.rating).toList(),
          ),
        ),
      ],
    );
  }
}
