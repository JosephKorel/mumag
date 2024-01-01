import 'package:dio/dio.dart';

final class DioClient {
  static const _url = 'https://mumag-api.onrender.com';
  static final _config = BaseOptions(
    baseUrl: _url,
  );

  static final Dio client = Dio(_config);
}
