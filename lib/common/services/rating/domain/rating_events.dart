import 'package:mumag/common/models/rating/rating_entity.dart';

class RatingBaseParams {
  RatingBaseParams({
    required this.type,
    required this.spotifyId,
    required this.rating,
  });

  final RatingType type;
  final String spotifyId;
  final int rating;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'spotifyId': spotifyId,
      'rati': rating,
    };
  }
}

sealed class RatingsDatabaseEvents {}

final class InsertRatingParams extends RatingsDatabaseEvents {
  InsertRatingParams({required this.userId, required this.insertParams});

  final int userId;
  final RatingBaseParams insertParams;

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'insertParams': insertParams,
      };
}

final class UpdateRatingParams extends RatingsDatabaseEvents {
  UpdateRatingParams({required this.ratingId, required this.rating});

  final int ratingId;
  final int rating;

  Map<String, dynamic> toMap() => {
        'ratingId': ratingId,
        'rating': rating,
      };
}

final class DeleteRatingParams extends RatingsDatabaseEvents {
  DeleteRatingParams({required this.ratingId});

  final int ratingId;

  Map<String, dynamic> toMap() => {
        'ratingId': ratingId,
      };
}

final class GetUserRatingParams extends RatingsDatabaseEvents {
  GetUserRatingParams({required this.userId});

  final int userId;

  Map<String, dynamic> toMap() => {
        'userId': userId,
      };
}

final class GetAllRatingParams extends RatingsDatabaseEvents {
  GetAllRatingParams({required this.spotifyId});

  final String spotifyId;

  Map<String, dynamic> toMap() => {
        'spotifyId': spotifyId,
      };
}
