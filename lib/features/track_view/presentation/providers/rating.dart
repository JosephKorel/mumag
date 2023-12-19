import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/providers/rating.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/features/track_view/presentation/providers/track.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating.g.dart';

@riverpod
Future<Either<AppException, dynamic>> rateTrack(
  RateTrackRef ref, {
  required int rateValue,
}) async {
  final user = ref.watch(userProvider).requireValue!;
  final track = ref.watch(viewingTrackProvider)!;

  final ratingBaseParams = RatingBaseParams(
    type: RatingType.track,
    spotifyId: track.id!,
    rating: rateValue,
  );

  final insertRatingParams =
      InsertRatingParams(userId: user.id, insertParams: ratingBaseParams);

  final result = await ref
      .read(ratingControllerProvider)
      .call(event: insertRatingParams)
      .run();

  if (result.isRight()) {
    ref.invalidate(trackRatingProvider);
  }

  return result;
}
