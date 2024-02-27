import 'package:flutter/material.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/theme/utils.dart';
import 'package:mumag/common/widgets/image.dart';

class MediaImage extends StatelessWidget {
  const MediaImage({
    required this.url,
    required this.type,
    super.key,
    this.width,
  });

  final RatingType type;
  final String? url;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return Container(
        width: width ?? 52,
        height: width ?? 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.onSurface.withOpacity(0.1),
        ),
        child: Icon(type.icon),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedImage(
        url: url!,
        width: width ?? 52,
        height: width ?? 52,
      ),
    );
  }
}
