import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';

abstract class SuggestionRepository {
  Future<void> insertSuggestion({required InsertSuggestionParams params});

  Future<void> insertManySuggestions({
    required InsertManySuggestionsParams params,
  });

  Future<void> updateSuggestion({required UpdateSuggestionParams params});

  Future<void> deleteSuggestion({required DeleteSuggestionParams params});

  Future<List<SuggestionEntity>> getUserSuggestions({
    required GetUserSuggestionParams params,
  });

  Future<List<SuggestionEntity>> getReceivedSuggestions({
    required GetUserReceivedSuggestionParams params,
  });
}
