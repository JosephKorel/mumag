sealed class SuccessEvent {
  const SuccessEvent({required this.successMsg});

  final String successMsg;
}

// Rating
final class SuccessMessage extends SuccessEvent {
  SuccessMessage({
    required super.successMsg,
  });
}

// Rating
final class InsertRatingSuccess extends SuccessEvent {
  InsertRatingSuccess({
    super.successMsg = 'Thanks for rating!',
  });
}

final class UpdateRatingSuccess extends SuccessEvent {
  UpdateRatingSuccess({
    super.successMsg = 'Rating updated.',
  });
}

final class DeleteRatingSuccess extends SuccessEvent {
  DeleteRatingSuccess({
    super.successMsg = 'Rating removed.',
  });
}

// Suggestion
final class InsertSuggestionSuccess extends SuccessEvent {
  const InsertSuggestionSuccess({
    super.successMsg = 'Your suggestion was sent!',
  });
}
