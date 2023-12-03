import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/features/connect/domain/insert_params_repo.dart';
import 'package:mumag/features/connect/domain/save_user_repo.dart';

class SaveUserController extends ControllerRepository {
  SaveUserController(this._saveUserRepo, this._userApi);

  @override
  ApiResult<void> newUser({required String email}) {
    return TaskEither.tryCatch(
      () async {
        final genres = await _saveUserRepo.favoriteGenres();
        final spotifyUser = await _saveUserRepo.spotifyUser();

        final avatarUrl =
            spotifyUser.images != null ? spotifyUser.images!.first.url : '';

        final insertParams = InsertParams(
          email: email,
          name: spotifyUser.displayName!,
          genres: genres.join(','),
          avatarUrl: avatarUrl,
        );

        await _userApi.insertUser(insertParams: insertParams).run();
      },
      (error, stackTrace) => ApiException(
        error: error,
        userMsg: 'Could not save account, try again later',
      ),
    );
  }

  final SaveUserRepository _saveUserRepo;
  final UserApiUsecaseRepository _userApi;
}

class InsertUserController {
  InsertUserController(this._insertParamsRepository, this._userApi);

  ApiResult<void> newUser({required String email}) {
    return TaskEither.tryCatch(
      () async {
        final insertParams =
            await _insertParamsRepository.getUserParams(email: email);

        await _userApi.insertUser(insertParams: insertParams).run();
      },
      (error, stackTrace) => ApiException(
        error: error,
        userMsg: 'Could not save account, try again later',
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

      final avatarUrl =
          spotifyUser.images != null ? spotifyUser.images!.first.url : '';

      return InsertParams(
        email: email,
        name: spotifyUser.displayName!,
        genres: genres.join(','),
        avatarUrl: avatarUrl,
      );
    } catch (e) {
      rethrow;
    }
  }

  final SaveUserRepository _saveUserRepo;
}
