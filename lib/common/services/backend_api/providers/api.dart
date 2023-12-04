import 'package:dio/dio.dart';
import 'package:mumag/common/services/backend_api/data/api_impl.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';
import 'package:mumag/common/services/backend_api/domain/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api.g.dart';

@riverpod
Dio dioClient(DioClientRef ref) {
  return DioClient.client;
}

@riverpod
ApiRepository api(ApiRef ref) {
  final client = ref.watch(dioClientProvider);
  return ApiImplementation(client);
}
