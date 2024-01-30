import 'package:flutter/material.dart';
import 'package:mumag/common/theme/utils.dart';

class BackgroundIcon extends StatelessWidget {
  const BackgroundIcon({
    required this.icon,
    this.size,
    this.backgroundColor,
    this.iconColor,
    super.key,
  });

  final IconData icon;
  final double? size;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor ?? context.onSurface.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: size,
          color: iconColor,
        ),
      ),
    );
  }
}
