import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/providers/suggestion.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sent_suggestions.g.dart';

@riverpod
Future<List<UserSuggestion>> sentSuggestions(SentSuggestionsRef ref) async {
  final user = ref.watch(localUserProvider)!;
  final data = await ref
      .read(suggestionControllerProvider)(
        event: GetUserSuggestionParams(userId: user.id),
      )
      .run();

  return data.fold(
    (l) {
      ref.read(toastMessageProvider.notifier).onException(exception: l);
      return [];
    },
    (r) => r as List<UserSuggestion>,
  );
}
