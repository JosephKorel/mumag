abstract class ApiRepository {
  Future<Map<String, dynamic>> post({
    required String path,
    required Map<String, dynamic> params,
  });

  Future<Map<String, dynamic>> get({
    required String path,
    required Map<String, dynamic> query,
  });
}
