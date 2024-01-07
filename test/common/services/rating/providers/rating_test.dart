import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/domain/rating_repository.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/rating/usecase/rating_usecase.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';

class RatingRepositoryMock extends Mock implements RatingRepository {}

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
  final ratingRepository = RatingRepositoryMock();
  final ratingUsecase = RatingUsecase(ratingRepository);

  final currentUser = UserEntity(
    id: 1,
    name: '',
    avatarUrl: '',
    email: '',
    lastUpdatedAt: DateTime.now(),
    socialRelations: UserSocialRelations.defaultValue(),
  );
  final getUserRatingParams = GetUserRatingParams(userId: 1);
  final userProviderMock = UserProviderMock();

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<void>());
    registerFallbackValue(const AsyncLoading<List<RatingEntity>>());
    registerFallbackValue(const AsyncData<List<RatingEntity>>([]));
    registerFallbackValue(getUserRatingParams);

    when(
      () => ratingRepository.getUserRatings(
        params: any(named: 'params'),
      ),
    ).thenAnswer(
      (invocation) async => <RatingEntity>[],
    );

    when(
      userProviderMock.build,
    ).thenAnswer((invocation) async => currentUser);
  });

  group('Tests for rating providers', () {
    test('Rating usecase provider should return an instance of RatingUsecase',
        () async {
      final container = createContainer(
        overrides: [
          ratingUsecaseProvider.overrideWith((ref) => ratingUsecase),
        ],
      );

      expect(container.read(ratingUsecaseProvider), isA<RatingUsecase>());
    });

    test('Rating usecase provider calls getUserRatings and return a list',
        () async {
      //arrange
      when(
        () => ratingRepository.getUserRatings(
          params: getUserRatingParams,
        ),
      ).thenAnswer(
        (invocation) async => [],
      );

      final container = createContainer(
        overrides: [
          ratingRepositoryProvider.overrideWith((ref) => ratingRepository),
          ratingUsecaseProvider.overrideWith((ref) => ratingUsecase),
        ],
      );

      // prepare
      final result = await container
          .read(ratingUsecaseProvider)
          .getUserRatings(params: getUserRatingParams)
          .run();

      // assert
      expect(result, isA<Right<AppException, List<RatingEntity>>>());
    });

    test('Rating usecase provider calls getUserRatings and returns Left',
        () async {
      //arrange
      when(
        () => ratingRepository.getUserRatings(
          params: getUserRatingParams,
        ),
      ).thenThrow(Exception());

      final container = createContainer(
        overrides: [
          ratingRepositoryProvider.overrideWith((ref) => ratingRepository),
          ratingUsecaseProvider.overrideWith((ref) => ratingUsecase),
        ],
      );

      // prepare
      final result = await container
          .read(ratingUsecaseProvider)
          .getUserRatings(params: getUserRatingParams)
          .run();

      // assert
      expect(result, isA<Left<AppException, List<RatingEntity>>>());
    });

    test('User ratings provider start with loading state', () async {
      // arrange
      final listener = Listener<AsyncValue<List<RatingEntity>>>();

      createContainer(
        overrides: [
          userProvider.overrideWith(UserProviderMock.new),
          ratingUsecaseProvider.overrideWith((ref) => ratingUsecase),
        ],
      ).listen(
        userRatingsProvider,
        listener.call,
        fireImmediately: true,
      );

      verify(
        () => listener(null, const AsyncLoading()),
      );

      verifyNoMoreInteractions(listener);
    });

    test('User ratings loads list', () async {
      // arrange
      when(
        () => ratingRepository.getUserRatings(
          params: getUserRatingParams,
        ),
      ).thenAnswer(
        (invocation) async => <RatingEntity>[],
      );

      final listener = Listener<AsyncValue<List<RatingEntity>>>();

      final container = createContainer(
        overrides: [
          userProvider.overrideWith(() => userProviderMock),
          ratingRepositoryProvider.overrideWith((ref) => ratingRepository),
          ratingUsecaseProvider.overrideWith((ref) => ratingUsecase),
        ],
      )..listen(
          userRatingsProvider,
          listener.call,
          fireImmediately: true,
        );

      verify(
        () => listener(null, const AsyncLoading<List<RatingEntity>>()),
      );

      // prepare
      await expectLater(
        container.read(userRatingsProvider.future),
        completion([]),
      );

      // assert
      verify(
        () => listener(
          any(that: isA<AsyncLoading<List<RatingEntity>>>()),
          any(that: isA<AsyncData<List<RatingEntity>>>()),
        ),
      );

      verifyNoMoreInteractions(listener);
    });

    test('User ratings return left and provider returns async error', () async {
      // arrange
      when(
        () => ratingRepository.getUserRatings(
          params: getUserRatingParams,
        ),
      ).thenAnswer((invocation) async => throw Exception());

      final listener = Listener<AsyncValue<List<RatingEntity>>>();

      final container = createContainer(
        overrides: [
          userProvider.overrideWith(() => userProviderMock),
          ratingRepositoryProvider.overrideWith((ref) => ratingRepository),
          ratingUsecaseProvider.overrideWith((ref) => ratingUsecase),
        ],
      )..listen(userRatingsProvider, listener.call, fireImmediately: true);

      verify(
        () => listener(null, const AsyncLoading<List<RatingEntity>>()),
      );

      // assert
      await expectLater(
        container.read(userRatingsProvider.future),
        completion(isA<GetUserRatingsException>()),
      );
    });
  });
}
