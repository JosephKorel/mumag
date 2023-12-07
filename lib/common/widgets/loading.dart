import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mumag/common/theme/utils.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({
    required this.height,
    super.key,
    this.width,
    this.borderRadius,
  });

  final double? width;
  final double height;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          color: context.onSurface.withOpacity(0.2),
        ),
      )
          .animate(
            onComplete: (controller) => controller.repeat(),
          )
          .shimmer(duration: 1.seconds),
    );
  }
}
