import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mumag/common/models/media/common.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/media/common.dart';
import 'package:mumag/common/widgets/media/image.dart';

class SearchMediaCard extends StatelessWidget {
  const SearchMediaCard({
    required this.data,
    this.trailling,
    this.highlight = false,
    super.key,
  });

  final MediaEntity data;
  final Widget? trailling;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 52,
        child: Row(
          children: [
            CardCilinder(
              color: context.primary.withOpacity(highlight ? 1 : 0.4),
            ),
            const SizedBox(
              width: 8,
            ),
            MediaImage(url: data.imageUrl, type: data.type),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.name,
                    style: context.titleMedium.copyWith(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (data.artists != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SmallBadge(
                        icon: Icons.person,
                        text: data.artists!.join(', '),
                      ),
                    ),
                ],
              ),
            ),
            trailling ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class FavoriteSongTile extends StatelessWidget {
  const FavoriteSongTile({
    required this.data,
    this.trailling,
    this.highlight = false,
    super.key,
  });

  final MediaEntity data;
  final Widget? trailling;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: 38,
          child: Row(
            children: [
              MediaImage(url: data.imageUrl, type: data.type, width: 38),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.name,
                      style: context.titleSmall
                          .copyWith(color: context.onPrimaryContainer),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (data.artists != null)
                      Text(
                        data.artists!.join(', '),
                        style: context.bodySmall,
                      ),
                  ],
                ),
              ),
              trailling ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    )
        .animate(
          onComplete: (controller) => controller.repeat(reverse: true),
        )
        .slideY(
          begin: .05,
          duration: 2.seconds,
          curve: Curves.easeInOut,
        );
  }
}
