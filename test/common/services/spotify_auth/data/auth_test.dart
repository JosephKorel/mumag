import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/services/spotify_auth/data/auth.dart';
import 'package:mumag/common/services/spotify_auth/domain/auth_repository.dart';
import 'package:spotify/spotify.dart';

class SpotifyAuthRepositoryMock extends Mock implements SpotifyAuthRepository {}

void main() {
  final authRepository = SpotifyAuthRepositoryMock();
  final authController = SpotifyAuthController(authRepository);
  final spotifyCredentials = SpotifyApiCredentials(
    '',
    '',
    accessToken: '',
    refreshToken: '',
  );

  group('Tests for spotify auth controller', () {
    test('Should return Left when user does not grant permission', () async {
      // arrange
      when(authRepository.authenticate).thenThrow(Exception());

      // prepare
      final request = await authController.authenticate().run();

      // assert
      expect(request, isA<Left<AppException, SpotifyApiCredentials>>());
    });
    test('Should return Right when user grants permission', () async {
      // arrange
      when(authRepository.authenticate)
          .thenAnswer((invocation) async => spotifyCredentials);

      // prepare
      final request = await authController.authenticate().run();

      // assert
      expect(request, isA<Right<AppException, SpotifyApiCredentials>>());
    });
  });
}
