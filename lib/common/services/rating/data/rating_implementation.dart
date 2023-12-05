import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/domain/rating_repository.dart';

final class RatingRepositoryImpl extends RatingRepository {
  RatingRepositoryImpl(this._repository);

  final ApiRepository _repository;

  static const path = '/rating';

  @override
  Future<void> insertRating({required InsertRatingParams params}) async {
    try {
      await _repository.post(path: path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateRating({required UpdateRatingParams params}) async {
    try {
      await _repository.put(path: path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteRating({required DeleteRatingParams params}) async {
    try {
      await _repository.delete(path: path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> getRatings({required GetRatingParams params}) async {
    try {
      await _repository.get(path: path, query: params.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
