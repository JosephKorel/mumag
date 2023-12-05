import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/domain/rating_repository.dart';
import 'package:mumag/common/services/rating/usecase/rating_usecase.dart';

class RatingRepositoryMock extends Mock implements RatingRepository {}

void main() {
  final ratingRepository = RatingRepositoryMock();
  final ratingUsecase = RatingUsecase(ratingRepository);
  const userId = 1;
  final insertRatingParams = InsertRatingParams(
    userId: userId,
    insertParams:
        RatingBaseParams(type: RatingType.album, spotifyId: '', rating: 4),
  );
  final getUserRatingParams = GetUserRatingParams(userId: userId);

  group('Tests for rating usecase implementation', () {
    test('Insert rating and return Right type', () async {
      // arrange
      when(() => ratingRepository.insertRating(params: insertRatingParams))
          .thenAnswer((invocation) async => {});

      // prepare
      final request =
          await ratingUsecase.insertRating(params: insertRatingParams).run();

      // assert
      expect(request, isA<Right<AppException, void>>());
    });

    test('Get user ratings and return Right type', () async {
      // arrange
      when(
        () => ratingRepository.getUserRatings(
          params: getUserRatingParams,
        ),
      ).thenAnswer((invocation) async => []);

      // prepare
      final request =
          await ratingUsecase.getUserRatings(params: getUserRatingParams).run();

      // assert
      expect(request, isA<Right<AppException, List<RatingEntity>>>());
    });
  });
}
