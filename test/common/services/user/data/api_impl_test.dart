import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/user/data/api_impl.dart';
import 'package:mumag/common/services/user/domain/api/api_repository.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';

class UserApiMock extends Mock implements UserApiUsecaseRepository {}

void main() {
  final userApi = UserApiMock();
  final userApiUsecase = UserApiUsecase(userApi);
  final insertParams = InsertParams(
    email: 'joseph@email.com',
    name: 'Joseph',
    genres: '',
    avatarUrl: null,
  );
  final getParams = GetParams(email: 'joseph@email.com');
  final lastUpdatedAt = DateTime.now();
  final insertedUser = UserEntity(
    id: 1,
    name: insertParams.name,
    email: insertParams.email,
    genres: [],
    avatarUrl: null,
    lastUpdatedAt: lastUpdatedAt,
  );

  group('User Api usecase implementation tests', () {
    test('Should insert user and return a user entity', () async {
      // arrange
      when(
        () => userApi.insertUser(insertParams: insertParams),
      ).thenAnswer(
        (invocation) async => insertedUser,
      );

      // prepare
      final user =
          await userApiUsecase.insertUser(insertParams: insertParams).run();

      // assert
      expect(
        user,
        Right<AppException, UserEntity>(
          UserEntity(
            id: 1,
            name: insertParams.name,
            email: insertParams.email,
            genres: [],
            avatarUrl: null,
            lastUpdatedAt: lastUpdatedAt,
          ),
        ),
      );
    });

    test('Should throw exception and return left', () async {
      // arrange
      when(
        () => userApi.insertUser(insertParams: insertParams),
      ).thenAnswer((_) => throw ApiException(error: Object, userMsg: ''));

      // prepare
      final user =
          await userApiUsecase.insertUser(insertParams: insertParams).run();

      // assert

      expect(
        user,
        isA<Left<AppException, UserEntity>>(),
      );
    });

    test('Should return null from get request', () async {
      // arrange
      when(
        () => userApi.getUser(getParams: getParams),
      ).thenAnswer((_) async => null);

      // prepare
      final user = await userApiUsecase.getUser(getParams: getParams).run();

      // assert
      expect(
        user,
        const Right<AppException, UserEntity?>(null),
      );
    });

    test('Should return UserEntity from get request', () async {
      // arrange
      when(
        () => userApi.getUser(getParams: getParams),
      ).thenAnswer(
        (_) async => insertedUser,
      );

      // prepare
      final user = await userApiUsecase.getUser(getParams: getParams).run();

      // assert
      expect(
        user,
        Right<AppException, UserEntity?>(
          UserEntity(
            id: 1,
            name: insertParams.name,
            email: insertParams.email,
            genres: [],
            avatarUrl: null,
            lastUpdatedAt: lastUpdatedAt,
          ),
        ),
      );
    });

    test('Should update user name', () async {
      final initialUser = UserEntity(
        id: 1,
        name: insertParams.name,
        email: insertParams.email,
        genres: [],
        avatarUrl: null,
        lastUpdatedAt: lastUpdatedAt,
      );

      when(
        () => userApi.updateUser(userEntity: initialUser),
      ).thenAnswer(
        (_) async => initialUser.copyWith(name: 'John'),
      );

      // prepare
      final user =
          await userApiUsecase.updateUser(userEntity: initialUser).run();

      // assert
      expect(
        user,
        isA<Right<AppException, UserEntity>>(),
      );

      final updatedUser = user.fold(
        (left) => throw left,
        (right) => right,
      );

      final updatedName = updatedUser.name;

      expect(updatedName, 'John');
    });
  });
}
