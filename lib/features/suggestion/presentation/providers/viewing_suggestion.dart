import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/providers/suggestion.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/features/profile/presentation/providers/suggestions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'viewing_suggestion.g.dart';

@riverpod
class ViewingSuggestion extends _$ViewingSuggestion {
  @override
  ReceivedSuggestion? build() {
    return null;
  }

  void updateState(ReceivedSuggestion suggestion) => state = suggestion;
}

@riverpod
FutureOr<bool> deleteSuggestion(DeleteSuggestionRef ref) async {
  final suggestion = ref.read(viewingSuggestionProvider)!;

  final deleteParams = DeleteSuggestionParams(suggestionId: suggestion.id);

  final result =
      await ref.read(suggestionControllerProvider)(event: deleteParams).run();

  return result.fold((l) {
    ref.read(toastMessageProvider.notifier).onException(exception: l);
    return false;
  }, (r) async {
    await ref.read(fetchUserSuggestionsProvider.future);
    return true;
  });
}
