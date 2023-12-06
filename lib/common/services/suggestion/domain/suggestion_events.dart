import 'package:mumag/common/models/suggestion/suggestion_entity.dart';

sealed class SuggestionEvents {}

class InsertSuggestionParams extends SuggestionEvents {
  InsertSuggestionParams({
    required this.suggestedBy,
    required this.suggestedTo,
    required this.spotifyId,
    required this.type,
  });

  final int suggestedBy;
  final int suggestedTo;
  final String spotifyId;
  final SuggestionType type;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'suggestedBy': suggestedBy,
      'suggestedTo': suggestedTo,
      'spotifyId': spotifyId,
      'type': type.name,
    };
  }
}

class UpdateSuggestionParams extends SuggestionEvents {
  UpdateSuggestionParams({
    required this.suggestionId,
    required this.rating,
  });

  final int suggestionId;
  final int rating;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'suggestionId': suggestionId,
      'rating': rating,
    };
  }
}

class DeleteSuggestionParams extends SuggestionEvents {
  DeleteSuggestionParams({
    required this.suggestionId,
  });

  final int suggestionId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'suggestionId': suggestionId,
    };
  }
}
