import 'package:flutter/material.dart';
import 'package:mumag/common/theme/utils.dart';

// The small colorful object in the left of each card
class CardCilinder extends StatelessWidget {
  const CardCilinder({super.key, this.width, this.height, this.color});

  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 32,
      width: width ?? 4,
      decoration: BoxDecoration(
        color: color ?? context.primary,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class SmallBadge extends StatelessWidget {
  const SmallBadge({
    required this.text,
    this.icon,
    super.key,
    this.backgroundColor,
  });

  final String text;
  final IconData? icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor ?? context.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 18,
              ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: context.bodySmall.copyWith(
                fontStyle: FontStyle.italic,
                color: context.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
