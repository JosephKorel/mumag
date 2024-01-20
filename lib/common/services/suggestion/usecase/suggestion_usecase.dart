import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_repo.dart';

class SuggestionUsecase {
  SuggestionUsecase(this._repository);

  final SuggestionRepository _repository;

  ApiResult<void> insertSuggestion({required InsertSuggestionParams params}) {
    return TaskEither.tryCatch(
      () => _repository.insertSuggestion(params: params),
      (error, stackTrace) => InsertSuggestionException(error: error),
    );
  }

  ApiResult<int> updateSuggestion({required UpdateSuggestionParams params}) {
    return TaskEither.tryCatch(
      () => _repository.updateSuggestion(params: params),
      (error, stackTrace) => UpdateSuggestionException(error: error),
    );
  }

  ApiResult<void> deleteSuggestion({required DeleteSuggestionParams params}) {
    return TaskEither.tryCatch(
      () => _repository.deleteSuggestion(params: params),
      (error, stackTrace) => DeleteSuggestionException(error: error),
    );
  }

  ApiResult<List<SuggestionEntity>> getUserSuggestions({
    required GetUserSuggestionParams params,
  }) {
    return TaskEither.tryCatch(
      () {
        return _repository.getUserSuggestions(params: params);
      },
      (error, stackTrace) => GetUserSuggestionsException(error: error),
    );
  }
}

class SuggestionUsecaseController {
  SuggestionUsecaseController(this._usecase);

  final SuggestionUsecase _usecase;

  ApiResult<dynamic> call({required SuggestionEvents event}) {
    return switch (event) {
      InsertSuggestionParams() => _usecase.insertSuggestion(params: event),
      UpdateSuggestionParams() => _usecase.updateSuggestion(params: event),
      DeleteSuggestionParams() => _usecase.deleteSuggestion(params: event),
      GetUserSuggestionParams() => _usecase.getUserSuggestions(params: event),
    };
  }
}
