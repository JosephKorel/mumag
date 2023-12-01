import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String name,
    required String email,
    @Default([]) List<String> genres,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) {
    final genresKey = json['genres']! as String;

    return UserEntity(
      id: json['id']! as int,
      name: json['name']! as String,
      email: json['email']! as String,
      genres: genresKey.isEmpty ? <String>[] : genresKey.split(','),
    );
  }
}
