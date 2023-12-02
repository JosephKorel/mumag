import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required int id,
    required String name,
    required String? avatarUrl,
    required String email,
    required DateTime lastUpdatedAt,
    @Default([]) List<String> genres,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) {
    final genresKey = json['genres']! as String;
    final lastUpdateKey = json['lastUpdatedAt']! as String;

    return UserEntity(
      id: json['id']! as int,
      name: json['name']! as String,
      email: json['email']! as String,
      avatarUrl: json['avatarUrl'] as String?,
      genres: genresKey.isEmpty ? <String>[] : genresKey.split(','),
      lastUpdatedAt: DateTime.parse(lastUpdateKey),
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
    'lastUpdatedAt': userEntity.lastUpdatedAt.toIso8601String(),
  };
}
