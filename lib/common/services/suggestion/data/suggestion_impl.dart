import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_repo.dart';

class SuggestionRepositoryImpl extends SuggestionRepository {
  SuggestionRepositoryImpl(this._api);

  final ApiRepository _api;

  static const _path = '/suggestion';

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
  Future<void> insertManySuggestions({
    required InsertManySuggestionsParams params,
  }) async {
    try {
      final dataToSend = {'data': params.toMap()};
      await _api.post(
        path: '$_path/insert-many',
        params: dataToSend,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> updateSuggestion({
    required UpdateSuggestionParams params,
  }) async {
    try {
      final result = await _api.put(path: _path, params: params.toMap());

      return result!['rating'] as int;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteSuggestion({
    required DeleteSuggestionParams params,
  }) async {
    try {
      await _api.delete(path: _path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SuggestionEntity>> getUserSuggestions({
    required GetUserSuggestionParams params,
  }) async {
    try {
      final result = await _api.get(
        path: '$_path/sent-suggestions',
        query: params.toMap(),
      );

      return (result!['data'] as List<dynamic>)
          .map((e) => UserSuggestion.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SuggestionEntity>> getReceivedSuggestions({
    required GetUserReceivedSuggestionParams params,
  }) async {
    try {
      final result = await _api.get(
        path: '$_path/received-suggestions',
        query: params.toMap(),
      );

      return (result!['data'] as List<dynamic>)
          .map((e) => UserSuggestion.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
