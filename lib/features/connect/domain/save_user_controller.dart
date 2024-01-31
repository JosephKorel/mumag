import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/features/connect/domain/insert_params_repo.dart';
import 'package:mumag/features/connect/domain/save_user_repo.dart';

class InsertUserController {
  InsertUserController(this._insertParamsRepository, this._userApi);

  ApiResult<void> newUser({required String email}) {
    return TaskEither.tryCatch(
      () async {
        final insertParams =
            await _insertParamsRepository.getUserParams(email: email);

        await _userApi.insertUser(insertParams: insertParams);
      },
      (error, stackTrace) => ApiException(
        error: error,
        errorMsg: 'Could not save account, try again later',
      ),
    );
  }

  final InsertParamsRepository _insertParamsRepository;
  final UserApiUsecaseRepository _userApi;
}

class InsertParamsImpl extends InsertParamsRepository {
  InsertParamsImpl(this._saveUserRepo);

  @override
  Future<InsertParams> getUserParams({required String email}) async {
    try {
      final genres = await _saveUserRepo.favoriteGenres();
      final spotifyUser = await _saveUserRepo.spotifyUser();
      final backgroundUrl = await _saveUserRepo.getProfileBackground();

      final avatarUrl = spotifyUser.images?.first.url ?? '';

      return InsertParams(
        email: email,
        name: spotifyUser.displayName!,
        genres: genres.join(','),
        avatarUrl: avatarUrl,
        backgroundUrl: backgroundUrl ?? '',
      );
    } catch (e) {
      rethrow;
    }
  }

  final SaveUserRepository _saveUserRepo;
}
