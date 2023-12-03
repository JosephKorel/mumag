import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/services/spotify_auth/domain/auth_repository.dart';
import 'package:spotify/spotify.dart';

final class SpotifyAuthController {
  SpotifyAuthController(this._spotifyAuthRepository);

  final SpotifyAuthRepository _spotifyAuthRepository;

  ApiResult<SpotifyApiCredentials> authenticate() {
    return TaskEither.tryCatch(
      () async {
        final credentials = await _spotifyAuthRepository.authenticate();

        return credentials;
      },
      (error, stackTrace) =>
          ApiException(error: error, userMsg: 'You must accept persmissions'),
    );
  }
}
