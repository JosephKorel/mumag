import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/user/data/api_impl.dart';
import 'package:mumag/common/services/user/domain/database/user_db_events.dart';

class MockApi extends Mock implements ApiRepository {}

void main() {
  final api = MockApi();
  final userApiUsecase = UserApiUsecase(api);
  final insertParams = InsertParams(email: 'joseph@email.com', name: 'Joseph');

  group('api impl ...', () {
    test('Should insert user and return a user entity', () async {
      // arrange
      when(
        () => api.post(path: '/user', params: insertParams.toMap()),
      ).thenAnswer((invocation) async => {...insertParams.toMap(), 'id': 1});

      // prepare
      final user =
          await userApiUsecase.insertUser(insertParams: insertParams).run();

      // assert
      expect(
        user,
        Right<AppException, UserEntity>(
          UserEntity(id: 1, name: insertParams.name, email: insertParams.email),
        ),
      );
    });

    test('Should throw exception and return left', () async {
      // arrange
      when(
        () => api.post(path: '/user', params: insertParams.toMap()),
      ).thenAnswer((_) => throw ApiException(errorMsg: '', userMsg: ''));

      // prepare
      final user =
          await userApiUsecase.insertUser(insertParams: insertParams).run();

      // assert

      expect(
        user,
        isA<Left<AppException, UserEntity>>(),
      );
    });
  });
}
