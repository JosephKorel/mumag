import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/common/theme/utils.dart';

class ChangeBackgroundBottomSheet extends ConsumerWidget {
  const ChangeBackgroundBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          'Change profile background',
          style: context.titleLarge,
        ),
      ],
    );
  }
}
