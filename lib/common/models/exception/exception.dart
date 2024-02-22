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
final class GetUserSuggestionsException extends AppException {
  GetUserSuggestionsException({
    required this.error,
    super.errorMsg = 'Failed to get suggestions.',
  });

  final Object error;
}

final class InsertSuggestionException extends AppException {
  InsertSuggestionException({
    required this.error,
    super.errorMsg = 'Could not send your suggestion.',
  });

  final Object error;
}

final class NotSentSuggestionException extends AppException {
  NotSentSuggestionException({
    required this.error,
    super.errorMsg = 'It seems like this user already knows your suggestion.',
  });

  final Object error;
}

final class RateSuggestionException extends AppException {
  RateSuggestionException({
    required this.error,
    super.errorMsg = 'Failed to rate suggestion.',
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

// Social Relations
final class FollowUserException extends AppException {
  FollowUserException({
    required this.error,
    super.errorMsg = 'Failed to follow user.',
  });

  final Object error;
}

final class GetSocialRelationsException extends AppException {
  GetSocialRelationsException({
    required this.error,
    super.errorMsg = 'Could not load your social circle.',
  });

  final Object error;
}

final class UnfollowException extends AppException {
  UnfollowException({
    required this.error,
    super.errorMsg = 'Failed to unfollow user.',
  });

  final Object error;
}

// Search Users
final class SearchUsersException extends AppException {
  SearchUsersException({
    required this.error,
    super.errorMsg = 'Something went wrong when searching for users.',
  });

  final Object error;
}

// Media
final class GetTrackException extends AppException {
  GetTrackException({
    required this.error,
    super.errorMsg = 'Failed to get track.',
  });

  final Object error;
}

final class GetAlbumException extends AppException {
  GetAlbumException({
    required this.error,
    super.errorMsg = 'Failed to get album.',
  });

  final Object error;
}

final class GetArtistException extends AppException {
  GetArtistException({
    required this.error,
    super.errorMsg = 'Failed to get artist.',
  });

  final Object error;
}
