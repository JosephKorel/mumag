sealed class SocialRelationsEvents {
  const SocialRelationsEvents();
}

final class FollowUserEvent extends SocialRelationsEvents {
  const FollowUserEvent({
    required this.currentUserId,
    required this.followingUserId,
  });

  final int currentUserId;
  final int followingUserId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'followerId': currentUserId,
      'followingId': followingUserId,
    };
  }
}

final class GetSocialRelationsEvent extends SocialRelationsEvents {
  const GetSocialRelationsEvent({
    required this.currentUserId,
  });

  final int currentUserId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'followerId': currentUserId,
    };
  }
}

final class UnfollowUserEvent extends SocialRelationsEvents {
  const UnfollowUserEvent({
    required this.currentUserId,
    required this.followingUserId,
  });

  final int currentUserId;
  final int followingUserId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'followerId': currentUserId,
      'followingId': followingUserId,
    };
  }
}
