import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/user/data/api_impl.dart';
import 'package:spotify/spotify.dart';

class ProfileUpdater {
  ProfileUpdater({
    required this.spotifyAccount,
    required this.user,
    required this.userApi,
  });

  final User spotifyAccount;
  final UserEntity user;
  final UserApiUsecase userApi;
}
