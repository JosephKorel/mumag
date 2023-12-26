import 'package:flutter/material.dart';
import 'package:mumag/common/theme/utils.dart';

class BackgroundIcon extends StatelessWidget {
  const BackgroundIcon({required this.icon, super.key});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.onSurface.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon),
      ),
    );
  }
}
