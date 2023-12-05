import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';

abstract class RatingRepository {
  Future<void> insertRating({required InsertRatingParams params});

  Future<void> updateRating({required UpdateRatingParams params});

  Future<void> deleteRating({required DeleteRatingParams params});

  Future<List<RatingEntity>> getUserRatings({
    required GetUserRatingParams params,
  });
}
