// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_simple.freezed.dart';
part 'user_simple.g.dart';

/// Each following or followed user
@freezed
class SocialUserSimple with _$SocialUserSimple {
  factory SocialUserSimple({
    required int id,
    required String name,
    required String avatarUrl,
    required List<String> genres,
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

  factory UserSocialRelations.defaultValue() =>
      UserSocialRelations(following: [], followers: []);

  factory UserSocialRelations.fromMap(Map<String, dynamic> map) {
    return UserSocialRelations(
      following: List<SocialUserSimple>.from(
        (map['following'] as List<dynamic>).map<SocialUserSimple>(
          (x) => SocialUserSimple.fromJson(x as Map<String, dynamic>),
        ),
      ),
      followers: List<SocialUserSimple>.from(
        (map['followers'] as List<dynamic>).map<SocialUserSimple>(
          (x) => SocialUserSimple.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'followers': followers.map((e) => e.toJson()),
      'following': following.map((e) => e.toJson()),
    };
  }
}
