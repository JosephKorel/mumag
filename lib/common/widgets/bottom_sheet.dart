import 'package:flutter/material.dart';

void showAppBottomSheet(
  BuildContext context, {
  required Widget child,
  double? height,
}) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    showDragHandle: true,
    builder: (context) => AppBottomSheet(
      height: height,
      child: child,
    ),
  );
}

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({required this.child, super.key, this.height});

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
