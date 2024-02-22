import 'package:flutter/material.dart';
import 'package:mumag/common/theme/utils.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 38,
      decoration: BoxDecoration(
        color: context.onSurface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
