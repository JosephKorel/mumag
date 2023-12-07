import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/domain/rating_repository.dart';

final class RatingUsecase {
  RatingUsecase(this._ratingRepository);

  final RatingRepository _ratingRepository;

  ApiResult<void> insertRating({required InsertRatingParams params}) {
    return TaskEither.tryCatch(
      () => _ratingRepository.insertRating(params: params),
      (error, stackTrace) => InsertRatingException(error: error),
    );
  }

  ApiResult<void> updateRating({required UpdateRatingParams params}) {
    return TaskEither.tryCatch(
      () => _ratingRepository.updateRating(params: params),
      (error, stackTrace) => UpdateRatingException(error: error),
    );
  }

  ApiResult<void> deleteRating({required DeleteRatingParams params}) {
    return TaskEither.tryCatch(
      () => _ratingRepository.deleteRating(params: params),
      (error, stackTrace) => DeleteRatingException(error: error),
    );
  }

  ApiResult<List<RatingEntity>> getUserRatings({
    required GetUserRatingParams params,
  }) {
    return TaskEither.tryCatch(
      () => _ratingRepository.getUserRatings(params: params),
      (error, stackTrace) => GetUserRatingsException(error: error),
    );
  }

  ApiResult<List<RatingEntity>> getAllRatings({
    required GetAllRatingParams params,
  }) {
    return TaskEither.tryCatch(
      () => _ratingRepository.getRatings(params: params),
      (error, stackTrace) => GetRatingsException(error: error),
    );
  }
}

final class RatingUsecaseController {
  RatingUsecaseController(this._ratingUsecase);

  final RatingUsecase _ratingUsecase;

  ApiResult<dynamic> call({required RatingsDatabaseEvents event}) {
    return switch (event) {
      InsertRatingParams() => _ratingUsecase.insertRating(params: event),
      GetUserRatingParams() => _ratingUsecase.getUserRatings(params: event),
      UpdateRatingParams() => _ratingUsecase.updateRating(params: event),
      DeleteRatingParams() => _ratingUsecase.deleteRating(params: event),
      GetAllRatingParams() => _ratingUsecase.getAllRatings(params: event),
    };
  }
}
