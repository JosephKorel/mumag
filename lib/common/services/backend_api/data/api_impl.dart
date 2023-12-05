import 'package:dio/dio.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';

final class ApiImplementation extends ApiRepository {
  ApiImplementation(this._client);

  final Dio _client;

  @override
  Future<Map<String, dynamic>> post({
    required String path,
    required Map<String, dynamic> params,
  }) async {
    try {
      final result =
          await _client.post<Map<String, dynamic>>(path, data: params);

      return result.data!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> get({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    try {
      final result = await _client.get<Map<String, dynamic>?>(
        path,
        queryParameters: query,
      );

      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> put({
    required String path,
    required Map<String, dynamic> params,
  }) async {
    try {
      final result = await _client.put<Map<String, dynamic>?>(
        path,
        data: params,
      );

      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> delete({
    required String path,
    required Map<String, dynamic> params,
  }) async {
    try {
      final result = await _client.delete<Map<String, dynamic>?>(
        path,
        queryParameters: params,
      );

      return result.data;
    } catch (e) {
      rethrow;
    }
  }
}
