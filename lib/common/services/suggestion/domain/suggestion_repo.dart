import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';

abstract class SuggestionRepository {
  Future<void> insertSuggestion({required InsertSuggestionParams params});

  Future<void> updateSuggestion({required UpdateSuggestionParams params});

  Future<void> deleteSuggestion({required DeleteSuggestionParams params});
}
