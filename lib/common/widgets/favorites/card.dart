import 'package:flutter/material.dart';
import 'package:mumag/common/models/media/common.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/media/common.dart';
import 'package:mumag/common/widgets/media/image.dart';

class SearchMediaCard extends StatelessWidget {
  const SearchMediaCard({
    required this.data,
    this.trailling,
    super.key,
  });

  final MediaEntity data;
  final Widget? trailling;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 52,
        child: Row(
          children: [
            CardCilinder(
              color: context.primary.withOpacity(0.4),
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
                    SmallBadge(
                      icon: Icons.person,
                      text: data.artists!.join(', '),
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
