import 'package:mumag/common/models/rating/rating_entity.dart';

class MediaEntity {
  MediaEntity({
    required this.name,
    required this.spotifyId,
    required this.type,
    required this.imageUrl,
  });

  final String name;
  final String spotifyId;
  final RatingType type;
  final String? imageUrl;
}
