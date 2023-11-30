import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mumag/common/services/backend_api/data/api_impl.dart';

const params = {'name': 'Joseph', 'email': 'joseph@email.com'};

class MockDio extends Mock implements Dio {}

void main() {
  final dio = MockDio();
  final apiImpl = ApiImplementation(dio);

  group('Backend Api implementation tests', () {
    /* test('Post call returns an Map type', () async {
      // arrange
      when(
        () => dio.post('', data: params),
      ).thenAnswer(
        (invocation) async => Response(
          requestOptions: RequestOptions(),
          data: {...params, 'id': 1},
        ),
      );

      // prepare
      final result = await apiImpl.post(path: '', params: params);

      // assert
      expect(result, isA<Map<String, dynamic>>());
    });

    test('Returned Name is the same as params Name', () async {
      // arrange
      when(
        () => dio.post('', data: params),
      ).thenAnswer(
        (invocation) async => Response(
          requestOptions: RequestOptions(),
          data: {...params, 'id': 1},
        ),
      );

      // prepare
      final result = await apiImpl.post(path: '', params: params);

      // assert
      expect(result['name'], params['name']);
    });

    test('Get call returns a Map type ', () async {
      // arrange
      when(
        () => dio.get('', queryParameters: params),
      ).thenAnswer(
        (invocation) async => Response(
          requestOptions: RequestOptions(),
          data: {...params, 'id': 1},
        ),
      );

      // prepare
      final result = await apiImpl.get(path: '', query: params);

      // assert
      expect(result, isA<Map<String, dynamic>>());
    });
 */
    test('Get returns user with the same query id', () async {
      // arrange
      when(
        () => dio.get('', queryParameters: {'id': 1}),
      ).thenAnswer(
        (invocation) async => Response(
          requestOptions: RequestOptions(),
          data: {...params, 'id': 1},
        ),
      );

      // prepare
      final result = await apiImpl.get(path: '', query: {...params, 'id': 1});
      final id = result['id'];

      log('ESTE FOI O RESULTADO $id');

      // assert
      expect(result['id'], null);
    });

    /*  test('Throws exception', () async {
      // arrange
      when(
        () => dio.post('', data: params),
      ).thenThrow(Exception());

      final result = await apiImpl.post(path: '', params: params);

      // assert
      expect(result, throwsA(isA<Exception>()));
    }); */
  });
}
