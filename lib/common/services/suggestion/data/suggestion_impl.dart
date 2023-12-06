import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_repo.dart';

class SuggestionRepositoryImpl extends SuggestionRepository {
  SuggestionRepositoryImpl(this._api);

  final ApiRepository _api;

  static const _path = 'suggestion';

  @override
  Future<void> insertSuggestion({
    required InsertSuggestionParams params,
  }) async {
    try {
      await _api.post(path: _path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateSuggestion({
    required UpdateSuggestionParams params,
  }) async {
    try {
      await _api.post(path: _path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteSuggestion({
    required DeleteSuggestionParams params,
  }) async {
    try {
      await _api.post(path: _path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
