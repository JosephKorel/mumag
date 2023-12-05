import 'package:flutter/material.dart';

void showAppBottomSheet(BuildContext context, {required Widget child}) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    showDragHandle: true,
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
          Expanded(child: child),
        ],
      ),
    );
  }
}
