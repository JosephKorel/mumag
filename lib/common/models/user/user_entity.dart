import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required int id,
    required String name,
    required String? avatarUrl,
    required String email,
    required DateTime lastUpdatedAt,
    required UserSocialRelations socialRelations,
    @Default(null) String? backgroundUrl,
    @Default([]) List<String> genres,
    @Default([]) List<RatingEntity> ratings,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) {
    final genresKey = json['genres']! as String;
    final backgroundUrlKey = json['backgroundUrl']! as String;
    final lastUpdateKey = json['lastUpdatedAt']! as String;
    final ratingKey = (json['ratings'] as List<dynamic>?) ?? [];

    return UserEntity(
      id: json['id']! as int,
      name: json['name']! as String,
      email: json['email']! as String,
      avatarUrl: json['avatarUrl'] as String?,
      genres: genresKey.isEmpty ? <String>[] : genresKey.split(','),
      backgroundUrl: backgroundUrlKey.isEmpty ? null : backgroundUrlKey,
      lastUpdatedAt: DateTime.parse(lastUpdateKey),
      ratings: ratingKey
          .map(
            (e) => RatingEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      socialRelations: UserSocialRelations.defaultValue(),
    );
  }
}

Map<String, dynamic> userEntityToMap(UserEntity userEntity) {
  return {
    'id': userEntity.id,
    'name': userEntity.name,
    'email': userEntity.email,
    'avatarUrl': userEntity.avatarUrl,
    'genres': userEntity.genres.join(','),
    'backgroundUrl': userEntity.backgroundUrl,
    'lastUpdatedAt': userEntity.lastUpdatedAt.toIso8601String(),
  };
}

Map<String, dynamic> userEntityWithoutId(UserEntity userEntity) {
  return {
    'name': userEntity.name,
    'email': userEntity.email,
    'avatarUrl': userEntity.avatarUrl,
    'genres': userEntity.genres.join(','),
    'backgroundUrl': userEntity.backgroundUrl,
    'lastUpdatedAt': userEntity.lastUpdatedAt.toString(),
  };
}

Map<String, dynamic> userEntityToJson(UserEntity userEntity) {
  return {
    'id': userEntity.id,
    'name': userEntity.name,
    'email': userEntity.email,
    'avatarUrl': userEntity.avatarUrl,
    'genres': userEntity.genres.join(','),
    'backgroundUrl': userEntity.backgroundUrl,
    'lastUpdatedAt': userEntity.lastUpdatedAt.toIso8601String(),
    'socialRelations': userEntity.socialRelations.toJson(),
    'ratings': userEntity.ratings.map((e) => e.toJson()),
  };
}
