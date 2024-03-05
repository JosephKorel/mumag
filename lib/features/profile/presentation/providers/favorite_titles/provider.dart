import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:mumag/common/services/user/providers/user_provider.dart';
import 'package:mumag/common/toast/toast_provider.dart';
import 'package:mumag/features/profile/data/favorite_titles/data_impl.dart';
import 'package:mumag/features/profile/domain/favorite_local.dart';
import 'package:mumag/features/profile/domain/favorite_titles/data_params.dart';
import 'package:mumag/features/profile/domain/favorite_titles/data_repository.dart';
import 'package:mumag/features/profile/domain/favorite_titles/entity.dart';
import 'package:mumag/features/profile/domain/favorite_titles/usecase_impl.dart';
import 'package:mumag/features/profile/domain/favorite_titles/usecase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
FavoriteTitlesDataRepo favTitlesDataRepo(FavTitlesDataRepoRef ref) {
  final api = ref.watch(apiProvider);
  return FavoriteTitlesDataImpl(api);
}

@riverpod
FavoriteTitlesUsecaseRepo favTitlesUsecaseRepo(FavTitlesUsecaseRepoRef ref) {
  final repo = ref.watch(favTitlesDataRepoProvider);
  return FavoriteTitlesUsecaseImpl(repo);
}

@riverpod
FavoriteTitlesUsecase favTitlesUsecase(FavTitlesUsecaseRef ref) {
  final repo = ref.watch(favTitlesUsecaseRepoProvider);

  return FavoriteTitlesUsecase(repo);
}

@riverpod
FavoriteTitlesLocal favTitlesLocal(FavTitlesLocalRef ref) {
  final localStorage = ref.watch(localDataProvider);
  return FavoriteTitlesLocal(localStorage);
}

@riverpod
FavoriteTitlesEntity currentUserFavTitles(
  CurrentUserFavTitlesRef ref,
) {
  return ref.watch(favTitlesLocalProvider).getFavoriteTitles();
}

@riverpod
FutureOr<void> getUserFavTitles(GetUserFavTitlesRef ref) async {
  final authorId = ref.watch(localUserProvider)!.id;
  final usecase = ref.watch(favTitlesUsecaseProvider);
  final localStorage = ref.watch(favTitlesLocalProvider);
  final params = GetUserFavoriteTitlesParams(authorId: authorId);
  final result = await usecase.getFavoriteTitles(params: params).run();

  result.fold(
    (l) {
      ref.read(toastMessageProvider.notifier).onException(exception: l);
    },
    (r) => localStorage.setFavoriteTitles(favoriteTitles: r),
  );
}
