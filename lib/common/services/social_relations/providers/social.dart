import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/social_relations/data/relations_implementation.dart';
import 'package:mumag/common/services/social_relations/domain/relations_events.dart';
import 'package:mumag/common/services/social_relations/domain/relations_repository.dart';
import 'package:mumag/common/services/social_relations/usecase/relations_usecase.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'social.g.dart';

@riverpod
SocialRelationsRepository socialRelationsRepo(SocialRelationsRepoRef ref) {
  final api = ref.watch(apiProvider);
  return SocialRelationsImplementation(api);
}

@riverpod
SocialRelationsUsecase socialRelationsUsecase(SocialRelationsUsecaseRef ref) {
  final repository = ref.watch(socialRelationsRepoProvider);
  return SocialRelationsUsecase(repository);
}

@riverpod
SocialRelationsController socialController(SocialControllerRef ref) {
  final usecase = ref.watch(socialRelationsUsecaseProvider);
  return SocialRelationsController(usecase);
}

@riverpod
class SocialHandler extends _$SocialHandler {
  @override
  FutureOr<void> build() {}

  Future<void> onAction(
    SocialRelationsEvents event,
    Future<void> Function()? sideEffect,
  ) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await ref.read(socialControllerProvider)(event).run();

      result.fold(
          (l) =>
              ref.read(toastMessageProvider.notifier).onException(exception: l),
          (r) async {
        if (sideEffect != null) {
          await sideEffect();
        }
      });
    });
  }
}
