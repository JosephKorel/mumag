sealed class UserDatabaseEvents {}

class InsertParams extends UserDatabaseEvents {
  InsertParams({
    required this.email,
    required this.name,
    required this.genres,
    required this.avatarUrl,
  });

  final String email;
  final String name;
  final String genres;
  final String? avatarUrl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'genres': genres,
      'avatarUrl': avatarUrl,
    };
  }
}

class GetParams extends UserDatabaseEvents {
  GetParams({required this.email});
  final String email;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }
}

class UpdateGenresParam extends UserDatabaseEvents {
  UpdateGenresParam({required this.userId, required this.genres});
  final int userId;
  final String genres;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'genres': genres,
    };
  }
}
