import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/domain/rating_repository.dart';

final class RatingRepositoryImpl extends RatingRepository {
  RatingRepositoryImpl(this._repository);

  final ApiRepository _repository;

  static const _path = '/rating';

  @override
  Future<void> insertRating({required InsertRatingParams params}) async {
    try {
      await _repository.post(path: _path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateRating({required UpdateRatingParams params}) async {
    try {
      await _repository.put(path: _path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteRating({required DeleteRatingParams params}) async {
    try {
      await _repository.delete(path: _path, params: params.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RatingEntity>> getUserRatings({
    required GetUserRatingParams params,
  }) async {
    try {
      final request = await _repository.get(
        path: '$_path/user-ratings',
        query: params.toMap(),
      );
      final ratings = request!['ratings']! as List<dynamic>;
      return ratings
          .map((e) => RatingEntity.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RatingEntity>> getRatings({
    required GetAllRatingParams params,
  }) async {
    try {
      final request = await _repository.get(
        path: _path,
        query: params.toMap(),
      );
      final ratings = request!['ratings']! as List<dynamic>;
      return ratings
          .map((e) => RatingEntity.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
