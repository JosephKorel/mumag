import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/bottom_sheet.dart';
import 'package:mumag/common/widgets/rating_bottom_sheet.dart';
import 'package:mumag/features/artist_view/providers/artist.dart';

class ArtistPageContent extends ConsumerWidget {
  const ArtistPageContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Stack(
      children: [
        SizedBox(width: double.infinity, child: ArtistHeader()),
        Column(
          children: [
            Expanded(child: SizedBox.expand()),
            Expanded(
              flex: 2,
              child: ArtistContentContainer(),
            ),
          ],
        ),
      ],
    );
  }
}

class ArtistHeader extends ConsumerWidget {
  const ArtistHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artist = ref.watch(viewingArtistProvider).requireValue;

    log('Artist images ${artist.images}');

    if (artist.images == null) {
      return const SizedBox.shrink();
    }

    return Image(
      image: NetworkImage(artist.images!.first.url!),
      fit: BoxFit.cover,
    ).animate().fadeIn();
  }
}

class ArtistContentContainer extends ConsumerWidget {
  const ArtistContentContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: context.background,
      ),
    ).animate().fadeIn();
  }
}

class ArtistRatingFloatingActionButton extends ConsumerWidget {
  const ArtistRatingFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onConfirm(int rateValue) {
      log('This was the value $rateValue');
    }

    return FloatingActionButton(
      onPressed: () => showAppBottomSheet(
        context,
        child: RatingBottomSheet(
          type: RatingType.artist,
          loading: false,
          onConfirm: onConfirm,
        ),
        height: 360,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: context.primary,
      child: Icon(
        Icons.star,
        color: context.onPrimary,
      ),
    );
  }
}
