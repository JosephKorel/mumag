import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
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
