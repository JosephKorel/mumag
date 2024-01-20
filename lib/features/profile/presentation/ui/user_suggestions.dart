import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mumag/features/profile/presentation/providers/suggestions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserSuggestionsFAB extends ConsumerStatefulWidget {
  const UserSuggestionsFAB({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserSuggestionsFABState();
}

class _UserSuggestionsFABState extends ConsumerState<UserSuggestionsFAB> {
  @override
  void initState() {
    super.initState();
    ref.read(fetchUserSuggestionsProvider);
  }

  @override
  Widget build(BuildContext context) {
    final suggestions = ref.watch(userSuggestionsProvider);

    if (suggestions.isEmpty) {
      return const SizedBox.shrink();
    }

    return FloatingActionButton.extended(
      onPressed: () {},
      label: Row(
        children: [
          PhosphorIcon(
            PhosphorIcons.package(),
          )
              .animate(
                onComplete: (controller) => controller.repeat(reverse: true),
              )
              .moveY(
                end: -2,
                begin: 2,
                curve: Curves.easeOut,
                duration: 1.seconds,
              ),
          const SizedBox(
            width: 8,
          ),
          Text('Suggestions ${suggestions.length}'),
        ],
      ),
    ).animate().slideY(
          begin: 8,
          duration: 1.seconds,
          curve: Curves.easeOutQuint,
        );
  }
}
