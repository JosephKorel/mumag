import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_simple.freezed.dart';
part 'user_simple.g.dart';

/// Each following or followed user
@freezed
class SocialUserSimple with _$SocialUserSimple {
  factory SocialUserSimple({
    required String id,
    required String name,
    required String avatarUrl,
  }) = _SocialUserSimple;

  factory SocialUserSimple.fromJson(Map<String, dynamic> json) =>
      _$SocialUserSimpleFromJson(json);
}

/// Current user's following and followers
final class UserSocialRelations {
  UserSocialRelations({
    required this.following,
    required this.followers,
  });

  final List<SocialUserSimple> following;
  final List<SocialUserSimple> followers;
}
