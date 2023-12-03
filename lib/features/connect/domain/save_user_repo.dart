import 'package:spotify/spotify.dart';

abstract class SaveUserRepository {
  Future<List<String>> favoriteGenres();

  Future<User> spotifyUser();
}
