import 'package:mumag/common/models/success_events/success_events.dart';
import 'package:mumag/common/models/suggestion/suggestion_entity.dart';

sealed class SuggestionEvents {
  const SuggestionEvents({this.successMsg});

  final SuccessEvent? successMsg;
}

class InsertSuggestionParams extends SuggestionEvents {
  const InsertSuggestionParams({
    required this.suggestedBy,
    required this.suggestedTo,
    required this.spotifyId,
    required this.type,
    super.successMsg = const InsertSuggestionSuccess(),
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

class InsertManySuggestionsParams extends SuggestionEvents {
  const InsertManySuggestionsParams({required this.params});
  final List<InsertSuggestionParams> params;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': params.map((e) => e.toMap()).toList(),
    };
  }
}

class UpdateSuggestionParams extends SuggestionEvents {
  const UpdateSuggestionParams({
    required this.suggestionId,
    required this.rating,
    super.successMsg = const InsertSuggestionSuccess(),
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
  const DeleteSuggestionParams({
    required this.suggestionId,
    super.successMsg = const DeleteSuggestionSuccess(),
  });

  final int suggestionId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'suggestionId': suggestionId,
    };
  }
}

class GetUserSuggestionParams extends SuggestionEvents {
  GetUserSuggestionParams({
    required this.userId,
  });

  final int userId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
    };
  }
}

class GetUserReceivedSuggestionParams extends SuggestionEvents {
  GetUserReceivedSuggestionParams({
    required this.userId,
  });

  final int userId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
    };
  }
}
