sealed class AppException extends Error {
  AppException({required this.errorMsg});

  final String errorMsg;
}

final class ApiException extends AppException {
  ApiException({required super.errorMsg, this.error});

  final Object? error;
}

final class CreateUserException extends AppException {
  CreateUserException({
    required this.error,
    super.errorMsg = 'Failed to create user',
  });

  final Object error;
}

// Rating
final class InsertRatingException extends AppException {
  InsertRatingException({
    required this.error,
    super.errorMsg = 'Something went wrong when adding rate.',
  });

  final Object error;
}

final class UpdateRatingException extends AppException {
  UpdateRatingException({
    required this.error,
    super.errorMsg = 'Could not update rate.',
  });

  final Object error;
}

final class DeleteRatingException extends AppException {
  DeleteRatingException({
    required this.error,
    super.errorMsg = 'Something went wrong when deleting your rating.',
  });

  final Object error;
}

final class GetUserRatingsException extends AppException {
  GetUserRatingsException({
    required this.error,
    super.errorMsg = 'Could not get your ratings.',
  });

  final Object error;
}

final class GetRatingsException extends AppException {
  GetRatingsException({
    required this.error,
    super.errorMsg = 'Could not get ratings.',
  });

  final Object error;
}

// Suggestion
final class InsertSuggestionException extends AppException {
  InsertSuggestionException({
    required this.error,
    super.errorMsg = 'Could not send your suggestion.',
  });

  final Object error;
}

final class UpdateSuggestionException extends AppException {
  UpdateSuggestionException({
    required this.error,
    super.errorMsg = 'Could not update your suggestion.',
  });

  final Object error;
}

final class DeleteSuggestionException extends AppException {
  DeleteSuggestionException({
    required this.error,
    super.errorMsg = 'Could not delete suggestion.',
  });

  final Object error;
}
