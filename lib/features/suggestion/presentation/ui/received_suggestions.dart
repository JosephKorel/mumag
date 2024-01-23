import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/spotify_search/providers/search.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_widget.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/utils/media_query.dart';
import 'package:mumag/common/widgets/image.dart';
import 'package:mumag/common/widgets/loading.dart';
import 'package:mumag/features/suggestion/presentation/ui/menu.dart';
import 'package:mumag/features/suggestion/presentation/ui/rating.dart';

class ReceivedSuggestionItem extends ConsumerWidget {
  const ReceivedSuggestionItem({
    required this.suggestion,
    required this.show,
    super.key,
  });
  final ReceivedSuggestion suggestion;
  final bool show;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // When filtering, in order to prevent fetching it again
    // Watch provider in this widget
    ref.watch(
      searchMediaByIdProvider(
        type: suggestion.type,
        spotifyId: suggestion.spotifyId,
      ),
    );

    if (!show) {
      return const SizedBox.shrink();
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: context.onSurface.withOpacity(0.8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _ReceivedSuggestionItemMedia(suggestion: suggestion),
                ),
                SuggestionRatingButtonContainer(
                  child: SuggestionMenuButton(suggestion: suggestion),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1.4,
            ),
            _SuggestionRating(rating: suggestion.rating),
          ],
        ),
      ),
    );
  }
}

class _ReceivedSuggestionItemMedia extends ConsumerWidget {
  const _ReceivedSuggestionItemMedia({
    required this.suggestion,
  });

  final ReceivedSuggestion suggestion;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(
      searchMediaByIdProvider(
        type: suggestion.type,
        spotifyId: suggestion.spotifyId,
      ),
    );

    return item.when(
      data: (data) => SizedBox(
        height: 68,
        width: context.deviceWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MediaImg(imageUrl: data?.imageUrl ?? ''),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _MediaDetails(media: data!),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _SuggesterUser(name: suggestion.sentByName),
                      _SentTimestamp(createdAt: suggestion.createdAt),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: Icon(Icons.warning),
      ),
      loading: _Loading.new,
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 52,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingSkeleton(
            height: 52,
            width: 52,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(child: LoadingSkeleton(height: 18)),
        ],
      ),
    );
  }
}

class _MediaImg extends ConsumerWidget {
  const _MediaImg({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedImage(
        url: imageUrl,
        width: 68,
        height: 68,
      ),
    );
  }
}

class _MediaDetails extends StatelessWidget {
  const _MediaDetails({required this.media});

  final SuggestionWidgetEntity media;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          media.name,
          style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Text(
              '${media.description} ${media.artist != null ? ' by ' : ''}',
              style: context.bodyMedium.copyWith(
                color: context.onSurface.withOpacity(0.7),
                fontStyle: FontStyle.italic,
              ),
            ),
            if (media.artist != null)
              Expanded(
                child: Text(
                  media.artist!.join(', '),
                  style: context.bodyMedium.copyWith(
                    color: context.onSurface.withOpacity(0.7),
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _SuggesterUser extends StatelessWidget {
  const _SuggesterUser({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.onSurface.withOpacity(0.7),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.person,
              size: 18,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              name,
              style: context.bodySmall.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SentTimestamp extends StatelessWidget {
  const _SentTimestamp({required this.createdAt});

  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    final text = _timestamp(createdAt);
    return Text(
      text,
      style: context.bodyMedium
          .copyWith(color: context.onSurface.withOpacity(0.7)),
    );
  }
}

class _SuggestionRating extends StatelessWidget {
  const _SuggestionRating({required this.rating});

  final int? rating;

  @override
  Widget build(BuildContext context) {
    if (rating == null) {
      return const SizedBox.shrink();
    }

    final value = RatingValue.values
        .where(
          (element) => element.score == rating,
        )
        .single;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: List.generate(
            rating!,
            (index) => Icon(
              Icons.star,
              color: context.primary,
              size: 18,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          value.label,
          style: context.titleMedium.copyWith(height: 1.2),
        ),
      ],
    );
  }
}

String _timestamp(DateTime createdAt) {
  final difference = DateTime.now().difference(createdAt);

  if (difference.inMinutes < 1) {
    return '${difference.inSeconds} s ago';
  }

  if (difference.inHours < 1) {
    return '${difference.inMinutes} min ago';
  }

  if (difference.inDays < 30) {
    return '${difference.inDays} days ago';
  }

  return DateFormat.yMd(Intl.getCurrentLocale()).format(createdAt);
}
