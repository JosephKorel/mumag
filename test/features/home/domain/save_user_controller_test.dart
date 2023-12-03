import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/user/data/api_impl.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/features/connect/domain/save_user_controller.dart';
import 'package:mumag/features/connect/domain/save_user_repo.dart';
import 'package:spotify/spotify.dart';

class MockApi extends Mock implements ApiRepository {}

class MockSaveUserRepo extends Mock implements SaveUserRepository {}

void main() {
  final api = MockApi();
  final saveControllerRepo = MockSaveUserRepo();
  final userApiUsecase = UserApiUsecase(api);
  final saveUserController =
      SaveUserController(saveControllerRepo, userApiUsecase);
  const genres = ['metal'];
  final lastUpdatedAt = DateTime.now();

  group('Test for user creation', () {
    test('Should get string list', () async {
      // arrange
      when(
        saveControllerRepo.favoriteGenres,
      ).thenAnswer((invocation) async => genres);

      // prepare
      final genresResult = await saveControllerRepo.favoriteGenres();

      expect(genresResult, genres);
    });

    test('Should get spotify user with displayName', () async {
      // arrange
      when(saveControllerRepo.spotifyUser).thenAnswer(
        (invocation) async =>
            User.fromJson({'display_name': 'John', 'images': null}),
      );

      // prepare
      final genresResult = await saveControllerRepo.spotifyUser();

      expect(genresResult.displayName, 'John');
    });

    test('Should insert new user', () async {
      // arrange

      when(
        saveControllerRepo.favoriteGenres,
      ).thenAnswer((invocation) async => genres);

      when(saveControllerRepo.spotifyUser).thenAnswer(
        (invocation) async =>
            User.fromJson({'display_name': 'John', 'images': null}),
      );

      final spotifyUser = await saveControllerRepo.spotifyUser();
      final fetchedGenres = await saveControllerRepo.favoriteGenres();

      final insertParams = InsertParams(
        email: '',
        name: spotifyUser.displayName!,
        genres: fetchedGenres.join(','),
        avatarUrl: null,
      );

      when(
        () => userApiUsecase.insertUser(insertParams: insertParams).run(),
      ).thenAnswer(
        (invocation) async => Right<AppException, UserEntity>(
          UserEntity(
            id: 1,
            name: insertParams.name,
            avatarUrl: insertParams.avatarUrl,
            email: insertParams.email,
            lastUpdatedAt: lastUpdatedAt,
          ),
        ),
      );

      // Prepare
      final request = await saveUserController.newUser(email: '').run();

      // assert
      expect(request, isA<Right<AppException, void>>());
    });
  });
}
