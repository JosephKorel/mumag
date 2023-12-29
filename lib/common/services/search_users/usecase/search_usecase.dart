import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/models/types/api_types.dart';
import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/search_users/data/search_implementation.dart';

final class SearchUsersUsecase {
  SearchUsersUsecase(this._searchUsersImplementation);

  final SearchUsersImplementation _searchUsersImplementation;

  ApiResult<List<SocialUserSimple>> searchUsers({
    required String name,
    required int limit,
  }) =>
      TaskEither.tryCatch(
        () => _searchUsersImplementation.search(name: name, limit: limit),
        (error, stackTrace) => SearchUsersException(error: error),
      );

  ApiResult<UserEntity> fetchUser({required int id}) => TaskEither.tryCatch(
        () => _searchUsersImplementation.fetchUser(id: id),
        (error, stackTrace) => SearchUsersException(error: error),
      );
}
