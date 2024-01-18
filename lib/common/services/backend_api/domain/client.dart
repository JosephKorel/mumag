import 'package:dio/dio.dart';

final class DioClient {
  // static const _url = 'https://mumag-xdh2ttfcta-uc.a.run.app';
  static const _url = 'http://192.168.0.203:3000';
  static final _config = BaseOptions(
    baseUrl: _url,
  );

  static final Dio client = Dio(_config);
}
