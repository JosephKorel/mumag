import 'package:fpdart/fpdart.dart';
import 'package:mumag/common/models/exception/exception.dart';
import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/backend_api/providers/api.dart';
import 'package:mumag/common/services/search_users/data/search_implementation.dart';
import 'package:mumag/common/services/search_users/usecase/search_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

@riverpod
SearchUsersImplementation searchUsersImpl(SearchUsersImplRef ref) {
  final api = ref.watch(apiProvider);
  return SearchUsersImplementation(api);
}

@riverpod
SearchUsersUsecase searchUsersUsecase(SearchUsersUsecaseRef ref) {
  final impl = ref.watch(searchUsersImplProvider);
  return SearchUsersUsecase(impl);
}

@riverpod
class SearchValue extends _$SearchValue {
  @override
  String build() {
    return '';
  }

  void onSearch(String value) => state = value;
}

@riverpod
Future<Either<AppException, List<SocialUserSimple>>> searchResult(
  SearchResultRef ref,
) async {
  final value = ref.watch(searchValueProvider);

  var disposed = false;

  ref.onDispose(() {
    disposed = true;
  });

  await Future<void>.delayed(const Duration(milliseconds: 500));

  if (disposed) {
    throw Exception();
  }

  final result = await ref
      .read(searchUsersUsecaseProvider)
      .searchUsers(name: value, limit: 10)
      .run();

  return result;
}
