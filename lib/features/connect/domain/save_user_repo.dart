import 'package:mumag/common/models/types/api_types.dart';
import 'package:spotify/spotify.dart';

abstract class SaveUserRepository {
  Future<List<String>> favoriteGenres();

  Future<User> spotifyUser();
}

abstract class ControllerRepository {
  ApiResult<void> newUser({required String email});
}
