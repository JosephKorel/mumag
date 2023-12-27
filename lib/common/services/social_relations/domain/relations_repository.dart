import 'package:mumag/common/services/social_relations/domain/relations_events.dart';

abstract class SocialRelationsRepository {
  Future<void> followUser({required FollowUserEvent followParams});

  Future<void> getSocialRelations({
    required GetSocialRelationsEvent socialRelationParams,
  });

  Future<void> unfollowUser({required UnfollowUserEvent unfollowParams});
}
