import 'package:mumag/common/services/rating/domain/rating_events.dart';

abstract class RatingRepository {
  Future<void> insertRating({required InsertRatingParams params});

  Future<void> updateRating({required UpdateRatingParams params});

  Future<void> deleteRating({required DeleteRatingParams params});

  Future<void> getRatings({required GetRatingParams params});
}
