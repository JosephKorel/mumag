import 'package:mumag/common/models/user/user_entity.dart';
import 'package:mumag/common/services/search_users/providers/search.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_user.g.dart';

@riverpod
class ViewingUserId extends _$ViewingUserId {
  @override
  int? build() {
    return null;
  }

  void selectUser(int id) => state = id;
}

@riverpod
Future<UserEntity> viewingUserProfile(
  ViewingUserProfileRef ref,
) async {
  final userId = ref.watch(viewingUserIdProvider);
  final user =
      await ref.watch(searchUsersUsecaseProvider).fetchUser(id: userId!).run();

  return user.fold((l) => throw l, (r) => r);
}
