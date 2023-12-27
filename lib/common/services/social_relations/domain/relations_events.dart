sealed class SocialRelationsEvents {}

final class FollowUserEvent extends SocialRelationsEvents {
  FollowUserEvent({
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
  GetSocialRelationsEvent({
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
  UnfollowUserEvent({
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
