import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';
import 'package:mumag/features/connect/domain/insert_params_repo.dart';
import 'package:mumag/features/connect/domain/save_user_controller.dart';
import 'package:mumag/features/connect/domain/save_user_repo.dart';
import 'package:spotify/spotify.dart';

class UserApiMock extends Mock implements UserApiUsecaseRepository {}

class MockSaveUserRepo extends Mock implements SaveUserRepository {}

class InsertParamsRepositoryMock extends Mock
    implements InsertParamsRepository {}

void main() {
  final saveControllerRepo = MockSaveUserRepo();
  final userApi = UserApiMock();
  final insertParamsMock = InsertParamsRepositoryMock();
  final insertUserController = InsertUserController(insertParamsMock, userApi);

  // Variables
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
      final insertParams = InsertParams(
        email: '',
        name: 'John Doe',
        genres: '',
        avatarUrl: null,
      );

      when(
        () => insertParamsMock.getUserParams(email: ''),
      ).thenAnswer((invocation) async => insertParams);

      final params = await insertParamsMock.getUserParams(email: '');

      when(
        () => userApi.insertUser(insertParams: params),
      ).thenAnswer(
        (invocation) async => UserEntity(
          id: 1,
          name: insertParams.name,
          avatarUrl: insertParams.avatarUrl,
          email: insertParams.email,
          lastUpdatedAt: lastUpdatedAt,
        ),
      );

      // Prepare
      final request = await insertUserController.newUser(email: '').run();

      // assert
      expect(request, isA<Right<AppException, void>>());
    });
  });
}
