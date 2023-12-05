import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/domain/rating_repository.dart';

final class RatingUsecase {
  RatingUsecase(this._ratingRepository);

  final RatingRepository _ratingRepository;

  ApiResult<void> insertScore({required InsertRatingParams params}) {
    return TaskEither.tryCatch(
      () => _ratingRepository.insertRating(params: params),
      (error, stackTrace) => InsertRatingException(error: error),
    );
  }

  ApiResult<void> updateRating({required UpdateRatingParams params}) {
    return TaskEither.tryCatch(
      () => _ratingRepository.updateRating(params: params),
      (error, stackTrace) => InsertRatingException(error: error),
    );
  }

  ApiResult<void> deleteRating({required DeleteRatingParams params}) {
    return TaskEither.tryCatch(
      () => _ratingRepository.deleteRating(params: params),
      (error, stackTrace) => InsertRatingException(error: error),
    );
  }

  ApiResult<void> getRating({required GetRatingParams params}) {
    return TaskEither.tryCatch(
      () => _ratingRepository.getRatings(params: params),
      (error, stackTrace) => InsertRatingException(error: error),
    );
  }
}
