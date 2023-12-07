import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/suggestion/data/suggestion_impl.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_repo.dart';
import 'package:mumag/common/services/suggestion/usecase/suggestion_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'suggestion.g.dart';

@riverpod
SuggestionRepository suggestionRepository(SuggestionRepositoryRef ref) {
  final api = ref.watch(apiProvider);
  return SuggestionRepositoryImpl(api);
}

@riverpod
SuggestionUsecase suggestionUsecase(SuggestionUsecaseRef ref) {
  final repository = ref.watch(suggestionRepositoryProvider);
  return SuggestionUsecase(repository);
}

@riverpod
SuggestionUsecaseController suggestionController(SuggestionControllerRef ref) {
  final suggestionUsecase = ref.watch(suggestionUsecaseProvider);
  return SuggestionUsecaseController(suggestionUsecase);
}

@riverpod
class SuggestionHandler extends _$SuggestionHandler {
  @override
  FutureOr<void> build() {}

  Future<void> call({required SuggestionEvents event}) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final request =
          await ref.read(suggestionControllerProvider)(event: event).run();

      final result = request.fold(
        (l) => l,
        (r) => null,
      );

      if (request.isLeft()) {
        throw result!;
      }
    });
  }
}
