import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';
import 'package:mumag/common/services/social_relations/domain/relations_repository.dart';

class SocialRelationsImplementation extends SocialRelationsRepository {
  SocialRelationsImplementation(this._api);

  final ApiRepository _api;

  static const _path = 'social';

  @override
  Future<void> followUser({required FollowUserEvent followParams}) async {
    try {
      await _api.post(path: '$_path/follow', params: followParams.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> getSocialRelations({
    required GetSocialRelationsEvent socialRelationParams,
  }) async {
    try {
      await _api.get(
          path: '$_path/relations', query: socialRelationParams.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> unfollowUser({required UnfollowUserEvent unfollowParams}) async {
    try {
      await _api.delete(
          path: '$_path/unfollow', params: unfollowParams.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
