import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/user/data/api_impl.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/features/home/domain/save_user_repo.dart';

class SaveUserController {
  SaveUserController(this._saveUserRepo, this._userApi);

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
  final UserApiUsecase _userApi;
}
