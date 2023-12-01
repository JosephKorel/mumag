sealed class UserDatabaseEvents {}

class InsertParams extends UserDatabaseEvents {
  InsertParams({required this.email, required this.name});
  final String email;
  final String name;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
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
