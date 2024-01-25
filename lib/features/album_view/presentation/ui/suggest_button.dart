import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuggestButton extends ConsumerWidget {
  const SuggestButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.share));
  }
}
