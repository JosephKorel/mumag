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

final class UpdateRatingException extends AppException {
  UpdateRatingException({
    required this.error,
    this.userMsg = 'Could not update rate.',
  });

  final Object error;
  final String userMsg;
}

final class DeleteRatingException extends AppException {
  DeleteRatingException({
    required this.error,
    this.userMsg = 'Something went wrong when deleting your rating.',
  });

  final Object error;
  final String userMsg;
}

final class GetUserRatingsException extends AppException {
  GetUserRatingsException({
    required this.error,
    this.userMsg = 'Could not get your ratings.',
  });

  final Object error;
  final String userMsg;
}

final class GetRatingsException extends AppException {
  GetRatingsException({
    required this.error,
    this.userMsg = 'Could not get ratings.',
  });

  final Object error;
  final String userMsg;
}

// Suggestion
final class InsertSuggestionException extends AppException {
  InsertSuggestionException({
    required this.error,
    this.userMsg = 'Could not send your suggestion.',
  });

  final Object error;
  final String userMsg;
}

final class UpdateSuggestionException extends AppException {
  UpdateSuggestionException({
    required this.error,
    this.userMsg = 'Could not update your suggestion.',
  });

  final Object error;
  final String userMsg;
}

final class DeleteSuggestionException extends AppException {
  DeleteSuggestionException({
    required this.error,
    this.userMsg = 'Could not delete suggestion.',
  });

  final Object error;
  final String userMsg;
}
