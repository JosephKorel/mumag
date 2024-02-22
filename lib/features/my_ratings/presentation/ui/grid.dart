import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/my_ratings/presentation/ui/item.dart';
import 'package:mumag/features/my_ratings/providers/media.dart';

class RatingsGrid extends ConsumerWidget {
  const RatingsGrid({
    required this.ratings,
    required this.searchValue,
    super.key,
  });

  final List<RatingEntity> ratings;
  final String searchValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(getMediaListProvider(ratings: ratings));

    return items.when(
      data: (data) {
        final builtAt = DateTime.now().millisecondsSinceEpoch;
        final showData = data
            .where(
              (element) => element.name
                  .toLowerCase()
                  .contains(searchValue.toLowerCase()),
            )
            .toList();

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            childAspectRatio: 0.8,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: showData.length,
          itemBuilder: (context, index) {
            final media = showData[index];
            final rating = ratings
                .where(
                  (element) => element.spotifyId == media.spotifyId,
                )
                .first;

            return RatingGridItem(
              parentBuiltAt: builtAt,
              rating: rating,
              media: media,
              index: index,
            );
          },
        );
      },
      error: (error, stackTrace) => const Center(
        child: Icon(Icons.error),
      ),
      loading: _LoadingState.new,
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 32,
        mainAxisSpacing: 32,
        childAspectRatio: 0.8,
      ),
      padding: const EdgeInsets.all(8),
      itemCount: 6,
      itemBuilder: (context, index) => const SizedBox.expand(
        child: LoadingSkeleton(height: double.infinity),
      ),
    );
  }
}
