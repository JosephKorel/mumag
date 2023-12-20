import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mumag/common/widgets/loading.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    required this.url,
    super.key,
    this.height,
    this.width,
    this.fit,
  });

  final double? height;
  final double? width;
  final BoxFit? fit;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const LoadingSkeleton(
        height: double.infinity,
        width: double.infinity,
      ),
      errorWidget: (context, url, error) => const LoadingSkeleton(
        height: double.infinity,
        width: double.infinity,
      ),
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
