sealed class UserDatabaseEvents {}

class InsertParams extends UserDatabaseEvents {
  final String email;
  final String name;

  InsertParams({required this.email, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
    };
  }
}
