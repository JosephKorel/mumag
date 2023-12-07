import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_repo.dart';
import 'package:mumag/common/services/suggestion/usecase/suggestion_usecase.dart';

class SuggestionRepositoryMock extends Mock implements SuggestionRepository {}

class InsertSuggestionParamsMock extends Mock
    implements InsertSuggestionParams {}

class UpdateSuggestionParamsMock extends Mock
    implements UpdateSuggestionParams {}

class DeleteSuggestionParamsMock extends Mock
    implements DeleteSuggestionParams {}

void main() {
  final suggestionRepository = SuggestionRepositoryMock();
  final suggestionUsecase = SuggestionUsecase(suggestionRepository);
  final insertSuggestionParams = InsertSuggestionParams(
    suggestedBy: 1,
    suggestedTo: 2,
    spotifyId: '',
    type: SuggestionType.album,
  );
  final updateSuggestionParams =
      UpdateSuggestionParams(suggestionId: 1, rating: 1);
  final deleteSuggestionParams = DeleteSuggestionParams(suggestionId: 1);

  setUpAll(() {
    registerFallbackValue(InsertSuggestionParamsMock());
    registerFallbackValue(UpdateSuggestionParamsMock());
    registerFallbackValue(DeleteSuggestionParamsMock());

    when(
      () => suggestionRepository.insertSuggestion(params: any(named: 'params')),
    ).thenAnswer((invocation) async {});

    when(
      () => suggestionRepository.updateSuggestion(params: any(named: 'params')),
    ).thenAnswer((invocation) async => 1);

    when(
      () => suggestionRepository.deleteSuggestion(params: any(named: 'params')),
    ).thenAnswer((invocation) async {});
  });

  group('Tests for suggestion feature', () {
    test('Insert suggestion and return Right', () async {
      // arrange
      when(
        () => suggestionRepository.insertSuggestion(
          params: insertSuggestionParams,
        ),
      ).thenAnswer((invocation) async {});

      // prepare
      final result = await suggestionUsecase
          .insertSuggestion(params: insertSuggestionParams)
          .run();

      // assert
      expect(result, isA<Right<AppException, void>>());
    });

    test('Update suggestion and return Right', () async {
      // arrange
      when(
        () => suggestionRepository.updateSuggestion(
          params: updateSuggestionParams,
        ),
      ).thenAnswer((invocation) async => 1);

      // prepare
      final result = await suggestionUsecase
          .updateSuggestion(params: updateSuggestionParams)
          .run();

      final rating = result.fold((l) => null, (r) => r);

      // assert
      expect(result, isA<Right<AppException, int>>());
      expect(rating, 1);
    });

    test('Delete suggestion and return Right', () async {
      // arrange
      when(
        () => suggestionRepository.deleteSuggestion(
          params: deleteSuggestionParams,
        ),
      ).thenAnswer((invocation) async => {});

      // prepare
      final result = await suggestionUsecase
          .deleteSuggestion(params: deleteSuggestionParams)
          .run();

      // assert
      expect(result, isA<Right<AppException, void>>());
    });
    test('Insert suggestion throws and return exception', () async {
      // arrange
      when(
        () => suggestionRepository.insertSuggestion(
          params: insertSuggestionParams,
        ),
      ).thenThrow(Exception());

      // prepare
      final result = await suggestionUsecase
          .insertSuggestion(params: insertSuggestionParams)
          .run();

      final exception = result.fold((l) => l, (r) => null);

      // assert
      expect(result, isA<Left<AppException, void>>());
      expect(exception, isA<InsertSuggestionException>());
    });

    test('Update suggestion throws and return exception', () async {
      // arrange
      when(
        () => suggestionRepository.updateSuggestion(
          params: updateSuggestionParams,
        ),
      ).thenThrow(Exception());

      // prepare
      final result = await suggestionUsecase
          .updateSuggestion(params: updateSuggestionParams)
          .run();

      final exception = result.fold((l) => l, (r) => null);

      // assert
      expect(result, isA<Left<AppException, void>>());
      expect(exception, isA<UpdateSuggestionException>());
    });

    test('Delete suggestion throws and return exception', () async {
      // arrange
      when(
        () => suggestionRepository.deleteSuggestion(
          params: deleteSuggestionParams,
        ),
      ).thenThrow(Exception());

      // prepare
      final result = await suggestionUsecase
          .deleteSuggestion(params: deleteSuggestionParams)
          .run();

      final exception = result.fold((l) => l, (r) => null);

      // assert
      expect(result, isA<Left<AppException, void>>());
      expect(exception, isA<DeleteSuggestionException>());
    });
  });
}
