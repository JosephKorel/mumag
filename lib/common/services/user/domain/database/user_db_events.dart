sealed class UserDatabaseEvents {}

final class InsertParams extends UserDatabaseEvents {
  final String email;
  final String name;

  InsertParams({required this.email, required this.name});
}
