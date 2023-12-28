import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/backend_api/domain/api_repository.dart';

final class SearchUsersImplementation {
  SearchUsersImplementation(this._api);

  final ApiRepository _api;
  static const _path = 'search';

  Future<List<SocialUserSimple>> search({
    required String name,
    required int limit,
  }) async {
    try {
      final result =
          await _api.get(path: _path, query: {'name': name, 'limit': limit});

      return List<SocialUserSimple>.from(result! as List<dynamic>)
          .map((e) => SocialUserSimple.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
