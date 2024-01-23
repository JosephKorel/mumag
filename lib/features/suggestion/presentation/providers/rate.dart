import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/providers/suggestion.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/features/suggestion/presentation/providers/viewing_suggestion.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rate.g.dart';

@riverpod
Future<bool> handleRating(HandleRatingRef ref, {required int rateValue}) async {
  final suggestion = ref.read(viewingSuggestionProvider)!;
  final rateParams =
      RateSuggestionParams(suggestionId: suggestion.id, rateValue: rateValue);
  final result =
      await ref.read(suggestionControllerProvider)(event: rateParams).run();
  return result.fold((l) {
    ref.read(toastMessageProvider.notifier).onException(exception: l);
    return false;
  }, (r) {
    ref
        .read(toastMessageProvider.notifier)
        .onSuccessEvent(successEvent: rateParams.successMsg!);
    return true;
  });
}
