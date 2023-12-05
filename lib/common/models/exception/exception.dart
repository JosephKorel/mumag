sealed class AppException extends Error {}

final class ApiException extends AppException {
  ApiException({required this.userMsg, this.error});

  final Object? error;
  final String userMsg;
}

final class CreateUserException extends AppException {
  CreateUserException({
    required this.error,
    this.userMsg = 'Failed to create user',
  });

  final Object error;
  final String userMsg;
}

// Rating
final class InsertRatingException extends AppException {
  InsertRatingException({
    required this.error,
    this.userMsg = 'Something went wrong when adding rate.',
  });

  final Object error;
  final String userMsg;
}
