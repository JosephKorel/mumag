import 'package:mumag/common/models/social_relations/user_simple.dart';
import 'package:mumag/common/services/shared_pref/providers/shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_data.g.dart';

const socialRelationsKey = 'userRelations';

@riverpod
UserSocialRelations userRelations(UserRelationsRef ref) {
  final localData = ref.watch(localDataProvider);
  final data =
      localData.getString<Map<String, dynamic>>(key: socialRelationsKey);

  return data == null
      ? UserSocialRelations.defaultValue()
      : UserSocialRelations.fromMap(data);
}
