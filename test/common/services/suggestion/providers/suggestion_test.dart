import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_events.dart';
import 'package:mumag/common/services/suggestion/domain/suggestion_repo.dart';
import 'package:mumag/common/services/suggestion/providers/suggestion.dart';
import 'package:mumag/common/services/suggestion/usecase/suggestion_usecase.dart';

class SuggestionRepositoryMock extends Mock implements SuggestionRepository {}

class InsertSuggestionParamsMock extends Mock
    implements InsertSuggestionParams {}

class UpdateSuggestionParamsMock extends Mock
    implements UpdateSuggestionParams {}

class DeleteSuggestionParamsMock extends Mock
    implements DeleteSuggestionParams {}

typedef RightType<T> = Right<AppException, T>;

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  addTearDown(container.dispose);

  return container;
}

void main() {
  final suggestionRepository = SuggestionRepositoryMock();
  final suggestionUsecase = SuggestionUsecase(suggestionRepository);
  final suggestionController = SuggestionUsecaseController(suggestionUsecase);
  final insertSuggestionParams = InsertSuggestionParams(
    suggestedBy: 1,
    suggestedTo: 2,
    spotifyId: '',
    type: SuggestionType.album,
  );

  setUpAll(() {
    registerFallbackValue(InsertSuggestionParamsMock());
    registerFallbackValue(UpdateSuggestionParamsMock());
    registerFallbackValue(DeleteSuggestionParamsMock());
    registerFallbackValue(const AsyncLoading<void>());
    registerFallbackValue(
      const AsyncError<void>(InsertRatingException, StackTrace.empty),
    );

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

  group('Tests for suggestion feature providers', () {
    test('Suggestion usecase provider returns SuggestionUsecase type', () {
      final container = createContainer(
        overrides: [
          suggestionUsecaseProvider.overrideWith((ref) => suggestionUsecase),
        ],
      );

      expect(
        container.read(suggestionUsecaseProvider),
        isA<SuggestionUsecase>(),
      );
    });

    test('Suggestion controller returns a TaskEither', () {
      final container = createContainer(
        overrides: [
          suggestionUsecaseProvider.overrideWith((ref) => suggestionUsecase),
          suggestionControllerProvider
              .overrideWith((ref) => suggestionController),
        ],
      );

      final result = container.read(suggestionControllerProvider)(
        event: insertSuggestionParams,
      );

      expect(
        result,
        isA<ApiResult<void>>(),
      );
    });

    test('Suggestion controller insert suggestion and return Right', () async {
      // arrange
      when(
        () => suggestionRepository.insertSuggestion(
          params: insertSuggestionParams,
        ),
      ).thenAnswer((invocation) async {});

      final container = createContainer(
        overrides: [
          suggestionUsecaseProvider.overrideWith((ref) => suggestionUsecase),
          suggestionControllerProvider
              .overrideWith((ref) => suggestionController),
        ],
      );

      // prepare
      final result = await container
          .read(suggestionControllerProvider)(
            event: insertSuggestionParams,
          )
          .run();

      expect(
        result,
        isA<RightType<void>>(),
      );
    });

    test('Insert suggestion fails and controller return Left', () async {
      // arrange
      when(
        () => suggestionRepository.insertSuggestion(
          params: insertSuggestionParams,
        ),
      ).thenThrow(Exception());

      final container = createContainer(
        overrides: [
          suggestionUsecaseProvider.overrideWith((ref) => suggestionUsecase),
          suggestionControllerProvider
              .overrideWith((ref) => suggestionController),
        ],
      );

      // prepare
      final request = await container
          .read(suggestionControllerProvider)(
            event: insertSuggestionParams,
          )
          .run();

      final result = request.fold((l) => l, (r) => null);

      expect(
        result,
        isA<InsertSuggestionException>(),
      );
    });

    test(
        'Suggestion handler starts with AsyncValue<void> and call method is never called',
        () async {
      final listener = Listener<AsyncValue<void>>();

      createContainer(
        overrides: [
          suggestionRepositoryProvider
              .overrideWith((ref) => suggestionRepository),
          suggestionUsecaseProvider.overrideWith((ref) => suggestionUsecase),
          suggestionControllerProvider
              .overrideWith((ref) => suggestionController),
        ],
      ).listen(
        suggestionHandlerProvider,
        listener.call,
        fireImmediately: true,
      );

      verify(() => listener(null, const AsyncData<void>(null)));

      verifyNever(
        () => suggestionRepository.insertSuggestion(
          params: insertSuggestionParams,
        ),
      );

      verifyNoMoreInteractions(listener);
    });

    test('Suggestion handler states: void -> loading -> void', () async {
      final listener = Listener<AsyncValue<void>>();

      final container = createContainer(
        overrides: [
          suggestionUsecaseProvider.overrideWith((ref) => suggestionUsecase),
          suggestionControllerProvider
              .overrideWith((ref) => suggestionController),
        ],
      )..listen(
          suggestionHandlerProvider,
          listener.call,
          fireImmediately: true,
        );

      final notifier = container.read(suggestionHandlerProvider.notifier);

      verify(() => listener(null, const AsyncData<void>(null)));

      await notifier.call(event: insertSuggestionParams);

      verifyInOrder([
        () => listener(
              const AsyncData<void>(null),
              any(that: isA<AsyncLoading<void>>()),
            ),
        () => listener(
              any(that: isA<AsyncLoading<void>>()),
              const AsyncData<void>(null),
            ),
      ]);

      verifyNoMoreInteractions(listener);
    });

    test('Suggestion handler states: void -> loading -> void', () async {
      final listener = Listener<AsyncValue<void>>();

      final container = createContainer(
        overrides: [
          suggestionUsecaseProvider.overrideWith((ref) => suggestionUsecase),
          suggestionControllerProvider
              .overrideWith((ref) => suggestionController),
        ],
      )..listen(
          suggestionHandlerProvider,
          listener.call,
          fireImmediately: true,
        );

      final notifier = container.read(suggestionHandlerProvider.notifier);

      verify(() => listener(null, const AsyncData<void>(null)));

      await notifier.call(event: insertSuggestionParams);

      verifyInOrder([
        () => listener(
              const AsyncData<void>(null),
              any(that: isA<AsyncLoading<void>>()),
            ),
        () => listener(
              any(that: isA<AsyncLoading<void>>()),
              const AsyncData<void>(null),
            ),
      ]);

      verifyNoMoreInteractions(listener);
    });

    test('Suggestion handler states: void -> loading -> AsyncError', () async {
      when(
        () => suggestionRepository.insertSuggestion(
          params: insertSuggestionParams,
        ),
      ).thenThrow(Exception());

      final listener = Listener<AsyncValue<void>>();

      final container = createContainer(
        overrides: [
          suggestionUsecaseProvider.overrideWith((ref) => suggestionUsecase),
          suggestionControllerProvider
              .overrideWith((ref) => suggestionController),
        ],
      )..listen(
          suggestionHandlerProvider,
          listener.call,
          fireImmediately: true,
        );

      final notifier = container.read(suggestionHandlerProvider.notifier);

      verify(() => listener(null, const AsyncData<void>(null)));

      await notifier.call(event: insertSuggestionParams);

      verifyInOrder([
        () => listener(
              const AsyncData<void>(null),
              any(that: isA<AsyncLoading<void>>()),
            ),
        () => listener(
              any(that: isA<AsyncLoading<void>>()),
              any(that: isA<AsyncError<void>>()),
            ),
      ]);

      verifyNoMoreInteractions(listener);
    });
  });
}
