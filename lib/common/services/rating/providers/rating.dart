import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/rating/data/rating_implementation.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/domain/rating_repository.dart';
import 'package:mumag/common/services/rating/usecase/rating_usecase.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rating.g.dart';

@riverpod
RatingRepository ratingRepository(RatingRepositoryRef ref) {
  final api = ref.watch(apiProvider);
  return RatingRepositoryImpl(api);
}

@riverpod
RatingUsecase ratingUsecase(RatingUsecaseRef ref) {
  final ratingRepository = ref.watch(ratingRepositoryProvider);

  return RatingUsecase(ratingRepository);
}

@riverpod
RatingUsecaseController ratingController(RatingControllerRef ref) {
  final ratingUsecase = ref.watch(ratingUsecaseProvider);

  return RatingUsecaseController(ratingUsecase);
}

@riverpod
FutureOr<List<RatingEntity>> getUserRatings(GetUserRatingsRef ref) async {
  final userId = ref.watch(userProvider).requireValue!.id;
  final request = await ref
      .read(ratingUsecaseProvider)
      .getUserRatings(params: GetUserRatingParams(userId: userId))
      .run();

  return request.fold((l) => throw l, (r) => r);
}

@riverpod
FutureOr<List<RatingEntity>> userRatings(UserRatingsRef ref) async {
  final userId = ref.watch(userProvider).requireValue!.id;
  final request = await ref
      .read(ratingUsecaseProvider)
      .getUserRatings(params: GetUserRatingParams(userId: userId))
      .run();

  return request.fold((l) => [], (r) => r);
}

@riverpod
class RatingHandler extends _$RatingHandler {
  @override
  FutureOr<void> build() {}

  Future<void> call({
    required RatingsDatabaseEvents event,
    required bool shouldUpdateUser,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final request =
          await ref.read(ratingControllerProvider)(event: event).run();

      return request.fold(
        (l) {
          ref.read(toastMessageProvider.notifier).onException(exception: l);
          throw l;
        },
        (r) {
          if (shouldUpdateUser) {
            ref.read(userProvider.notifier).updateRatings();
          }
        },
      );
    });
  }
}

@riverpod
Future<List<RatingEntity>?> mediaRating(
  MediaRatingRef ref, {
  required String spotifyId,
}) async {
  final ratingController = ref.watch(ratingControllerProvider);

  final rating =
      await ratingController(event: GetAllRatingParams(spotifyId: spotifyId))
          .run();

  return rating.fold(
    (l) => null,
    (r) => r as List<RatingEntity>,
  );
}

@riverpod
class RateMedia extends _$RateMedia {
  @override
  FutureOr<void> build() async {}

  Future<void> call({
    required RatingsDatabaseEvents event,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final ratingController = ref.watch(ratingControllerProvider);

      final request = await ratingController(event: event).run();
      request.fold(
        (l) =>
            ref.read(toastMessageProvider.notifier).onException(exception: l),
        (r) {},
      );
    });
  }
}
