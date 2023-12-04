import 'package:flutter/material.dart';
import 'package:mumag/common/theme/utils.dart';

void showAppBottomSheet(BuildContext context, {required Widget child}) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    builder: (context) => AppBottomSheet(child: child),
  );
}

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: 64,
              height: 4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.onSurface.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
