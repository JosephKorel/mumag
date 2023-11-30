import 'package:dio/dio.dart';

final class DioClient {
  static const _url = '192.168.0.203://3000';
  static final _config = BaseOptions(
    baseUrl: _url,
    responseType: ResponseType.json,
  );

  static final Dio client = Dio(_config);
}
