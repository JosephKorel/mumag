import 'package:mumag/common/models/rating/rating_entity.dart';
import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/rating/data/rating_implementation.dart';
import 'package:mumag/common/services/rating/domain/rating_events.dart';
import 'package:mumag/common/services/rating/domain/rating_repository.dart';
import 'package:mumag/common/services/rating/usecase/rating_usecase.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
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
class UserRatings extends _$UserRatings {
  @override
  FutureOr<List<RatingEntity>> build() async {
    final userId = ref.watch(userProvider).requireValue!.id;
    final request = await ref
        .read(ratingUsecaseProvider)
        .getUserRatings(params: GetUserRatingParams(userId: userId))
        .run();

    return request.fold((l) => throw l, (r) => r);
  }

  void updateState(List<RatingEntity> newState) => state = AsyncData(newState);
}

@riverpod
class RatingHandler extends _$RatingHandler {
  @override
  FutureOr<void> build() {}

  Future<void> call({required RatingsDatabaseEvents event}) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final request =
          await ref.read(ratingControllerProvider)(event: event).run();

      return request.fold(
          (l) => throw AsyncError(l, StackTrace.current), (r) {});
    });
  }
}
